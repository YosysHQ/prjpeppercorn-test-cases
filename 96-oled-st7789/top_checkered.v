//========================================================================
// openCologne * NLnet-sponsored open-source design ware for GateMate
//------------------------------------------------------------------------
//                   Copyright (C) 2024 Chili.CHIPS*ba
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
// contributors may be used to endorse or promote products derived
// from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
// IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//              https://opensource.org/license/bsd-3-clause
//------------------------------------------------------------------------

module top_checkered (
   input  wire clk,
   input  wire btn,

   output wire oled_csn,
   output wire oled_clk,
   output wire oled_mosi,
   output wire oled_dc,
   output wire oled_resn,

   output wire led
);
   wire [7:0] x ;  // for ST7789
   wire [7:0] y ;
   //                  checkered      red   green   blue     red    green  blue
   wire [15:0] color = x[4] ^ y[4] ? {5'd0, x[7:3], 6'd0} : {y[7:3], 6'd0, 5'd0}; // for ST7789

   reg [26:0] counter;

   wire clk_pix, clk_pix_90 ,lock;

   pll pll_inst (
      .clock_in(clk), // 10 MHz
      .rst_in(~btn),
      .clock_out(clk_pix),// 25 MHz, 0 deg
      .clock_out_90(clk_pix_90),
      .locked(lock)
   );

   lcd_video #(
      .c_init_file("st7789_linit.mem"),
      .c_init_size(35),
      .c_color_bits(16)
   ) lcd_video_inst_1 (                 //  ST7789
      .clk_spi(clk_pix_90),
      .clk_spi_ena(1'b1),
      .reset(~btn),
      .x(x),
      .y(y),
      .color(color),
      .spi_clk(oled_clk),
      .spi_mosi(oled_mosi),
      .spi_dc(oled_dc),
      .spi_resn(oled_resn)
   );

   assign led = counter[26];

   always @(posedge clk_pix)
   begin
      if (!btn) begin
         counter <= 0;
      end else begin
         counter <= counter + 1'b1;
      end
   end


endmodule

/*
------------------------------------------------------------------------------
Version History:
------------------------------------------------------------------------------
 2024/5/30 Ahmed Imamović: Initial creation
           Adapted from: https://github.com/emard/ulx3s-misc/tree/master/examples/spi_display
*/
