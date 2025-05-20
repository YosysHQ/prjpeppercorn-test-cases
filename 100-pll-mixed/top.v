module top (
    input  clk,
	input  rst,
    output  wire  [7:0] led
);

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    wire clk_1;

	CC_PLL #(
		.REF_CLK("10.0"),    // reference input in MHz
		.OUT_CLK("20"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_1 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk_1), .CLK_REF_OUT()
	);

    reg [BITS+LOG2DELAY-1:0] counter_1 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_2 = 0;

    always @(posedge clk_1) begin
        if (~rst)
            counter_1 <= 0;
        else
            counter_1 <= counter_1 + 1;
	end
    always @(posedge clk_2) begin
        if (~rst)
            counter_2 <= 0;
        else
            counter_2 <= counter_2 + 1;
	end

    assign led[0] = counter_1[21];
	assign led[1] = counter_1[21];
    assign led[2] = counter_1[21];
	assign led[3] = counter_1[21];
    assign led[4] = counter_2[21];
	assign led[5] = counter_2[21];
    assign led[6] = counter_2[21];
	assign led[7] = counter_2[21];

endmodule

