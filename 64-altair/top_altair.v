module top
(
  input  clk,
  input  rst,
  input  uart_rx,
  output uart_tx
);
  altair machine(.clk(clk),.reset(~rst),.rx(uart_rx),.tx(uart_tx));

endmodule
