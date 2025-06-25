`default_nettype none
module top(
   input CLK,
   output LED,
   input BUT,
   output VGA_HS,
   output VGA_VS,
   output [3:0] VGA_R,
   output [3:0] VGA_G,
   output [3:0] VGA_B,
   input PS2_DATA,
   input PS2_CLK
);
	wire clk270, clk180, clk90, usr_ref_out,clk10;
	wire usr_pll_lock_stdy, usr_pll_lock;

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),      // reference input in MHz
		.OUT_CLK("10.0"),     // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOCK_REQ(0),
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(10), // optional CI filter constant
		.CP_FILTER_CONST(20)  // optional CP filter constant
	) pll_inst (
		.CLK_REF(CLK), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy), .USR_PLL_LOCKED(usr_pll_lock),
		.CLK270(clk270), .CLK180(clk180), .CLK90(clk90), .CLK0(clk10), .CLK_REF_OUT(usr_ref_out)
	);

wire clk;
wire locked;
pll25 PLL(.clock_in(CLK),.clock_out(clk),.locked(locked));
wire isR;
reg [1:0] reset;
initial reset =0;
always @(posedge clk10)
	if (isR|~BUT) reset <= 0;
	else if (rst) reset <= reset +1;
wire rst = ~reset[1];
assign LED = ~rst;
soc SOC(
	.i_clk25(clk),
	.i_clk(clk10),
	.i_rst(rst),
	.i_ps2_data(PS2_DATA),
	.i_ps2_clk(PS2_CLK),
	.o_vga_hs(VGA_HS),
	.o_vga_vs(VGA_VS),
	.o_vga_r(VGA_R),
	.o_vga_g(VGA_G),
	.o_vga_b(VGA_B),
	.isR(isR),
	.i_dip1(1'b0),
	.i_dip2(1'b0),
	.i_dip3(1'b0),
	.i_dip4(1'b0)
);
   
endmodule
