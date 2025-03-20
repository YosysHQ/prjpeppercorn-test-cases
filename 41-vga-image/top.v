module top (
	input  wire       clk_i, 
	input  wire       rstn_i,
	output wire [3:0] o_r,
	output wire [3:0] o_g,
	output wire [3:0] o_b,
	output wire       o_vsync,
	output wire       o_hsync
);

wire clk_pix, lock;

pll pll_inst (
    .clock_in(clk_i),
	.rst_in(~rstn_i),
    .clock_out(clk_pix),
    .locked(lock)
);

wire   rst_s = ~lock;

wire [9:0] x;
wire [9:0] y;
wire de_s;

vga_core #(
	.HSZ(10), .VSZ(10)
) vga_inst (.clk_i(clk_pix), .rst_i(rst_s),
	.hcount_o(x), .vcount_o(y),
	.de_o(de_s),
	.vsync_o(o_vsync), .hsync_o(o_hsync)
);

wire [11:0] color;

image_rom sprite(
	.clk(clk_pix),
	.addr(y/4* 160 + x/4),
	.data_out(color));


assign o_r = ~de_s ? 4'b0000 : color[11:8];
assign o_g = ~de_s ? 4'b0000 : color[7:4];
assign o_b = ~de_s ? 4'b0000 : color[3:0];
endmodule
