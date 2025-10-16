module top (
    input  clk,
	input  rst,
    output  wire  [7:0] led
);

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    wire clk_1;
	wire clk_2;
	wire clk_3;
	wire clk_4;
	wire clk_5;
	wire clk_6;
	wire clk_7;
	wire clk_8;

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
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

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
		.OUT_CLK("18"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_2 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk_2), .CLK_REF_OUT()
	);

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
		.OUT_CLK("16"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_3 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk_3), .CLK_REF_OUT()
	);

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
		.OUT_CLK("14"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_4 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk_4), .CLK_REF_OUT()
	);

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
		.OUT_CLK("12"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_5 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk_5), .CLK_REF_OUT()
	);

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
		.OUT_CLK("10"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_6 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk_6), .CLK_REF_OUT()
	);

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
		.OUT_CLK("8"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_7 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk_7), .CLK_REF_OUT()
	);

	CC_PLL #(
		.REF_CLK(`BOARD_FREQ_STR),    // reference input in MHz
		.OUT_CLK("6"),   // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_8 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(),
		.CLK270(), .CLK180(), .CLK90(), .CLK0(clk_8), .CLK_REF_OUT()
	);

    reg [BITS+LOG2DELAY-1:0] counter_1 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_2 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_3 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_4 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_5 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_6 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_7 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_8 = 0;

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
    always @(posedge clk_3) begin
        if (~rst)
            counter_3 <= 0;
        else
            counter_3 <= counter_3 + 1;
	end
    always @(posedge clk_4) begin
        if (~rst)
            counter_4 <= 0;
        else
            counter_4 <= counter_4 + 1;
	end
    always @(posedge clk_5) begin
        if (~rst)
            counter_5 <= 0;
        else
            counter_5 <= counter_5 + 1;
	end
    always @(posedge clk_6) begin
        if (~rst)
            counter_6 <= 0;
        else
            counter_6 <= counter_6 + 1;
	end
    always @(posedge clk_7) begin
        if (~rst)
            counter_7 <= 0;
        else
            counter_7 <= counter_7 + 1;
	end
    always @(posedge clk_8) begin
        if (~rst)
            counter_8 <= 0;
        else
            counter_8 <= counter_8 + 1;
	end

    assign led[0] = counter_1[21];
	assign led[1] = counter_2[21];
    assign led[2] = counter_3[21];
	assign led[3] = counter_4[21];
    assign led[4] = counter_5[21];
	assign led[5] = counter_6[21];
    assign led[6] = counter_7[21];
	assign led[7] = counter_8[21];

endmodule

