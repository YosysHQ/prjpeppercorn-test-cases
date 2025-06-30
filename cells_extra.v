module CC_PLL #(
	parameter REF_CLK = "", // e.g. "10.0"
	parameter OUT_CLK = "", // e.g. "50.0"
	parameter PERF_MD = "", // LOWPOWER, ECONOMY, SPEED
	parameter LOCK_REQ = 1,
	parameter CLK270_DOUB = 0,
	parameter CLK180_DOUB = 0,
	parameter LOW_JITTER = 1,
	parameter CI_FILTER_CONST = 2,
	parameter CP_FILTER_CONST = 4
)(
	input  CLK_REF, CLK_FEEDBACK, USR_CLK_REF,
	input  USR_LOCKED_STDY_RST,
	output reg USR_PLL_LOCKED_STDY, USR_PLL_LOCKED,
	output CLK270, CLK180, CLK90, CLK0, CLK_REF_OUT
);
    assign CLK0 = CLK_REF;
    assign CLK90 = CLK_REF;
    assign CLK180 = CLK_REF;
    assign CLK270 = CLK_REF;
    assign USR_PLL_LOCKED = 1'b1;
    assign USR_PLL_LOCKED_STDY = 1'b1;
	assign CLK_REF_OUT = 1'b0;
endmodule

module CC_USR_RSTN (
    output USR_RSTN
);
    assign USR_RSTN = 1'b1;
endmodule
