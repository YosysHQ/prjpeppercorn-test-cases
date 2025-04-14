module top
(
  input clk,
  input uart_rx,
  output uart_tx
);

  reg [5:0] reset_cnt = 0;
	wire resetn = &reset_cnt;

	always @(posedge clk) begin
		reset_cnt <= reset_cnt + !resetn;
	end

  zexall machine(.clk(clk),.reset(~resetn),.rx(uart_rx),.tx(uart_tx));

endmodule
