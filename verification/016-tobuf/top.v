module top (
	input  i1,
    input  i2,

	output o
);
	wire sig1, sig2;
	CC_IBUF ibuf0 (.I(i1), .Y(sig1));
	CC_IBUF ibuf1 (.I(i2), .Y(sig2));

	CC_TOBUF tobuf (.A(sig1), .T(sig2), .O(o));
endmodule
