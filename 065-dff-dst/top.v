module top(
    input wire btn0,
    input wire btn1,
    input wire btn2,
    output wire led
);
    reg counter;
	always @(posedge btn2 or posedge btn0)
	begin
		if (btn0) begin
			counter <= 1'b1;
		end
		else if (btn1) begin
			counter <= ~counter;
		end
	end
    assign led = counter;


endmodule

