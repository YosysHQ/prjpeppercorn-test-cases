module top(
  input d, g, sr,
  output [43:0] q
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
          .D(d),
          .G(j[0]),
          .SR(sr),
          .Q(q[i*2 + j])
        );
      end
    end
  endgenerate
  generate
    for (i = 0; i < 4; i = i + 1) begin : param_loop
      for (j = 0; j < 2; j = j + 1) begin : input_mode
        CC_DLT #(
          .G_INV(i[0]),
          .INIT(i[1])
        ) dff_inst_nosr (
          .D(d),
          .G(j[0]),
          .SR(1'b0),
          .Q(q[32 + i*2 + j])
        );
      end
    end
  endgenerate
  generate
    for (i = 0; i < 2; i = i + 1) begin : param_loop
      for (j = 0; j < 2; j = j + 1) begin : input_mode
        CC_DLT #(
          .G_INV(i[0])
        ) dff_inst_nosr_noinit (
          .D(d),
          .G(j[0]),
          .SR(1'b0),
          .Q(q[40 + i*2 + j])
        );
      end
    end
  endgenerate

endmodule
