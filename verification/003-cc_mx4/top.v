module top(
  input [1:0] d0, input [1:0] d1,
  input [1:0] d2, input [1:0] d3,
  input [1:0] s0, input [1:0] s1,
  output [19:0] y
);

  genvar i, j, k;

  // Case 1: Fully dynamic
  generate
    for (i = 0; i < 2; i = i + 1) begin : gen_mx4
      CC_MX4 mx4_inst (
        .D0(d0[i]),
        .D1(d1[i]),
        .D2(d2[i]),
        .D3(d3[i]),
        .S0(s0[i]),
        .S1(s1[i]),
        .Y(y[i])
      );
    end
  endgenerate

  // Case 2: Constant S0/S1 (00, 01, 10, 11)
  generate
    for (i = 0; i < 2; i = i + 1) begin : gen_input_mode
      for (j = 0; j < 2; j = j + 1) begin
        for (k = 0; k < 2; k = k + 1) begin
          CC_MX4 mx4_inst_const_s (
            .D0(d0[i]),
            .D1(d1[i]),
            .D2(d2[i]),
            .D3(d3[i]),
            .S0(j[0]),
            .S1(k[0]),
            .Y(y[2 + i*4 + j*2 + k])
          );
        end
      end
    end
  endgenerate

  // Case 3: Constant D inputs, dynamic selectors
  generate
    for (i = 0; i < 2; i = i + 1) begin : const_data
      CC_MX4 mx4_const_d (
        .D0(1'b0),
        .D1(1'b1),
        .D2(1'b0),
        .D3(1'b1),
        .S0(s0[i]),
        .S1(s1[i]),
        .Y(y[10 + i])
      );
    end
  endgenerate

  // Case 4: All constant inputs
  generate
    for (j = 0; j < 2; j = j + 1) begin
      for (k = 0; k < 2; k = k + 1) begin
        CC_MX4 mx4_const_all (
          .D0(1'b0),
          .D1(1'b1),
          .D2(1'b0),
          .D3(1'b1),
          .S0(j[0]),
          .S1(k[0]),
          .Y(y[12 + j*2 + k])
        );
      end
    end
  endgenerate

  // Case 5: S0 constant (0 and 1), S1 dynamic
  generate
    for (j = 0; j < 2; j = j + 1) begin : const_s0
      CC_MX4 mx4_const_s0 (
        .D0(d0[0]),
        .D1(d1[0]),
        .D2(d2[0]),
        .D3(d3[0]),
        .S0(j[0]),
        .S1(s1[0]),
        .Y(y[16 + j])
      );
    end
  endgenerate

  // Case 6: S1 constant (0 and 1), S0 dynamic
  generate
    for (j = 0; j < 2; j = j + 1) begin : const_s1
      CC_MX4 mx4_const_s1 (
        .D0(d0[1]),
        .D1(d1[1]),
        .D2(d2[1]),
        .D3(d3[1]),
        .S0(s0[1]),
        .S1(j[0]),
        .Y(y[18 + j])
      );
    end
  endgenerate

endmodule
