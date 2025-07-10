module top(
  input  A,
  input  B,
  input  CLK,
  output [1:0] O
);

  wire C;
  CC_LUT2 #(
    .INIT(4'he)
  ) lut  (
    .I0(A),
    .I1(B),
    .O(C)
  );

  CC_DFF dff1  (
    .CLK(CLK),
    .D(C),
    .Q(O[0]),
    .SR(1'b0),
    .EN(1'b1)
  );

  CC_DFF dff2  (
    .CLK(CLK),
    .D(C),
    .Q(O[1]),
    .SR(1'b0),
    .EN(1'b1)
  );

endmodule
