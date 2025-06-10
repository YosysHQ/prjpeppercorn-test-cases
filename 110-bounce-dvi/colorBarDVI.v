/*
 * colorBarDVI.v
 *
 * Copyright (C) 2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */

`default_nettype none

module colorBarDVI (
	input  wire       clk_i,
	input  wire       rst_i,
	output wire       TMDS_0_clk_p,
	output wire       TMDS_0_clk_n,
	output wire [2:0] TMDS_0_data_p,
	output wire [2:0] TMDS_0_data_n,
	output wire buck_enable
);
	assign buck_enable = 1'b1;

	reg [5:0] reset_cnt = 0;
    wire rstn = &reset_cnt;

    always @(posedge clk_pix) begin
        if (rst_i == 1'b0)
            reset_cnt <= 0;
        else
            reset_cnt <= reset_cnt + !rstn;
    end

	wire TMDS_0_clk;
	wire [2:0] TMDS_0_data;

	CC_LVDS_OBUF #(
		.DELAY_OBF(0),
	) lvds_ck_obuf_inst (
		.A(TMDS_0_clk),
		.O_N(TMDS_0_clk_n),
		.O_P(TMDS_0_clk_p)
	);

	CC_LVDS_OBUF #(
		.DELAY_OBF(0),
	) lvds_dn_obuf_inst [2:0] (
		.A(TMDS_0_data),
		.O_N(TMDS_0_data_n),
		.O_P(TMDS_0_data_p)
	);

	/* PLL: 25MHz (pix clock) and 125MHz (hdmi clk rate) */
	wire clk_pix, clk_dvi, lock;
	pll pll_inst (
		.clock_in(clk_i),       //  50 MHz reference
		.clock_out(clk_pix),    //  25 MHz, 0 deg
		.clock_5x_out(clk_dvi), // 125 MHz, 0 deg
		.lock_out(lock)
	);

	localparam
		HRES = 640,
		HSZ  = $clog2(HRES),
		VRES = 480,
		VSZ  = $clog2(VRES);

	wire de_s, hsync_s, vsync_s;

    vga_core #(
		.HSZ(HSZ), .VSZ(VSZ)
	) vga_inst (.clk_i(clk_pix), .rst_i (!rstn),
		.hcount_o(), .vcount_o(),
		.de_o(de_s),
		.vsync_o(vsync_s), .hsync_o(hsync_s)
	);

	wire [7:0] r_s, g_s, b_s;
	wire       blank2_s, vsync2_s, hsync2_s;

	color_bar #(
		.H_RES(HRES), .V_RES(VRES), .PIX_SZ(8)
	) bounce_inst (
		.i_clk(clk_pix), .i_rst(!rstn),
		.i_blank(~de_s),
		.i_vsync(vsync_s), .i_hsync(hsync_s),
		.o_blank(blank2_s),
		.o_vsync(vsync2_s), .o_hsync(hsync2_s),
		.o_r(r_s), .o_g(g_s), .o_b(b_s)
	);

	dvi_core dvi_inst (
		.clk_pix(clk_pix), .rst(!rstn), .clk_dvi(clk_dvi),
		// horizontal & vertical synchro
		.hsync_i(hsync2_s), .vsync_i(vsync2_s),
		// display enable (active area)
		.de_i(~blank2_s),
		// pixel colors
		.pix_r(r_s), .pix_g(g_s), .pix_b(b_s),
		// output signals
		.TMDS_clk(TMDS_0_clk),
		.TMDS_data(TMDS_0_data)
	);
endmodule
