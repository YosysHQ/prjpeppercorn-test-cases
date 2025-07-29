module top (
    input  clk,
    input  rst,
    output clkout_p,
    output clkout_n,

    input clk_in,

    // outputs
    output  wire led
);

	CC_LVDS_OBUF #(
		.DELAY_OBF(0),
	) lvds_clk_out (
		.A(clk),
		.O_N(clkout_n),
		.O_P(clkout_p)
	);

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    wire clk0;
	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
		.OUT_CLK("25"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst (
		.CLK_REF(clk_in), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk0), .CLK_REF_OUT()
	);

    reg [BITS+LOG2DELAY-1:0] counter = 0;

    always @(posedge clk0) begin
        if (~rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    assign led = counter[21];
endmodule

