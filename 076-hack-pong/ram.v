/**
 RAM
 Random access memory with 24576 x 16bit
 has two ports. One for the CPU clocked at 10MHz
 the second port is clocked @ 25MHz and is used as read port by the vga
**/
`default_nettype none
module ram(
	input			i_clk,
	input			i_rst,
	input  [14:0]	i_addr,		//port1
	output [15:0]	o_data,
	input  [15:0]	i_data,
	input			i_write,
	input			i_clk25,	//port2
	input  [14:0]	i_addr2,
	output [15:0]	o_data2
);

reg [15:0] MEM[0:24575];
//initial MEM[16'h4000]=16'hFFFF;
always @(posedge i_clk)
	if (i_write) MEM[i_addr] <= i_data;

reg [15:0] o_data;
always @(negedge i_clk)
	o_data <= MEM[i_addr];

reg[15:0] o_data2;
always @(negedge i_clk25)
	o_data2 <= MEM[i_addr2];

endmodule
