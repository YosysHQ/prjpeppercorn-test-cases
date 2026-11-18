// Carry-out with an extra CC_ADDF user on A
module top(
  input  [3:0] A,
  input  [3:0] B,
  input        CI,
  output [3:0] S
);

  wire [3:0] carry;

  genvar j;
  generate
    for (j = 0; j < 4; j = j + 1) begin : gen_add
      localparam integer k = 3 - j;
      CC_ADDF add_inst (
        .A((k == 3) ? carry[0] : A[k]),
        .B(B[k]),
        .CI((k == 0) ? CI : carry[k-1]),
        .CO(carry[k]),
        .S(S[k])
      );
    end
  endgenerate

endmodule
