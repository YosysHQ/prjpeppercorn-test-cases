`default_nettype none

module colorBarVGAUSB
#(
    parameter C_usb_speed = 1'b0, // 0-6MHz / 1-48MHz
    parameter C_report_bytes = 8, // 8:usual gamepad, 20:xbox360
    parameter C_disp_bits=128,
    parameter C_us1 = 1,
    parameter C_us2 = 1
)
(
    input clk_i,
    input rstn_i,
    output [3:0] o_r,
    output [3:0] o_g,
    output [3:0] o_b,
    output o_vsync,
    output o_hsync,
    output [7:0] o_led,
    output o_led_D1,
    input usb1_fpga_dp,
    input usb1_fpga_dn,
    inout usb1_fpga_bd_dp,
    inout usb1_fpga_bd_dn,
    output usb1_fpga_pu_dp,
    output usb1_fpga_pu_dn,
    input usb2_fpga_dp,
    input usb2_fpga_dn,
    inout usb2_fpga_bd_dp,
    inout usb2_fpga_bd_dn,
    output usb2_fpga_pu_dp,
    output usb2_fpga_pu_dn,
    output TMDS_0_clk_p,
    output TMDS_0_clk_n,
    output [2:0] TMDS_0_data_p,
    output [2:0] TMDS_0_data_n,
    output wire TMDS_HPD,
    output wire TMDS_IN    
);

wire clk_pix, lock, lock_usb;
wire clk_usb;
wire clk_6MHz, clk_48MHz;

wire TMDS_0_clk;
wire [2:0] TMDS_0_data;
assign TMDS_HPD = 1'b0;
assign TMDS_IN = 1'b0;

CC_LVDS_OBUF lvds_obuf_inst [3:0] (
    .A({TMDS_0_clk, TMDS_0_data}),
    .O_P({TMDS_0_clk_n, TMDS_0_data_n}),
    .O_N({TMDS_0_clk_p, TMDS_0_data_p})
);

wire [2:0] S_valid;
wire [C_report_bytes*8-1:0] S_report[0:2];
reg  [C_disp_bits-1:0] R_display;

/* PLL: 25MHz (pix clock) and 125MHz (hdmi clk rate) */
wire clk_pix, clk_dvi, lock;
pll pll_inst (
    .clock_in(clk_i),       //  10 MHz reference
    .clock_out(clk_pix),    //  25 MHz, 0 deg
    .clock_5x_out(clk_dvi), // 125 MHz, 0 deg
    .lock_out(lock)
);

wire rst = ~lock;

/* PLL for 48MHz USB */
pll48 pll_inst_usb (
    .clock_in(clk_i), // 10 MHz
    .rst_in(~rstn_i),
    .clock_out(clk_48MHz), // 48 MHz, 0 deg
    .locked(lock_usb)
);

reg [2:0] counter;      // 3-bit counter

always @(posedge clk_48MHz) begin
        if (counter == 3) begin
            counter <= 3'b0;   // Reset counter
            clk_6MHz <= ~clk_6MHz; // Toggle output clock
        end else begin
            counter <= counter + 1;
    end
end

generate if (C_usb_speed == 1'b0) begin: G_low_speed
    assign clk_usb = clk_6MHz;
end
endgenerate
generate if (C_usb_speed == 1'b1) begin: G_full_speed
    assign clk_usb = clk_48MHz;
end
endgenerate

reg [31:0] LED_counter;

always @(posedge clk_usb) begin
    LED_counter <= LED_counter + 1;
end

assign o_led_D1 = LED_counter[24];

generate
  if(C_us1==1)
  begin

    assign usb1_fpga_pu_dp = 1'b0;
    assign usb1_fpga_pu_dn = 1'b0;
    //assign usb1_fpga_dn = ~usb1_fpga_dp;

    usbh_host_hid
    #(
      .C_report_length(C_report_bytes),
      .C_report_length_strict(0),
      .C_usb_speed(C_usb_speed) // '0':Low-speed '1':Full-speed
    )
    us1_hid_host_inst
    (
      .clk(clk_usb), // 48 MHz for full-speed USB1.1 device
      .bus_reset(~rstn_i),
      .led(o_led[7:4]), // debug output
      .usb_dif(usb1_fpga_dp),
      .usb_dp(usb1_fpga_bd_dp),
      .usb_dn(usb1_fpga_bd_dn),
      .hid_report(S_report[0]),
      .hid_valid(S_valid[0])
    );
    always @(posedge clk_usb)
      if(S_valid[0])
        R_display[63:0] <= S_report[0][63:0];

    end
  endgenerate // US1

generate
  if(C_us2==1)
  begin

    assign usb2_fpga_pu_dp = 1'b0;
    assign usb2_fpga_pu_dn = 1'b0;
    //assign usb2_fpga_dn = ~usb2_fpga_dp;

    usbh_host_hid
    #(
      .C_report_length(C_report_bytes),
      .C_report_length_strict(0),
      .C_usb_speed(C_usb_speed) // '0':Low-speed '1':Full-speed
    )
    us2_hid_host_inst
    (
      .clk(clk_usb), // 48 MHz for full-speed USB1.1 device
      .bus_reset(~rstn_i),
      .led(o_led[3:0]), // debug output
      .usb_dif(usb2_fpga_dp),
      .usb_dp(usb2_fpga_bd_dp),
      .usb_dn(usb2_fpga_bd_dn),
      .hid_report(S_report[1]),
      .hid_valid(S_valid[1])
    );
    always @(posedge clk_usb)
      if(S_valid[1])
        R_display[127:64] <= S_report[1][63:0];

    end
  endgenerate // US2

parameter C_color_bits = 16; 

wire [9:0] x;
wire [9:0] y;
// for reverse screen:
wire [9:0] rx = 636-x;
wire [C_color_bits-1:0] color;
hex_decoder_v
#(
    .c_data_len(C_disp_bits),
    .c_row_bits(4), // 2**n digits per row (4*2**n bits/row) 3->32, 4->64, 5->128, 6->256 
    .c_grid_6x8(0), // NOTE: TRELLIS needs -abc9 option to compile
    .c_font_file("hex_font.mem"),
    //.c_x_bits(8),
    //.c_y_bits(4),
    .c_color_bits(C_color_bits)
)
hex_decoder_v_inst
(
    .clk(clk_pix),
    .data(R_display),
    .x(rx[9:2]),
    .y(y[5:2]),
    .color(color)
);

assign o_r = color[15:12];
assign o_g = color[10:7];
assign o_b = color[4:1];

// VGA signal generator
wire [7:0] vga_r, vga_g, vga_b;
assign vga_r = {color[15:11],color[11],color[11],color[11]};
assign vga_g = {color[10:5],color[5],color[5]};
assign vga_b = {color[4:0],color[0],color[0],color[0]};

wire vga_hsync, vga_vsync, vga_blank;

vga
vga_instance
(
.clk_pixel(clk_pix),
.clk_pixel_ena(1'b1),
.test_picture(1'b0), // enable test picture generation
.beam_x(x),
.beam_y(y),
.vga_hsync(o_hsync),
.vga_vsync(o_vsync),
.vga_blank(vga_blank)
);

dvi_core dvi_inst (
    .clk_pix(clk_pix), 
    .rst(rst), 
    .clk_dvi(clk_dvi),
    // horizontal & vertical synchro
    .hsync_i(o_hsync), 
    .vsync_i(o_vsync),
    // display enable (active area)
    .de_i(~vga_blank),
    // pixel colors
    .pix_r(vga_r), 
    .pix_g(vga_g), 
    .pix_b(vga_b),
    // output signals
    .TMDS_clk(TMDS_0_clk),
    .TMDS_data(TMDS_0_data)
);

endmodule
