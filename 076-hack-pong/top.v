/*
 top module contains the whole design:
 HACK CPU
 RAM (includes Videoram)
 ROM (preloaded with Hack binary code)
 PLL - generates 25 MHz for VGA 
 VGA
 PS/2 Keyboard
*/
`default_nettype none
module top(
   input		CLK,
   output		LED,
   input		BUT,
   output		VGA_HS,
   output		VGA_VS,
   output [3:0]	VGA_R,
   output [3:0]	VGA_G,
   output [3:0]	VGA_B,
   input 		PS2_DATA,
   input 		PS2_CLK
);

//PLL - phase locked loop generates 25 MHz for VGA
wire clk25;
pll25 PLL25(.clock_in(CLK),.clock_out(clk25),.locked());

//PLL - phase locked loop generates 10 MHz for the rest
wire clk;
wire locked;
pll PLL(.clock_in(CLK),.clock_out(clk),.locked(locked));

//RST - generate reset signal
reg [3:0] reset = 0;
always @(posedge clk)
	if (~BUT|~locked) reset <= 0;
	else if (rst) reset <= reset + 1;
wire rst = ~reset[3];

//VGA - Video graphics adapter 640x480 @ 50Hz
wire [12:0] vga_addr;
wire vga_ready;
wire [15:0] vga_data;
vga VGA(
	.i_clk(clk25),
	.i_rst(rst),
	.o_addr(vga_addr),
	.i_data(vga_data),
	.o_vga_r(VGA_R),
	.o_vga_g(VGA_G),
	.o_vga_b(VGA_B),
	.o_vga_hs(VGA_HS),
	.o_vga_vs(VGA_VS)
);

//PS2 - Keyboard controller
wire [23:0] ps2_data;
ps2 PS2(
	.i_clk(clk),
	.i_rst(rst),
	.i_ps2_data(PS2_DATA),
	.i_ps2_clk(PS2_CLK),
	.o_data(ps2_data)
);

//KBD - PS2 to ASCII converter
wire [15:0] kbd;
kbd KBD(
	.i_clk(clk),
	.i_rst(rst),
	.i_ps2_data(ps2_data),
	.o_data(kbd)
);

//RAM - random access memory
ram RAM(
	.i_clk(clk),
	.i_clk25(clk25),
	.i_rst(rst),
	.i_addr(addr),
	.i_write(write),
	.i_data(data_w),
	.o_data(data_r),
	.i_addr2(15'h4000 + vga_addr),
	.o_data2(vga_data)
);

//CPU - HACK CPU
wire [15:0] instruction;
wire [15:0] data_r;
wire [15:0] data_w;
wire [14:0] addr;
wire [14:0] pc;
wire write;
cpu CPU(
	.clk(clk),
	.reset(rst),
	.inM((addr==16'h6000)? kbd: data_r),
	.instruction(instruction),
	.outM(data_w),
	.writeM(write),
	.addressM(addr),
	.pc(pc)
);

//ROM - Read only memory, preloaded with hack binary code
rom ROM(
	.i_clk(clk),
	.i_addr(pc),
	.o_data(instruction)
);

endmodule
