module top(
  input  d, g, sr,
  output [23:0] q
);

  genvar j;
  generate
    for (j = 0; j < 16; j = j + 1) begin : gen_dlt
      CC_DLT #(
        .G_INV(j[0]),
        .SR_INV(j[1]),
        .SR_VAL(j[2]),
        .INIT(j[3])
      ) dlt_inst (
        .D(d),
        .G(g),
        .SR(sr),
        .Q(q[j])
      );
    end
  endgenerate
  generate
    for (j = 0; j < 8; j = j + 1) begin : gen_dlt_x
      CC_DLT #(
        .G_INV(j[0]),
        .SR_INV(j[1]),
        .SR_VAL(j[2])
      ) dlt_inst_x (
        .D(d),
        .G(g),
        .SR(sr),
        .Q(q[j+16])
      );
    end
  endgenerate

endmodule
