module top (
	input  i1,
    input  i2,
	output o,
	inout io
);
	wire sig1, sig2, sig3;
	CC_IBUF ibuf0 (.I(i1), .Y(sig1));
	CC_IBUF ibuf1 (.I(i2), .Y(sig2));

	CC_OBUF obuf1 (.A(sig3), .O(o));

	CC_IOBUF tobuf (.A(sig1), .T(sig2), .Y(sig3), .IO(io));
endmodule
