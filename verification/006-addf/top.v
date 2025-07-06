module top(
  input  [15:0] A,
  input  [15:0] B,
  input         CI,
  output [15:0] S,
  output        [15:0] carry
);

  wire [15:0] carry;

  genvar i;
  generate
    for (i = 0; i < 16; i = i + 1) begin : gen_add
      CC_ADDF add_inst (
        .A(A[i]),
        .B(B[i]),
        .CI((i == 0) ? CI : carry[i-1]),
        .CO(carry[i]),
        .S(S[i])
      );
    end
  endgenerate
endmodule
