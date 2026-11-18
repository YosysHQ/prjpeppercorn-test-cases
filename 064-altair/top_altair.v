module top
(
  input  clk,
  input  rst,
  input  uart_rx,
  output uart_tx
);
  // power-up reset, also asserted while the button is pressed
  reg [5:0] reset_cnt = 0;
  wire resetn = &reset_cnt;
  always @(posedge clk)
    reset_cnt <= reset_cnt + !resetn;

  altair machine(.clk(clk),.reset(~rst | ~resetn),.rx(uart_rx),.tx(uart_tx));

endmodule
