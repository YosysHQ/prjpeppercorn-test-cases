module top(
  input  [14:0] A,
  input  [14:0] B,
  input         CI,
  output [14:0] S,
  output        CO
);

  wire [14:0] carry;

  genvar i;
  generate
    for (i = 0; i < 15; i = i + 1) begin : gen_add
      CC_ADDF add_inst (
        .A(A[i]),
        .B(B[i]),
        .CI((i == 0) ? CI : carry[i-1]),
        .CO(carry[i]),
        .S(S[i])
      );
    end
  endgenerate

  //assign CO = carry[15];  // Final carry-out

endmodule
