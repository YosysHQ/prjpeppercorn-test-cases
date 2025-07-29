module top(
  input  [1:0] A,
  input  [1:0] B,
  output [3:0] P
);

  CC_MULT #(
    .A_WIDTH(2),
    .B_WIDTH(2),
    .P_WIDTH(4)
  ) mult_inst (
    .A(A),
    .B(B),
    .P(P)
  );

endmodule
