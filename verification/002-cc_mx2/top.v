module top(input [1:0] d0, input [1:0] d1, input [1:0] s, output [11:0] y);

  genvar i, j;

  // Regular mux with dynamic inputs
  generate
    for (i = 0; i < 2; i = i + 1) begin : gen_mx2
      CC_MX2 mx2_inst (
        .D0(d0[i]),
        .D1(d1[i]),
        .S0(s[i]),
        .Y(y[i])
      );
    end
  endgenerate

  // Sweeping S0 values (0, 1) for all d0/d1 combinations
  generate
    for (i = 0; i < 2; i = i + 1) begin : gen_sweep
      for (j = 0; j < 2; j = j + 1) begin : input_mode
        CC_MX2 mx2_inst_s (
          .D0(d0[i]),
          .D1(d1[i]),
          .S0(j[0]),
          .Y(y[2 + i*2 + j])
        );
      end
    end
  endgenerate

  // Case: constant d0 and d1, dynamic s
  generate
    for (i = 0; i < 2; i = i + 1) begin : const_d_input
      CC_MX2 mx2_const_d (
        .D0(1'b0), // const D0
        .D1(1'b1), // const D1
        .S0(s[i]),
        .Y(y[6 + i])
      );
    end
  endgenerate

  // Case: all inputs constant
  generate
    for (i = 0; i < 2; i = i + 1) begin : const_all
      for (j = 0; j < 2; j = j + 1) begin : const_sweep
        CC_MX2 mx2_const_all (
          .D0(1'b0),
          .D1(1'b1),
          .S0(j[0]),
          .Y(y[8 + i*2 + j])
        );
      end
    end
  endgenerate

endmodule