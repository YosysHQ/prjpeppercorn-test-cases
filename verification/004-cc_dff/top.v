module top(
  input  d, clk, en, sr,
  output [47:0] q
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
        .D(d),
        .CLK(clk),
        .EN(en),
        .SR(sr),
        .Q(q[i])
      );
    end
  endgenerate
  generate
    for (i = 0; i < 16; i = i + 1) begin : gen_dff_x
      CC_DFF #(
        .CLK_INV(i[0]),
        .EN_INV(i[1]),
        .SR_INV(i[2]),
        .SR_VAL(i[3]),
      ) dff_inst_x (
        .D(d),
        .CLK(clk),
        .EN(en),
        .SR(sr),
        .Q(q[i+32])
      );
    end
  endgenerate
endmodule
