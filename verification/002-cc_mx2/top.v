module top(input d0, input d1, input s, output [14:0] y);
  genvar i;

  // Regular mux with dynamic inputs
  CC_MX2 mx2_inst (
    .D0(d0),
    .D1(d1),
    .S0(s),
    .Y(y[0])
  );

  // Sweeping S0 values (0, 1) for d0/d1 dynamic
  generate
    for (i = 0; i < 2; i = i + 1) begin : const_s_input
      CC_MX2 mx2_const_s (
        .D0(d0),
        .D1(d1),
        .S0(i[0]),
        .Y(y[1 + i])
      );
    end
  endgenerate

  // Case: constant d0 and d1, dynamic s
  generate
    for (i = 0; i < 4; i = i + 1) begin : const_d_input
      CC_MX2 mx2_const_d (
        .D0(i[0]), // const D0
        .D1(i[1]), // const D1
        .S0(s),
        .Y(y[3 + i])
      );
    end
  endgenerate

  // Case: all inputs constant
  generate
    for (i = 0; i < 8; i = i + 1) begin : const_all
      CC_MX2 mx2_const_all (
        .D0(i[0]),
        .D1(i[1]),
        .S0(i[2]),
        .Y(y[7 + i])
      );
    end
  endgenerate

endmodule