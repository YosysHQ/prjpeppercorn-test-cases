// =======================================================================
// ulx3s_acorn_atom
//
// An Acorn Atom implementation for the Ulx3s ECP5 board
//
// Copyright (C) 2017 David Banks for Ice40 version
// Copyright (c) 2000 Lawrie Griffiths for Ulx3s port
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// =======================================================================

module atom
   (
        // Main clock, 25MHz
        input         clk10_mhz,
	     // Buttons
	     input   btn,
             // Keyboard
             input         ps2_clk,
             input         ps2_data,
             // Video
             output [3:0]  red,
             output [3:0]  green,
             output [3:0]  blue,
             output        hsync,
             output        vsync,
             );

  // Cassette / Sound
  reg         cas_in = 1'b1;
  wire        cas_out;
  // Audio
  wire  [3:0] audio_l;
  wire  [3:0] audio_r;

   // ===============================================================
   // Parameters
   // ===============================================================

   parameter CHARROM_INIT_FILE = "../mem/charrom.mem";
   parameter VID_RAM_INIT_FILE = "../mem/vid_ram.mem";

   // ===============================================================
   // System Clock generation (25MHz)
   // ===============================================================
   wire clk25, locked;

   pll pll_i (
     .clock_in(clk10_mhz),
     .clock_out(clk25),
     .locked(locked)
   );

   // ===============================================================
   // Wires/Reg definitions
   // TODO: reorganize so all defined here
   // ===============================================================

   reg         hard_reset_n;
   wire        break_n;
   reg [7:0]   pia_pa_r = 8'h00;
   reg         rnw;
   wire [7:0]  pia_pc;
   wire        pia_cs;
   reg [15:0]  address;
   reg [7:0]   cpu_dout;
   reg [7:0]   vid_dout;
   wire [7:0]  via_dout;
   wire        via_irq_n;
   wire [1:0]  turbo;
   reg         lock;

   // ===============================================================
   // VGA Clock generation (25MHz/12.5MHz)
   // ===============================================================

   wire clk_vga = clk25;
   reg  clk_vga_en = 0;

   always @(posedge clk_vga)
     clk_vga_en <= !clk_vga_en;

   // ===============================================================
   // Clock Enable Generation
   // ===============================================================

   reg       cpu_clken;
   reg       cpu_clken1;
   reg       via1_clken;
   reg       via4_clken;
   reg [4:0] clkdiv = 5'b00000;  // divider, from 25MHz down to 1, 2, 4 or 8MHz

   always @(posedge clk25) begin
      if (clkdiv == 24)
        clkdiv <= 0;
      else
        clkdiv <= clkdiv + 1;
      case (turbo)
        2'b00: // 1MHz
          begin
             cpu_clken  <= (clkdiv[3:0] == 0) & (clkdiv[4] == 0);
             via1_clken <= (clkdiv[3:0] == 0) & (clkdiv[4] == 0);
             via4_clken <= (clkdiv[1:0] == 0) & (clkdiv[4] == 0);
          end
        2'b01: // 2MHz
          begin
             cpu_clken  <= (clkdiv[2:0] == 0) & (clkdiv[4] == 0);
             via1_clken <= (clkdiv[2:0] == 0) & (clkdiv[4] == 0);
             via4_clken <= (clkdiv[0]   == 0) & (clkdiv[4] == 0);
          end
        default: // 4MHz
          begin
             cpu_clken  <= (clkdiv[1:0] == 0) & (clkdiv[4] == 0);
             via1_clken <= (clkdiv[1:0] == 0) & (clkdiv[4] == 0);
             via4_clken <=                      (clkdiv[4] == 0);
          end
      endcase
      cpu_clken1 <= cpu_clken;
   end

   // ===============================================================
   // Reset generation
   // ===============================================================

   reg [15:0] pwr_up_reset_counter = 0; // hold reset low for ~1ms
   wire       pwr_up_reset_n = &pwr_up_reset_counter;

   always @(posedge clk25)
     begin
        if (cpu_clken)
          begin
             if (!pwr_up_reset_n)
               pwr_up_reset_counter <= pwr_up_reset_counter + 1;
             hard_reset_n <= pwr_up_reset_n;
          end
     end

   wire reset = !hard_reset_n | !break_n | !btn;

   // ===============================================================
   // Keyboard
   // ===============================================================

   wire       rept_n;
   wire       shift_n;
   wire       ctrl_n;
   wire [3:0] row = pia_pa_r[3:0];
   wire [5:0] keyout;
   wire       ps2_clk_int;
   wire       ps2_data_int;

   keyboard KBD
     (
      .CLK(clk25),
      .nRESET(hard_reset_n),
      .PS2_CLK(ps2_clk_int),
      .PS2_DATA(ps2_data_int),
      .KEYOUT(keyout),
      .ROW(row),
      .SHIFT_OUT(shift_n),
      .CTRL_OUT(ctrl_n),
      .REPEAT_OUT(rept_n),
      .BREAK_OUT(break_n),
      .TURBO(turbo)
      );

   assign ps2_clk_int = ps2_clk;
   assign ps2_data_int = ps2_data;

   // ===============================================================
   // Cassette
   // ===============================================================

   // The Atom drives cas_tone from 4MHz / 16 / 13 / 8
   // 208 = 16 * 13, and start with 1MHz and toggle
   // so it's basically the same

   reg        cas_tone = 1'b0;
   reg [7:0]  cas_div = 0;

   always @(posedge clk25)
     if (cpu_clken)
       begin
          if (cas_div == 207)
            begin
               cas_div <= 0;
               cas_tone <= !cas_tone;
            end
          else
            cas_div <= cas_div + 1;
       end

   assign audio_l = pia_pc[2] & sid_audio ? 4'b1111 : 4'b0;
   assign audio_r = pia_pc[2] & sid_audio ? 4'b1111 : 4'b0;

   // this is a direct translation of the logic in the atom
   // (two NAND gates and an inverter)
   assign cas_out = !(!(!cas_tone & pia_pc[1]) & pia_pc[0]);

   // ===============================================================
   // ROM Latch at BFFF
   // ===============================================================

   reg [7:0]   rom_latch;
   wire        rom_latch_cs;
   wire        a000_cs;

   always @(posedge clk25 or posedge reset)
     if (reset)
       rom_latch <= 8'h00;
     else if (cpu_clken)
       if (rom_latch_cs & !rnw)
         rom_latch <= cpu_dout;

   // SID
   // ===============================================================

   wire [7:0] sid_dout;
   wire       sid_audio;
   wire       sid_cs;

   sid6581 sid
     (
      .clk_1MHz(!clkdiv[4]),
      .clk32(clk25), // TODO: should be clk32
      .clk_DAC(clk25),
      .reset(reset),
      .cs(cpu_clken),
      .we(sid_cs & !rnw),

      .addr(address[4:0]),
      .di(cpu_dout),
      .dout(sid_dout),

      .pot_x(1'b0),
      .pot_y(1'b0),
      .audio_out(sid_audio),
      .audio_data()
   );

   // ===============================================================
   // 8255 PIA at 0xB0xx
   // ===============================================================

   // This model is still very crude, specifically the directions of
   // the ports are fixed (not normally a problem on the Atom)

   wire       fs_n;
   reg [7:0]  pia_dout;
   reg [3:0]  pia_pc_r = 4'h0;
   wire [7:0] pia_pa   = { pia_pa_r };
   wire [7:0] pia_pb   = { shift_n, ctrl_n, keyout };
   assign     pia_pc   = { fs_n, rept_n, cas_in, cas_tone, pia_pc_r};

   always @(posedge clk25 or posedge reset)
     begin
        if (reset)
          begin
             pia_pa_r <= 8'h00;
             pia_pc_r <=  4'h0;
          end
        else if (cpu_clken)
          begin
             if (pia_cs && !rnw)
               case (address[1:0])
                 2'b00: pia_pa_r <= cpu_dout;
                 2'b10: pia_pc_r <= cpu_dout[3:0];
                 2'b11: if (!cpu_dout[7]) pia_pc_r[cpu_dout[2:1]] <= cpu_dout[0];
               endcase
          end
     end

   always @(*)
     begin
        case(address[1:0])
          2'b00: pia_dout <= pia_pa;
          2'b01: pia_dout <= pia_pb;
          2'b10: pia_dout <= pia_pc;
          default:
            pia_dout <= 0;
        endcase
     end


   // ===============================================================
   // 6502 CPU
   // ===============================================================

   wire [7:0]  cpu_din;
   wire [7:0]  cpu_dout_c;
   wire [15:0] address_c;
   wire        rnw_c;

   // Arlet's 6502 core is one of the smallest available
   cpu CPU
     (
      .clk(clk25),
      .reset(reset),
      .AB(address_c),
      .DI(cpu_din),
      .DO(cpu_dout_c),
      .WE(rnw_c),
      .IRQ(!via_irq_n),
      .NMI(1'b0),
      .RDY(cpu_clken)
      );

   // The outputs of Arlets's 6502 core need registing
   always @(posedge clk25)
     begin
        if (cpu_clken)
          begin
             address  <= address_c;
             cpu_dout <= cpu_dout_c;
             rnw      <= !rnw_c;
          end
     end

   // Snoop bit 5 of #E7 (the lock flag)
   always @(posedge clk25 or posedge reset)
     if (reset)
       lock <= 1'b0;
     else if (cpu_clken)
       if ((address == 16'he7) && !rnw)
         lock <= cpu_dout[5];

   // ===============================================================
   // Address decoding logic and data in multiplexor
   // ===============================================================

   // 0000-7FFF RAM
   // 8000-97FF Video RAM
   // 9800-9FFF RAM
   // A000-AFFF RAM
   // B000-B00F 8255 PIA
   // B010-B3FF BRAN ROM (part 1)
   // B400-B40F empty (returns zero)
   // B410-B7FF BRAN ROM (part 2)
   // B800-B80F 6522 VIA
   // B810-BBFF RAM
   // BC10-BCFF RAM
   // C000-CFFF Basic ROM
   // D000-DFFF FP ROM
   // E000-EFFF SDDOS ROM
   // F000-FFFF MOS ROM

   wire [7:0]  pl8_dout = 8'b0;

   wire         rom_cs = (address[15:14] == 2'b11 | (address[15:12] == 4'b1010 & rom_latch[2:0] != 3'b111));

   assign       pia_cs = (address[15: 4] == 12'hb00);
   wire         pl8_cs = (address[15: 4] == 12'hb40);
   wire         via_cs = (address[15: 4] == 12'hb80);
   assign       sid_cs = (address[15: 8] ==  8'hbd);
   assign      a000_cs = (address[15:12] == 4'b1010);
   wire         vid_cs = (address[15:12] == 4'b1000) | (address[15:11] == 5'b10010);
   assign rom_latch_cs = (address        == 16'hbfff);

   wire [7:0] ram_dout;

   ram ram64(
     .clk(clk25),
     .we(!rnw),
     .addr(address),
     .din(cpu_dout),
     .dout(ram_dout)
   );

  wire [7:0] rom_dout;
   rom_c000_ffff rom(
     .clk(clk25),
     .address(address[12:0]),
     .dout(rom_dout)
   );

   assign cpu_din = vid_cs   ? vid_dout  :
                    pia_cs   ? pia_dout  :
                    pl8_cs   ? pl8_dout  :
                    via_cs   ? via_dout  :
                    sid_cs   ? sid_dout  :
                    rom_cs   ? rom_dout  :
              rom_latch_cs   ? rom_latch :
                               ram_dout;

   // ===============================================================
   // 6522 VIA at 0xB8xx
   // ===============================================================

   m6522 VIA
     (
      .I_RS(address[3:0]),
      .I_DATA(cpu_dout),
      .O_DATA(via_dout),
      .O_DATA_OE_L(),
      .I_RW_L(rnw),
      .I_CS1(via_cs),
      .I_CS2_L(1'b0),
      .O_IRQ_L(via_irq_n),
      .I_CA1(1'b0),
      .I_CA2(1'b0),
      .O_CA2(),
      .O_CA2_OE_L(),
      .I_PA(8'b0),
      .O_PA(),
      .O_PA_OE_L(),
      .I_CB1(1'b0),
      .O_CB1(),
      .O_CB1_OE_L(),
      .I_CB2(1'b0),
      .O_CB2(),
      .O_CB2_OE_L(),
      .I_PB(8'b0),
      .O_PB(),
      .O_PB_OE_L(),
      .I_P2_H(via1_clken),
      .RESET_L(!reset),
      .ENA_4(via4_clken),
      .CLK(clk25)
      );

   // ===============================================================
   // Dual Port Video RAM
   // ===============================================================

   // Port A to CPU
   wire        we_a = vid_cs & !rnw;

   // Port B to VDG
   wire [12:0] vid_addr;
   reg  [7:0]  vid_data;
   
   vid_ram
     #(.MEM_INIT_FILE (VID_RAM_INIT_FILE))
   VID_RAM
     (
      // Port A
      .clk_a(clk25),
      .we_a(we_a),
      .addr_a(address[12:0]),
      .din_a(cpu_dout),
      .dout_a(vid_dout),
      // Port B
      .clk_b(clk_vga),
      .addr_b(vid_addr),
      .dout_b(vid_data)
      );

   // ===============================================================
   // 6847 VDG
   // ===============================================================

   wire        an_g     = pia_pa[4];
   wire [2:0]  gm       = pia_pa[7:5];
   wire        css      = pia_pc[3];
   wire        inv      = vid_data[7]; // See Atom schematic
   wire        intn_ext = vid_data[6]; // See Atom schematic
   wire        an_s     = vid_data[6]; // See Atom schematic
   wire [10:0] char_a;
   wire [7:0]  char_d;
   wire [8:0]  packed_char_a;
   wire [7:0]  packed_char_d;
   wire        hblank, vblank;
   wire        vga_blank = hblank | vblank;

   mc6847 VDG
     (
      .clk(clk_vga),
      .clk_ena(clk_vga_en),
      .reset(!hard_reset_n),
      .da0(),
      .videoaddr(vid_addr),
      .dd(vid_data),
      .hs_n(),
      .fs_n(fs_n),
      .an_g(an_g),
      .an_s(an_s),
      .intn_ext(intn_ext),
      .gm(gm),
      .css(css),
      .inv(inv),
      .red(red),
      .green(green),
      .blue(blue),
      .hsync(hsync),
      .vsync(vsync),
      .hblank(hblank),
      .vblank(vblank),
      .artifact_en(1'b0),
      .artifact_set(1'b0),
      .artifact_phase(1'b1),
      .cvbs(),
      .black_backgnd(1'b1),
      .char_a(char_a),
      .char_d_o(char_d)
      );

   charrom
     #(.MEM_INIT_FILE (CHARROM_INIT_FILE))
   CHARROM
     (
      .clk(clk_vga),
      .address(packed_char_a),
      .dout(packed_char_d)
      );

   assign packed_char_a[8:3] = char_a[9:4];
   assign packed_char_a[2:0] = char_a[3:0] - 2'b11;
   assign char_d = (char_a[3:0] < 3 || char_a[3:0] > 10) ? 8'h00 : packed_char_d;

endmodule
