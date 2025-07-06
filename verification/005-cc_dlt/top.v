module top(
  input  [15:0] d, g, sr,
  output [15:0] q
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
        .D(d[j]),
        .G(g[j]),
        .SR(sr[j]),
        .Q(q[j])
      );
    end
  endgenerate

endmodule
