module top(input wire clk, input wire rst, input wire btn0, input wire btn1,
           output wire a_led, output wire b_out);
  wire q;
  CC_ODDR #(
    .CLK_INV(1'b0)
  ) oddr_inst (
    .D0(btn0),
    .D1(btn1),
    .CLK(clk),
    .DDR(rst),
    .Q(q)
  );

  assign a_led = ~q;
  assign b_out = btn0 & btn1;

endmodule
