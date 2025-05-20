module top (
    input clk,
    // outputs
    output wire [7:0] led
);
    wire [7:0] led_wire;

attosoc soc(
	.clk(clk),
	.led(led_wire)
);

assign led = ~led_wire;

endmodule
