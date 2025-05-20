module top(input wire clk, input wire rst, output wire led1, output wire led2);
  CC_IDDR #(
    .CLK_INV(1'b0)
  ) iddr_inst (
    .D(rst),
    .CLK(clk),
    .Q0(led1),
    .Q1(led2)
  );
endmodule
