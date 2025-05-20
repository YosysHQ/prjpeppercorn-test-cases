/**
 ROM - Read only Memory
 16K x 16 bit
 preloaded with the binary instruction codes.
**/
`default_nettype none
module rom(
	input			i_clk,
	input  [14:0]	i_addr,
	output [15:0]	o_data
);

reg [15:0] MEM[0:32767];
initial $readmemb("code.hack",MEM); 

reg [15:0] o_data;
always @(negedge i_clk)
	o_data <= MEM[i_addr];

endmodule
