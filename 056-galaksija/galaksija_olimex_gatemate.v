//--------------------------
// Top level for Galaksija on Olimex Gatemate
// By: Goran Mahovlić
//--------------------------
// vendor specific library for clock
// no timescale needed

module galaksija_olimex_gatemate(
input wire clk_i,
input wire rstn_i,

// I/O interface to keyboard
input ps2clk,          // PS/2 keyboard serial clock input
input ps2data,          // PS/2 keyboard serial data input

// Outputs to VGA display
output o_hsync,      // hozizontal VGA sync pulse
output o_vsync,      // vertical VGA sync pulse

output [3:0] o_r,     // red VGA signal
output [3:0] o_g,     // green VGA signal
output [3:0] o_b,     // blue VGA signal
output wire o_led
);

reg reset_n;
wire clk_pixel, clk_pixel_shift, clk_pixel_shift1, clk_pixel_shift2, locked;
wire S_LCD_DAT;
wire [2:0] S_vga_r; wire [2:0] S_vga_g; wire [2:0] S_vga_b;
wire S_vga_vsync; wire S_vga_hsync;
wire S_vga_vblank; wire S_vga_blank;

assign o_led = reset_n;
// visual indication of btn press
// btn(0) has inverted logic

/* 10 MHz to 25MHz */
pll pll_inst (
    .clock_in(clk_i), // 10 MHz
    .rst_in(~rstn_i),
    .clock_out(clk_pixel), // 25 MHz
    .locked(locked)
);

    // debounce reset button
    wire reset_n;

  always @(posedge clk_pixel) begin
    reset_n <= rstn_i;
  end
  

  galaksija
  galaksija_inst
  (
    .clk(clk_pixel),
    .pixclk(clk_pixel),
    .reset_n(reset_n),
    .LCD_DAT(S_LCD_DAT),
    .LCD_HS(o_hsync),
    .LCD_VS(o_vsync),
    .LCD_DEN(S_vga_blank),
    .ps2Clk(ps2clk),
    .ps2Data(ps2data)
  );

  assign o_r = { S_LCD_DAT, S_LCD_DAT, S_LCD_DAT, S_LCD_DAT };
  assign o_g = { S_LCD_DAT, S_LCD_DAT, S_LCD_DAT, S_LCD_DAT };
  assign o_b = { S_LCD_DAT, S_LCD_DAT, S_LCD_DAT, S_LCD_DAT };
endmodule
