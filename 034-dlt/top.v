module top(input wire btn0, input wire btn1, output wire led);
    reg counter;
	always @*
		if ( btn0 )
			counter <= btn1;
    assign led = counter;
endmodule
