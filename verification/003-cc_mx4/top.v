module top(
  input d0, input d1,
  input d2, input d3,
  input s0, input s1,
  output [88:0] y
);

  genvar i;

  // Case 1: Fully dynamic
  CC_MX4 mx4_inst (
    .D0(d0),
    .D1(d1),
    .D2(d2),
    .D3(d3),
    .S0(s0),
    .S1(s1),
    .Y(y[0])
  );

  // Case 2: Constant S0/S1 (00, 01, 10, 11)
  generate
    for (i = 0; i < 4; i = i + 1) begin : const_s_input
      CC_MX4 mx4_const_s (
        .D0(d0),
        .D1(d1),
        .D2(d2),
        .D3(d3),
        .S0(i[0]),
        .S1(i[1]),
        .Y(y[1 + i])
      );
    end
  endgenerate

  // Case 3: Constant D inputs, dynamic selectors
  generate
    for (i = 0; i < 16; i = i + 1) begin : const_d_input
      CC_MX4 mx4_const_d (
        .D0(i[0]),
        .D1(i[1]),
        .D2(i[2]),
        .D3(i[3]),
        .S0(s0),
        .S1(s1),
        .Y(y[5 + i])
      );
    end
  endgenerate

  // Case 4: All constant inputs
  generate
    for (i = 0; i < 64; i = i + 1) begin : const_all
      CC_MX4 mx4_const_all (
        .D0(i[0]),
        .D1(i[1]),
        .D2(i[2]),
        .D3(i[3]),
        .S0(i[4]),
        .S1(i[5]),
        .Y(y[21 + i])
      );
    end
  endgenerate

  // Case 5: S0 constant (0 and 1), S1 dynamic
  generate
    for (i = 0; i < 2; i = i + 1) begin : const_s0
      CC_MX4 mx4_const_s0 (
        .D0(d0),
        .D1(d1),
        .D2(d2),
        .D3(d3),
        .S0(i[0]),
        .S1(s1),
        .Y(y[85 + i])
      );
    end
  endgenerate

  // Case 6: S1 constant (0 and 1), S0 dynamic
  generate
    for (i = 0; i < 2; i = i + 1) begin : const_s1
      CC_MX4 mx4_const_s1 (
        .D0(d0),
        .D1(d1),
        .D2(d2),
        .D3(d3),
        .S0(s0),
        .S1(i[0]),
        .Y(y[87 + i])
      );
    end
  endgenerate

endmodule
