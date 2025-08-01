module top(
  input d, clk, en, sr,
  output [87:0] q
);
  genvar i, j;
  generate
    for (i = 0; i < 32; i = i + 1) begin : param_loop
      for (j = 0; j < 2; j = j + 1) begin : input_mode
        CC_DFF #(
          .CLK_INV(i[0]),
          .EN_INV(i[1]),
          .SR_INV(i[2]),
          .SR_VAL(i[3]),
          .INIT(i[4])
        ) dff_inst (
          .D(d),
          .CLK(j[0]),
          .EN(en),
          .SR(sr),
          .Q(q[i*2 + j])
        );
      end
    end
  endgenerate
  generate
    for (i = 0; i < 8; i = i + 1) begin : param_loop
      for (j = 0; j < 2; j = j + 1) begin : input_mode
        CC_DFF #(
          .CLK_INV(i[0]),
          .EN_INV(i[1]),
          .INIT(i[2])
        ) dff_inst_nosr (
          .D(d),
          .CLK(j[0]),
          .EN(en),
          .SR(1'b0),
          .Q(q[64 + i*2 + j])
        );
      end
    end
  endgenerate
  generate
    for (i = 0; i < 4; i = i + 1) begin : param_loop
      for (j = 0; j < 2; j = j + 1) begin : input_mode
        CC_DFF #(
          .CLK_INV(i[0]),
          .EN_INV(i[1])
        ) dff_inst_nosr_noinit (
          .D(d),
          .CLK(j[0]),
          .EN(en),
          .SR(1'b0),
          .Q(q[80 + i*2 + j])
        );
      end
    end
  endgenerate

endmodule
