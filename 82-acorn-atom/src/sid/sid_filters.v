module sid_filters (
   input                clk, // At least 12Mhz
   input                rst,
   // SID registers.
   input [7:0]          Fc_lo,
   input [7:0]          Fc_hi,
   input [7:0]          Res_Filt,
   input [7:0]          Mode_Vol,
   // Voices - resampled to 13 bit
   input signed [12:0]  voice1,
   input signed [12:0]  voice2,
   input signed [12:0]  voice3,
   //
   input                input_valid,
   input signed [12:0]  ext_in,

   output signed [18:0] sound,
   output               valid
);


   wire [3:0]          filt        = Res_Filt[3:0];
   wire [3:0]          res         = Res_Filt[7:4];
   wire [3:0]          volume      = Mode_Vol[3:0];
   wire [2:0]          hp_bp_lp    = Mode_Vol[6:4];
   wire                voice3off   = Mode_Vol[7];

   wire signed [17:0] mixer_DC = -475; // NOTE to self: this might be wrong.

   reg signed [17:0] r_Vhp = 0;
   reg signed [17:0] r_Vbp = 0;
   reg signed [17:0] r_dVbp = 0;
   reg signed [17:0] r_Vlp = 0;
   reg signed [17:0] r_dVlp = 0;
   reg signed [17:0] r_Vi  = 0;
   reg signed [17:0] r_Vnf = 0;
   reg signed [17:0] r_Vf = 0;
   reg signed [17:0] r_w0 = 0;
   reg signed [17:0] r_q = 0;
   reg signed [18:0] r_vout = 0;
   reg [3:0]         r_state;
   reg               r_done;

   reg signed [17:0] w_Vhp;
   reg signed [17:0] w_Vbp;
   reg signed [17:0] w_dVbp;
   reg signed [17:0] w_Vlp;
   reg signed [17:0] w_dVlp;
   reg signed [17:0] w_Vi ;
   reg signed [17:0] w_Vnf;
   reg signed [17:0] w_Vf;
   reg signed [17:0] w_w0;
   reg signed [17:0] w_q;
   reg signed [18:0] w_vout;
   reg [3:0]         w_state;
   reg               w_done;
   
   wire [15:0]        val;

   reg [10:0]        divmul [0:15];

   initial
     begin
        divmul[0] <= 1448;
        divmul[1] <= 1323;
        divmul[2] <= 1218;
        divmul[3] <= 1128;
        divmul[4] <= 1051;
        divmul[5] <= 984;
        divmul[6] <= 925;
        divmul[7] <= 872;
        divmul[8] <= 825;
        divmul[9] <= 783;
        divmul[10] <= 745;
        divmul[11] <= 710;
        divmul[12] <= 679;
        divmul[13] <= 650;
        divmul[14] <= 624;
        divmul[15] <= 599;
     end

   reg signed [17:0] mula = 0;
   reg signed [17:0] mulb = 0;
   reg signed [35:0] mulr = 0;
   reg               mulen;

   function signed [17:0] s13_to_18;
      input signed [12:0] a;
      s13_to_18 = { a[12], a[12], a[12], a[12], a[12], a};
   endfunction

   always @(posedge clk)
     if (mulen)
       mulr <= mula * mulb;

   wire [10:0] fc = { Fc_hi , Fc_lo[2:0]};

   sid_coeffs c
     (
      .clk(clk),
      .addr(fc),
      .val(val)
      );

   always @(*)
     begin

        w_Vhp   = r_Vhp;
        w_Vbp   = r_Vbp;
        w_dVbp  = r_dVbp;
        w_Vlp   = r_Vlp;
        w_dVlp  = r_dVlp;
        w_Vi    = r_Vi ;
        w_Vnf   = r_Vnf;
        w_Vf    = r_Vf;
        w_w0    = r_w0;
        w_q     = r_q;
        w_vout  = r_vout;
        w_state = r_state;
        w_done  = r_done;
           
        mula = 18'h0;
        mulb = 18'h0;
        mulen = 1'b0;

        case (r_state)
          4'd0:
            begin
               w_done = 1'b0;
               if (input_valid)
                 begin
                    w_state = 4'd1;
                    // Reset Vin, Vnf
                    w_Vi = 0;
                    w_Vnf = 0;
                 end
            end
          
          4'd1:
            begin
               w_state = 4'd2;
               // already have W0 ready. Always positive
               w_w0 = {2'b00, val};
               // 1st accumulation
               if (filt[0])
                 w_Vi = r_Vi + s13_to_18(voice1);
               else
                 w_Vnf = r_Vnf + s13_to_18(voice1);
            end
          
          4'd2:
            begin
               w_state = 4'd3;
               // 2nd accumulation
               if (filt[1])
                 w_Vi = r_Vi + s13_to_18(voice2);
               else
                 w_Vnf = r_Vnf + s13_to_18(voice2);
               // Mult
               mula = r_w0;
               mulb = r_Vhp;
               mulen = 1'b1;
            end
          
          4'd3:
            begin
               w_state = 4'd4;
               // 3rd accumulation
               if (filt[2])
                 w_Vi = r_Vi + s13_to_18(voice3);
               else if (!voice3off)
                 w_Vnf = r_Vnf + s13_to_18(voice3);
               // Mult
               mula = r_w0;
               mulb = r_Vbp;
               mulen = 1'b1;
               w_dVbp = {mulr[35], mulr[35:19]};
            end
          
          4'd4:
            begin
               w_state = 4'd5;
               // 4th accumulation
               if (filt[3])
                 w_Vi = r_Vi + s13_to_18(ext_in);
               else
                 w_Vnf = r_Vnf + s13_to_18(ext_in);
               w_dVlp = { mulr[35] , mulr[35:19] };
               w_Vbp = r_Vbp - r_dVbp;
               // Get Q, synchronous.
               w_q = divmul[res];
            end
          
          4'd5:
            begin
               w_state = 4'd6;
               // Ok, we have all summed. We performed multiplications for dVbp and dVlp.
               // new Vbp already computed.
               mulen = 1'b1;
               mula = r_q;
               mulb = r_Vbp;
               w_Vlp = r_Vlp - r_dVlp;
               // Start computing output;
               if (hp_bp_lp[1])
                 w_Vf = r_Vbp;
               else
                 w_Vf = 0;
            end
          
          4'd6:
            begin
               w_state = 4'd7;
               // Adjust Vbp*Q, shift by 10
               w_Vhp = {mulr[35], mulr[26:10]} - r_Vlp;
               if (hp_bp_lp[0])
                 w_Vf = r_Vf + r_Vlp;
            end
          
          4'd7: begin
             w_state = 4'd8;
             w_Vhp = r_Vhp - r_Vi;
          end
          
          4'd8:
            begin
               w_state = 4'd9;
               if (hp_bp_lp[2])
                 w_Vf = r_Vf + r_Vhp;
            end
          
          4'd9:
            begin
               w_state = 4'd10;
               w_Vf = r_Vf + r_Vnf;
            end
          
          4'd10:
            begin
               w_state = 4'd11;
               // Add mixer DC
               w_Vf = r_Vf + mixer_DC;
            end
          
          4'd11:
            begin
               w_state = 4'd12;
               // Process volume
               mulen = 1'b1;
               mula = r_Vf;
               mulb = 0;
               mulb[3:0] = volume;
            end
          
          4'd12:
            begin
               w_state = 4'd0;
               w_done = 1'b1;
               w_vout[18] = mulr[35];
               w_vout[17:0] = mulr[17:0];
            end
          
          default:
            w_state = 4'd0;
          
        endcase
        
        if (rst)
          begin
             w_done = 1'b0;
             w_state = 4'd0;
             w_Vlp = 0;
             w_Vbp = 0;
             w_Vhp = 0;
          end        

     end

   always @(posedge clk)
     begin
        r_Vhp   <= w_Vhp;
        r_Vbp   <= w_Vbp;
        r_dVbp  <= w_dVbp;
        r_Vlp   <= w_Vlp;
        r_dVlp  <= w_dVlp;
        r_Vi    <= w_Vi ;
        r_Vnf   <= w_Vnf;
        r_Vf    <= w_Vf;
        r_w0    <= w_w0;
        r_q     <= w_q;
        r_vout  <= w_vout;
        r_state <= w_state;
        r_done  <= w_done;
     end
     
   assign sound = r_vout;
   assign valid = r_done;

endmodule
