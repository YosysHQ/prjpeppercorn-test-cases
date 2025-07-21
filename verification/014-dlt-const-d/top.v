module top(
  input d, g, sr,
  output [31:0] q
);
  genvar i, j;
  generate
    for (i = 0; i < 16; i = i + 1) begin : param_loop
      for (j = 0; j < 2; j = j + 1) begin : input_mode
        CC_DLT #(
          .G_INV(i[0]),
          .SR_INV(i[1]),
          .SR_VAL(i[2]),
          .INIT(i[3])
        ) dff_inst (
          .D(j[0]),
          .G(g),
          .SR(sr),
          .Q(q[i*2 + j])
        );
      end
    end
  endgenerate

endmodule
