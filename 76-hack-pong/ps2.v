/**
 PS/2 Keyboard controller
 reads the keyboard and presents the last 3 received bytes.
**/
`default_nettype none
module ps2(
	input			i_clk,
	input			i_rst,
	output			isR,
	input			i_ps2_data,
	input			i_ps2_clk,
	output [23:0]	o_data
);
	
reg[1:0] ps2_clock;					//buffer the last two bits
always @(posedge i_clk)
	ps2_clock <= {ps2_clock[0],i_ps2_clk};

wire flanke = (ps2_clock == 2'b01);	//detect posedge from low to high

reg [10:0] bits;					//buffer the last 11 bits
always @(posedge i_clk)
	if (i_rst | stop)
		bits <= 11'b11111111111;
	else if (flanke)
		bits <= {i_ps2_data,bits[10:1]};

wire	stop = (bits[0]==1'b0);		//stop after last bit (number 10)

reg [23:0] o_data;					//store the last three bytes
always @(posedge i_clk)
	if (i_rst)
		o_data <= 0;
	else if (stop)
		o_data <= {o_data[15:0],bits[8:1]};	

endmodule
