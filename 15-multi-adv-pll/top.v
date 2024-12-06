module top (
    input  clk,
	input  sel,
    output  wire  [7:0] led
);

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    wire clk_1;
	wire clk_2;
	wire clk_3;
	wire clk_4;

	CC_PLL_ADV #(
		.PLL_CFG_A(96'h01_CB_01_10_64_00_04_0C_08_0C_20_82), // 20MHz
		.PLL_CFG_B(96'h01_CB_01_10_64_00_04_2F_08_2F_08_82)  // 5MHz
	) pll_inst_1 (
		.CLK_REF(clk),
		.USR_CLK_REF(1'b0),
		.USR_SEL_A_B(sel), // select PLL configuration
		.CLK_FEEDBACK(1'b0),
		.USR_LOCKED_STDY_RST(1'b0),
		.USR_PLL_LOCKED_STDY(),
		.USR_PLL_LOCKED(),
		.CLK0(clk_1),
		.CLK90(),
		.CLK180(),
		.CLK270(),
		.CLK_REF_OUT()
	);

	CC_PLL_ADV #(
		.PLL_CFG_A(96'h01_CB_01_10_64_00_04_10_08_0C_20_82), // 15MHz
		.PLL_CFG_B(96'h01_CB_01_10_64_00_04_2F_08_2F_08_82)  // 5MHz
	) pll_inst_2 (
		.CLK_REF(clk),
		.USR_CLK_REF(1'b0),
		.USR_SEL_A_B(sel), // select PLL configuration
		.CLK_FEEDBACK(1'b0),
		.USR_LOCKED_STDY_RST(1'b0),
		.USR_PLL_LOCKED_STDY(),
		.USR_PLL_LOCKED(),
		.CLK0(clk_2),
		.CLK90(),
		.CLK180(),
		.CLK270(),
		.CLK_REF_OUT()
	);

	CC_PLL_ADV #(
		.PLL_CFG_A(96'h01_CB_01_10_64_00_04_17_08_17_10_82), // 10MHz
		.PLL_CFG_B(96'h01_CB_01_10_64_00_04_2F_08_2F_08_82)  // 5Mhz
	) pll_inst_3 (
		.CLK_REF(clk),
		.USR_CLK_REF(1'b0),
		.USR_SEL_A_B(sel), // select PLL configuration
		.CLK_FEEDBACK(1'b0),
		.USR_LOCKED_STDY_RST(1'b0),
		.USR_PLL_LOCKED_STDY(),
		.USR_PLL_LOCKED(),
		.CLK0(clk_3),
		.CLK90(),
		.CLK180(),
		.CLK270(),
		.CLK_REF_OUT()
	);


	CC_PLL_ADV #(
		.PLL_CFG_A(96'h01_CB_01_10_64_00_04_2F_08_2F_08_82), // 5MHz
		.PLL_CFG_B(96'h01_CB_01_10_64_00_04_2F_08_2F_08_82) // 5MHz
	) pll_inst_4 (
		.CLK_REF(clk),
		.USR_CLK_REF(1'b0),
		.USR_SEL_A_B(sel), // select PLL configuration
		.CLK_FEEDBACK(1'b0),
		.USR_LOCKED_STDY_RST(1'b0),
		.USR_PLL_LOCKED_STDY(),
		.USR_PLL_LOCKED(),
		.CLK0(clk_4),
		.CLK90(),
		.CLK180(),
		.CLK270(),
		.CLK_REF_OUT()
	);

    reg [BITS+LOG2DELAY-1:0] counter_1 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_2 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_3 = 0;
	reg [BITS+LOG2DELAY-1:0] counter_4 = 0;

    always @(posedge clk_1) begin
        counter_1 <= counter_1 + 1;
	end
    always @(posedge clk_2) begin
        counter_2 <= counter_2 + 1;
	end
    always @(posedge clk_3) begin
        counter_3 <= counter_3 + 1;
	end
    always @(posedge clk_4) begin
        counter_4 <= counter_4 + 1;
	end

    assign led[0] = counter_1[21];
	assign led[1] = counter_1[21];
    assign led[2] = counter_2[21];
	assign led[3] = counter_2[21];
    assign led[4] = counter_3[21];
	assign led[5] = counter_3[21];
    assign led[6] = counter_4[21];
	assign led[7] = counter_4[21];

endmodule

