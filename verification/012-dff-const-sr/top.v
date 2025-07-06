module top(
  input d, clk, en, sr,
  output [63:0] q
);

  wire const1 = 1'b1;

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
          .CLK(clk),
          .EN(en),
          .SR(j[0]),
          .Q(q[i*2 + j])
        );
      end
    end
  endgenerate

endmodule
