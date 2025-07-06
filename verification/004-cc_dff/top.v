module top(
  input  [31:0] d, clk, en, sr,
  output [31:0] q
);

  genvar i;
  generate
    for (i = 0; i < 32; i = i + 1) begin : gen_dff
      CC_DFF #(
        .CLK_INV(i[0]),
        .EN_INV(i[1]),
        .SR_INV(i[2]),
        .SR_VAL(i[3]),
        .INIT(i[4])
      ) dff_inst (
        .D(d[i]),
        .CLK(clk[i]),
        .EN(en[i]),
        .SR(sr[i]),
        .Q(q[i])
      );
    end
  endgenerate

endmodule
