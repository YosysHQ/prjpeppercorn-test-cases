/**
 * PLL configuration
 *
 * Given input frequency:        10.000 MHz
 * Requested output frequency:   25.000 MHz
 * Achieved output frequency:    25.000 MHz
 */
`default_nettype none
`timescale 1 ns / 1 ps
module pll25(
	input  clock_in,
	output clock_out,
	output locked
	);

	wire clk270, clk180, clk90, clk0, usr_ref_out;
	wire usr_pll_lock_stdy, usr_pll_lock;

	CC_PLL #(
		.REF_CLK(10.0),			// reference input in MHz
		.OUT_CLK(25.0),			// pll output frequency in MHz
		.PERF_MD("ECONOMY"),		// LOWPOWER, ECONOMY, SPEED
		.LOCK_REQ(1),
		.LOW_JITTER(1),			// 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(10),	// optional CI filter constant
		.CP_FILTER_CONST(20) 	// optional CP filter constant
	) pll_inst (
		.CLK_REF(clock_in), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy), .USR_PLL_LOCKED(usr_pll_lock),
		.CLK270(clk270), .CLK180(clk180), .CLK90(clk90), .CLK0(clk0), .CLK_REF_OUT(usr_ref_out)
	);

	assign clock_out = clk0;
	assign locked = usr_pll_lock;

endmodule
