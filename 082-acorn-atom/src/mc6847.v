module mc6847 (
               input             clk,
               input             clk_ena,
               input             reset,
               output            da0,
               output reg [12:0] videoaddr,
               input [7:0]       dd,
               output            hs_n,
               output            fs_n,
               input             an_g,
               input             an_s,
               input             intn_ext,
               input [2:0]       gm,
               input             css,
               input             inv,
               output reg [3:0]  red,
               output reg [3:0]  green,
               output reg [3:0]  blue,
               output reg        hsync,
               output reg        vsync,
               output reg        hblank,
               output reg        vblank,
               input             artifact_en,
               input             artifact_set,
               input             artifact_phase,
               output [7:0]      cvbs,
               input             black_backgnd,
               output reg [10:0] char_a,
               input [7:0]       char_d_o
               );
   
   parameter CVBS_NOT_VGA       = 0;
   
   parameter H_FRONT_PORCH      = 8;
   parameter H_HORIZ_SYNC       = H_FRONT_PORCH + 48;
   parameter H_BACK_PORCH       = H_HORIZ_SYNC + 24;
   parameter H_LEFT_BORDER      = H_BACK_PORCH + 32;  // adjust for hblank de-assert @sys_count=6
   parameter H_LEFT_RSTADDR     = H_LEFT_BORDER - 16;
   parameter H_VIDEO            = H_LEFT_BORDER + 256;
   parameter H_RIGHT_BORDER     = H_VIDEO + 31;
   parameter H_TOTAL_PER_LINE   = H_RIGHT_BORDER;
   
   parameter V2_FRONT_PORCH     = 2;
   parameter V2_VERTICAL_SYNC   = V2_FRONT_PORCH + 2;
   parameter V2_BACK_PORCH      = V2_VERTICAL_SYNC + 12;
   parameter V2_TOP_BORDER      = V2_BACK_PORCH + 26;  // + 25;  // +25 for PAL
   parameter V2_VIDEO           = V2_TOP_BORDER + 192;
   parameter V2_BOTTOM_BORDER   = V2_VIDEO + 27;  // + 25;       // +25 for PAL
   parameter V2_TOTAL_PER_FIELD = V2_BOTTOM_BORDER;
   
   // internal version of control ports
   wire                          an_g_s;
   wire                          an_s_s;
   wire                          intn_ext_s;
   wire [2:0]                    gm_s;
   wire                          css_s;
   wire                          inv_s;
   
   // VGA signals
   reg                           vga_hsync;
   reg                           vga_vsync;
   reg                           vga_hblank;
   reg                           vga_vblank;
   reg [8:0]                     vga_linebuf_addr;
   reg [7:0]                     vga_char_d_o;
   reg                           vga_hborder;
   reg                           vga_vborder;
   
   // CVBS signals
   reg                           cvbs_clk_ena;  // PAL/NTSC*2
   reg                           cvbs_hsync;
   reg                           cvbs_vsync;
   reg                           cvbs_hblank;
   reg                           cvbs_vblank;
   //wire                    cvbs_hborder; // unused
   reg                           cvbs_vborder;
   wire                          cvbs_linebuf_we;
   reg [8:0]                     cvbs_linebuf_addr;
   
   reg                           active_h_start = 1'b0;
   reg                           an_s_r;
   reg                           inv_r;
   reg                           intn_ext_r;
   reg [7:0]                     dd_r;
   reg [7:0]                     pixel_char_d_o;
   reg [7:0]                     cvbs_char_d_o;
   wire                          hs_int = cvbs_hblank;
   reg                           fs_int;
   reg [4:0]                     da0_int;
   
   // character rom signals
   reg                           cvbs_linebuf_we_r;
   reg [8:0]                     cvbs_linebuf_addr_r;
   reg                           cvbs_linebuf_we_rr;
   reg [8:0]                     cvbs_linebuf_addr_rr;
   
   reg [5:0]                     lookup;
   reg [7:0]                     tripletaddr;
   reg [1:0]                     tripletcnt;
   
   // *******************************************************8
   
   // TODO: Initialize with 0xFF
   reg [7:0]                     VRAM [0:511];
   
   // *******************************************************8
   
   // used by both CVBS and VGA
   reg [8:0]                     v_count;
   reg [3:0]                     row_v;
   
   
   function [11:0] map_palette;
      input [7:0]                vga_char_d_o;
      // parts of input
      reg                        css_v;
      reg                        an_g_v;
      reg                        an_s_v;
      reg                        luma;
      reg [2:0]                  chroma;
      // parts of output
      reg [1:0]                  r;
      reg [1:0]                  g;
      reg [1:0]                  b;
      
      begin
         css_v  = vga_char_d_o[6];
         an_g_v = vga_char_d_o[5];
         an_s_v = vga_char_d_o[4];
         luma   = vga_char_d_o[3];
         chroma = vga_char_d_o[2:0];
         
         if (luma)
           begin
              case (chroma)
                3'b000: begin r = 2'b00; g = 2'b11; b=2'b00; end // green
                3'b001: begin r = 2'b11; g = 2'b11; b=2'b00; end // yellow
                3'b010: begin r = 2'b00; g = 2'b00; b=2'b11; end // blue
                3'b011: begin r = 2'b11; g = 2'b00; b=2'b00; end // red
                3'b100: begin r = 2'b11; g = 2'b11; b=2'b11; end // white
                3'b101: begin r = 2'b00; g = 2'b11; b=2'b11; end // cyan
                3'b110: begin r = 2'b11; g = 2'b00; b=2'b11; end // magenta
                3'b111: begin r = 2'b11; g = 2'b11; b=2'b00; end // orange
              endcase
           end
         else
           begin
              // not quite black in alpha mode
              if (black_backgnd == 1'b0 && an_g_v == 1'b0 && an_s_v == 1'b0)
                begin
                   // dark green/orange
                   r = {1'b0 , css_v};
                   g = 2'b01;
                end
              else
                begin
                   r = 2'b00;
                   g = 2'b00;
                end
              b = 2'b00;
           end
         map_palette = { r, 2'b0, g, 2'b0, b, 2'b0};
      end
   endfunction
   
   // assign control inputs for debug/release build
   assign an_g_s     = an_g;
   assign an_s_s     = an_s;
   assign intn_ext_s = intn_ext;
   assign gm_s       = gm;
   assign css_s      = css;
   assign inv_s      = inv;
   
   // generate the clocks
   reg toggle;
   always @(posedge clk, posedge reset)
     begin
        if (reset)
          begin
             toggle       <= 1'b0;
             cvbs_clk_ena <= 1'b0;
          end
        else
          begin
             cvbs_clk_ena <= 1'b0;
             if (clk_ena)
               begin
                  cvbs_clk_ena <= toggle;
                  toggle       <= !toggle;
               end
          end
     end
   
   // generate horizontal timing for VGA
   // generate line buffer address for reading VGA char_d_o
   
   reg [8:0] vga_h_count;
   reg [7:0] vga_active_h_count;
   reg       vga_vblank_r;
   
   always @(posedge clk, posedge reset)
     begin
        if (reset)
          begin
             vga_h_count    = 0;
             vga_hsync  <= 1'b1;
             vga_vsync  <= 1'b1;
             vga_hblank <= 1'b0;
          end
        else if (clk_ena)
          begin
             // start hsync when cvbs comes out of vblank
             if (vga_vblank_r == 1'b1 && vga_vblank == 1'b0)
               begin
                  vga_h_count = 0;
               end
             else
               begin
                  if (vga_h_count == H_TOTAL_PER_LINE)
                    begin
                       vga_h_count = 0;
                       vga_hborder <= 1'b0;
                    end
                  else
                    begin
                       vga_h_count = vga_h_count + 1;
                    end
                  
                  if (vga_h_count == H_FRONT_PORCH)
                    vga_hsync <= 1'b0;
                  else if (vga_h_count == H_HORIZ_SYNC)
                    vga_hsync <= 1'b1;
                  else if (vga_h_count == H_BACK_PORCH)
                    vga_hborder <= 1'b1;
                  else if (vga_h_count == H_LEFT_BORDER+1)
                    vga_hblank <= 1'b0;
                  else if (vga_h_count == H_VIDEO+1)
                    vga_hblank <= 1'b1;
                  else if (vga_h_count == H_RIGHT_BORDER)
                    vga_hborder <= 1'b0;
                  
                  if (vga_h_count == H_LEFT_BORDER)
                    vga_active_h_count = 8'b11111111;
                  else
                    vga_active_h_count = vga_active_h_count + 1;
               end
             
             // vertical syncs, blanks are the same
             vga_vsync        <= cvbs_vsync;
             // generate linebuffer address
             // - alternate every 2nd line
             vga_linebuf_addr <= {!v_count[0], vga_active_h_count};
             vga_vblank_r     = vga_vblank;
          end
     end
   
   // generate horizontal timing for CVBS
   // generate line buffer address for writing CVBS char_d_o
   
   reg [8:0] h_count;
   reg [7:0] active_h_count;
   reg       cvbs_hblank_r;
   reg [12:0] videoaddr_base;
   
   always @(posedge clk, posedge reset)
     begin
        if (reset)
          begin
             fs_int         <= 1'b0;
             h_count        = H_TOTAL_PER_LINE;
             v_count        = V2_TOTAL_PER_FIELD;
             active_h_count = 0;
             active_h_start <= 1'b0;
             cvbs_hsync     <= 1'b1;
             cvbs_vsync     <= 1'b1;
             cvbs_hblank    <= 1'b0;
             cvbs_vblank    <= 1'b1;
             vga_vblank     <= 1'b1;
             da0_int        <= 0;
             cvbs_hblank_r  = 1'b0;
             row_v          = 0;
          end
        else if (cvbs_clk_ena)
          begin
             active_h_start <= 1'b0;
             if (h_count == H_TOTAL_PER_LINE)
               begin
                  h_count = 0;
                  if (v_count == V2_TOTAL_PER_FIELD)
                    v_count = 0;
                  else
                    v_count = v_count + 1;
                  
                  // VGA vblank is 1 line behind CVBS
                  // - because we need to fill the line buffer
                  vga_vblank <= cvbs_vblank;
                  
                  if (v_count == V2_FRONT_PORCH)
                    begin
                       cvbs_vsync <= 1'b0;
                    end
                  else if (v_count == V2_VERTICAL_SYNC)
                    begin
                       cvbs_vsync <= 1'b1;
                       fs_int <= 1'b0;
                    end
                  else if (v_count == V2_BACK_PORCH)
                    begin
                       cvbs_vborder <= 1'b1;
                    end
                  else if (v_count == V2_TOP_BORDER)
                    begin
                       cvbs_vblank    <= 1'b0;
                       row_v          = 0;
                       videoaddr_base = 0;
                       tripletaddr    <= 0;
                       tripletcnt     <= 0;
                    end
                  else if (v_count == V2_VIDEO)
                    begin
                       cvbs_vblank <= 1'b1;
                       fs_int <= 1'b1;
                    end
                  else if (v_count == V2_BOTTOM_BORDER)
                    begin
                       cvbs_vborder <= 1'b0;
                    end
                  else
                    begin
                       if (an_g_s == 1'b0)
                         begin
                            if (row_v == 11)
                              videoaddr_base = videoaddr_base + 32;
                         end
                       else
                         begin
                            case (gm)
                              3'b000,3'b001:
                                if (tripletcnt == 2)
                                  videoaddr_base = videoaddr_base + 16;
                              3'b010:
                                if (tripletcnt == 2)
                                  videoaddr_base = videoaddr_base + 32;
                              3'b011:
                                if (row_v[0] == 1'b1)
                                  videoaddr_base = videoaddr_base + 16;
                              3'b100:
                                if (row_v[0] == 1'b1)
                                  videoaddr_base = videoaddr_base + 32;
                              3'b101:
                                videoaddr_base = videoaddr_base + 16;
                              3'b110, 3'b111:
                                videoaddr_base = videoaddr_base + 32;
                            endcase
                         end
                       if (tripletcnt == 2)  // mode 1,1a,2a
                         begin
                            tripletcnt  <= 0;
                            tripletaddr <= tripletaddr + 1;
                         end
                       else
                         begin
                            tripletcnt <= tripletcnt + 1;
                         end
                       if (row_v == 11)
                         row_v = 0;
                       else
                         row_v = row_v + 1;
                    end
               end
             else
               begin
                  h_count = h_count + 1;
                  
                  if (h_count == H_FRONT_PORCH)
                    cvbs_hsync <= 1'b0;
                  else if (h_count == H_HORIZ_SYNC)
                    cvbs_hsync <= 1'b1;
                  else if (h_count == H_BACK_PORCH)
                    ;
                  else if (h_count == H_LEFT_RSTADDR)
                    active_h_count = 0;
                  else if (h_count == H_LEFT_BORDER)
                    begin
                       cvbs_hblank    <= 1'b0;
                       active_h_start <= 1'b1;
                    end
                  else if (h_count == H_VIDEO)
                    begin
                       cvbs_hblank    <= 1'b1;
                       active_h_count = active_h_count + 1;
                    end
                  else if (h_count == H_RIGHT_BORDER)
                    ;
                  else
                    active_h_count = active_h_count + 1;
               end
             
             // generate character rom address
             char_a <= { dd[6:0], row_v[3:0] };
             
             // DA0 high during FS
             if (cvbs_vblank == 1'b1)
               da0_int <= 5'b11111;
             else if (cvbs_hblank == 1'b1)
               da0_int <= 5'b00000;
             else if (cvbs_hblank_r == 1'b1 && cvbs_hblank == 1'b0)
               da0_int <= 5'b01000;
             else
               da0_int <= da0_int + 1;
             
             
             cvbs_linebuf_addr    <= { v_count[0], active_h_count };
             // pipeline writes to linebuf because char_d_o is delayed 1 clock as well!
             cvbs_linebuf_we_r    <= cvbs_linebuf_we;
             cvbs_linebuf_addr_r  <= cvbs_linebuf_addr;
             cvbs_linebuf_we_rr   <= cvbs_linebuf_we_r;
             cvbs_linebuf_addr_rr <= cvbs_linebuf_addr_r;
             cvbs_hblank_r        = cvbs_hblank;
             
             if (an_g_s == 1'b0)
               begin
                  lookup[4:0] <= active_h_count[7:3] + 1;
                  videoaddr   <= { videoaddr_base[12:5] , lookup[4:0]};
               end
             else
               begin
                  case (gm)
                    3'b000, 3'b001, 3'b011, 3'b101:
                      begin
                         lookup[3:0] <= active_h_count[7:4] + 1;
                         videoaddr   <= { videoaddr_base[12:4], lookup[3:0] };
                      end
                    3'b010, 3'b100, 3'b110, 3'b111:
                      begin
                         lookup[4:0] <= active_h_count[7:3] + 1;
                         videoaddr   <= { videoaddr_base[12:5] , lookup[4:0] };
                      end
                  endcase
               end // else: !if(an_g_s == 1'b0)
          end // if (cvbs_clk_ena)
     end // always @ (posedge clk, posedge reset)
   
   // handle latching & shifting of character, graphics char_d_o
   reg[3:0] count;
   always @(posedge clk, posedge reset)
     begin
        if (reset)
          begin
             count = 0;
          end
        else if (cvbs_clk_ena)
          begin
             if (active_h_start)
               count = 0;
             if (an_g_s == 1'b0)
               // alpha-semi modes
               if (count[2:0] == 0)
                 begin
                    // handle alpha-semi latching
                    an_s_r <= an_s_s;
                    inv_r  <= inv_s;
                    intn_ext_r  <= intn_ext_s;
                    if (an_s_s == 1'b0)
                      dd_r <= char_d_o;                  // alpha mode
                    else
                      // store luma,chroma(2..0),luma,chroma(2..0)
                      if (intn_ext_s == 1'b0)           // semi-4
                        if (row_v < 6)
                          dd_r <= { dd[3], dd[6], dd[5], dd[4], dd[2], dd[6], dd[5], dd[4] };
                        else
                          dd_r <= { dd[1], dd[6], dd[5], dd[4], dd[0], dd[6], dd[5], dd[4] };
                      else            // semi-6
                        if (row_v < 4)
                          dd_r <= { dd[5], css_s, dd[7], dd[6], dd[4], css_s, dd[7], dd[6] };
                        else if (row_v < 8)
                          dd_r <= { dd[3], css_s, dd[7], dd[6], dd[2], css_s, dd[7], dd[6] };
                        else
                          dd_r <= { dd[1], css_s, dd[7], dd[6], dd[0], css_s, dd[7], dd[6] };
                 end
               else
                 begin
                    // handle alpha-semi shifting
                    if (an_s_r == 1'b0)
                      dd_r <= { dd_r[6:0], 1'b0 };  // alpha mode
                    else
                      if (count[1:0] == 0)
                        dd_r <= { dd_r[3:0], 4'b0000 };  // semi mode
                 end
             else
               begin
                  // graphics modes
                  //if IN_SIMULATION then
                  an_s_r <= 1'b0;
                  //end if;
                  case (gm_s)
                    3'b000, 3'b001, 3'b011, 3'b101:  // CG1/RG1/RG2/RG3
                      if (count[3:0] == 0)
                        // handle graphics latching
                        dd_r <= dd;
                      else
                        // handle graphics shifting
                        if (gm_s == 3'b000)
                          begin
                             if (count[1:0] == 0)
                               dd_r <= { dd_r[5:0], 2'b00 };  // CG1
                          end
                        else
                          begin
                             if (count[0] == 1'b0)
                               dd_r <= { dd_r[6:0], 1'b0 };  // RG1/RG2/RG3
                          end
                    default:  // CG2/CG3/CG6/RG6
                      if (count[2:0] == 0)
                        // handle graphics latching
                        dd_r <= dd;
                      else
                        // handle graphics shifting
                        if (gm_s == 3'b111)
                          dd_r <= { dd_r[6:0], 1'b0 };  // RG6
                        else
                          if (count[0] == 1'b0)
                            dd_r <= { dd_r[5:0], 2'b00 };  // CG2/CG3/CG6
                  endcase
               end // else: !if(count[2:0] == 0)
             count = count + 1;
          end
     end
   
   // generate pixel char_d_o
   reg luma;
   reg [2:0] chroma;
   always @(posedge clk, posedge reset)
     begin
        if (reset)
          begin
          end
        else if (cvbs_clk_ena)
          begin
             // alpha/graphics mode
             if (an_g_s == 1'b0)
               begin
                  // alphanumeric & semi-graphics mode
                  luma = dd_r[7];
                  if (an_s_r == 1'b0)
                    begin
                       // alphanumeric
                       if (intn_ext_r == 1'b0)
                         begin
                            // internal rom
                            chroma = { css_s, css_s, css_s};
                            if (inv_r == 1'b1)
                              luma = !luma;
                            // else
                            // external ROM?!?
                         end
                    end
                  else
                    chroma = dd_r[6:4];
               end  // alphanumeric/semi-graphics
             else
               begin
                  // graphics mode
                  case (gm_s)
                    3'b000:                  // CG1 64x64x4
                      begin
                         luma   = 1'b1;
                         chroma = { css_s, dd_r[7:6] };
                      end
                    3'b001, 3'b011, 3'b101:  // RG1/2/3 128x64/96/192x2
                      begin
                         luma   = dd_r[7];
                         chroma = { css_s, 2'b00 };    // green/buff
                      end
                    3'b010, 3'b100, 3'b110:  // CG2/3/6 128x64/96/192x4
                      begin
                         luma   = 1'b1;
                         chroma = { css_s, dd_r[7:6] };
                      end
                    default:                 // RG6 256x192x2
                      begin
                         luma   = dd_r[7];
                         chroma = { css_s, 2'b00 };    // green/buff
                      end
                  endcase
               end  // alpha/graphics mode
             
             // pack source char_d_o into line buffer
             // - palette lookup on output
             pixel_char_d_o <= { 1'b0, css_s, an_g_s, an_s_r, luma, chroma };
             
          end
     end
   
   // only write to the linebuffer during active display
   assign cvbs_linebuf_we = !(cvbs_vblank | cvbs_hblank);
   
   assign cvbs = cvbs_vblank ? {1'b0, cvbs_vsync, 6'b000000} :
                 cvbs_hblank ? {1'b0, cvbs_hsync, 6'b000000} :
                 cvbs_char_d_o;
   
   // assign outputs
   
   assign hs_n = !hs_int;
   assign fs_n = !fs_int;
   assign da0  = (gm_s == 3'b001 || gm_s == 3'b011 || gm_s == 3'b101) ? da0_int[4] : da0_int[3];
   
   // map the palette to the pixel char_d_o
   // -  we do that at the output so we can use a
   //    higher colour-resolution palette
   //    without using memory in the line buffer
   // for artifacting testing only
   reg [7:0] p_in;
   reg [7:0] p_out;
   reg       cnt;
   
   always @(posedge clk, posedge reset)
     begin
        if (reset)
          begin
             cnt <= 1'b0;
          end
        else
          begin
             if (CVBS_NOT_VGA)
               begin
                  if (cvbs_clk_ena)
                    begin
                       if (cvbs_hblank == 1'b0 && cvbs_vblank == 1'b0)
                         {red, green, blue} <= map_palette (vga_char_d_o);
                       else
                         {red, green, blue} <= 0;
                    end
               end
             else
               begin
                  if (clk_ena)
                    begin
                       if (vga_hblank == 1'b1)
                         begin
                            cnt  <= 1'b0;
                            p_in <= 0;
                         end
                       // artifacting test only //
                       if (vga_hblank == 1'b0 && vga_vblank == 1'b0)
                         begin
                            if (artifact_en == 1'b1 && an_g_s == 1'b1 && gm_s == 3'b111)
                              begin
                                 if (cnt != 0)
                                   begin
                                      p_out[7:4] <= vga_char_d_o[7:4];
                                      if (p_in[3] == 1'b0 && vga_char_d_o[3] == 1'b0)
                                        p_out[3:0] <= 4'b0000;
                                      else if (p_in[3] == 1'b1 && vga_char_d_o[3] == 1'b1)
                                        p_out[3:0] <= 4'b1100;
                                      else if (p_in[3] == 1'b0 && vga_char_d_o[3] == 1'b1)
                                        p_out[3:0] <= 4'b1011;  // red
                                      //p_out[3:0] <= 4'b1101;  // cyan
                                      else
                                        p_out[3:0] <= 4'b1010;  // blue
                                      //p_out[3:0] <= 4'b1111;  // orange
                                   end // if (cnt != 0)
                                 {red, green, blue} <= map_palette (p_out);
                                 p_in <= vga_char_d_o;
                              end
                            else
                              {red, green, blue} <= map_palette (vga_char_d_o);
                            cnt <= !cnt;
                         end
                       else if (an_g_s == 1'b1 && vga_hborder == 1'b1 && cvbs_vborder == 1'b1)
                         // graphics mode, either green or buff (white)
                         {red, green, blue} <= map_palette ({5'b00001, css_s, 2'b00});
                       else
                         {red, green, blue} <= 0;
                    end // if (clk_ena)
               end // else: !if(CVBS_NOT_VGA)
             
             if (CVBS_NOT_VGA)
               begin
                  hsync  <= cvbs_hsync;
                  vsync  <= cvbs_vsync;
                  hblank <= cvbs_hblank;
                  vblank <= cvbs_vblank;
               end
             else
               begin
                  hsync  <= vga_hsync;
                  vsync  <= vga_vsync;
                  hblank <= !vga_hborder;
                  vblank <= !cvbs_vborder;
               end // else: !if(CVBS_NOT_VGA)
          end // else: !if(CVBS_NOT_VGA)
     end // always @ (posedge clk, posedge reset)
   
   
   // line buffer for scan doubler gives us vga monitor compatible output
   always @(posedge clk)
     begin
        if (cvbs_clk_ena)
          if (cvbs_linebuf_we_rr == 1'b1)
            VRAM[cvbs_linebuf_addr_rr] <= pixel_char_d_o;
        if (clk_ena)
          vga_char_d_o <= VRAM[vga_linebuf_addr];
     end
   
endmodule
