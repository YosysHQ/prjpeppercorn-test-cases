`default_nettype none			//disable implicit definitions by Verilog
// vga 640 x 480 @ 60Hz

module vga(
	input i_clk,			//clock 25MHz
	input i_rst,			//reset
	output [12:0] o_addr,	//address bus
	input [15:0] i_data,	//data in
	output o_vga_hs,		//vga horizontal sync
	output o_vga_vs,		//vga vertical sync
	output [3:0] o_vga_r,	//vga red
	output [3:0] o_vga_g,	//vga green
	output [3:0] o_vga_b	//vga blue
);

//one line
parameter h_pol     = 1'b0;	//polarity
parameter h_fp		= 16;	//front porch 8
parameter h_sync	= 96;	//sync
parameter h_bp      = 48;	//back porch 40
parameter h_video	= 640;	//video
parameter h_lb		= h_fp+h_sync+h_bp;	//left border
parameter h_rb		= h_fp+h_sync+h_bp+h_video;	//right border

//one field
parameter v_pol     = 1'b0;	//polarity
parameter v_fp		= 10;	//front porch
parameter v_sync	= 2;	//sync
parameter v_bp		= 33;	//back porch
parameter v_video	= 480;	//video
parameter v_tb		= v_fp+v_sync+v_bp;	//top border
parameter v_bb		= v_fp+v_sync+v_bp+v_video;	//top border

//complete line
reg [9:0] r_h;
wire h_last = (r_h == h_rb-1);
always @(posedge i_clk)
	if (i_rst|h_last) r_h <= 0;
	else r_h <= r_h+1;

//complete field
reg [9:0] r_v;
wire v_last = (r_v == v_bb-1);
always @(posedge i_clk)
	if (i_rst) r_v <= 0;
	else if (h_last && v_last) r_v <= 0;
	else if (h_last) r_v <= r_v + 1;

//horizontal sync
reg r_vga_hs;
always @(posedge i_clk)
	if (i_rst) r_vga_hs <= ~h_pol;
	else if (r_h==h_fp-1) r_vga_hs <= h_pol;
	else if (r_h==h_fp+h_sync-1) r_vga_hs <= ~h_pol;

//vertical sync
reg r_vga_vs;
always @(posedge i_clk)
	if (i_rst) r_vga_vs <= ~v_pol;
	else if (h_last && (r_v==v_fp-1)) r_vga_vs <= v_pol;
	else if (h_last && (r_v==v_fp+v_sync-1)) r_vga_vs <= ~v_pol;

//next cycle is inside the VGA frame of 640x480 pixel.
wire vga_frame_in1 = (r_v >= v_tb) && (r_v< v_bb) && (r_h >= h_lb-1) && (r_h < h_rb -1);
//224 736 800
//Hack video frame is inside the VGA frame with 112 pixel border on top/bottom and 64 pixel border on the left/right side
// the signal must be computed 3 cycles in advance:
// 1 cycle show address
// read memory
// shift databit to vga signal
wire [10:0] f_row = (r_v-v_tb-112);
wire [10:0] f_col_in3 = (r_h-h_lb-64+3);
wire hack_frame_in3  = (f_row<256) && (f_col_in3<512);
wire strobe = hack_frame_in3 && (f_col_in3[3:0]==4'h0);

reg data_read;
always @(posedge i_clk)
	data_read <= strobe;

reg [14:0] r_addr;
always @(posedge i_clk)
	if (i_rst) r_addr <= 0;
	else if (strobe) r_addr <={f_row[9:0],f_col_in3[8:4]};

reg [15:0] r_data;
always @(posedge i_clk)
	if (i_rst) r_data <= 0;
	else if (data_read) r_data <= i_data;
	else r_data <= {1'b0,r_data[15:1]};

assign o_addr = r_addr;

//colors red,green,blue
reg     [11:0]   	r_vga_rgb;
always @(posedge i_clk)
	if (i_rst) r_vga_rgb <= 12'h000;
	else r_vga_rgb <= ((~vga_frame_in1)? 12'h000 : ((r_data[0])? 12'h000 : 12'hFFF));

assign 	o_vga_r 		= r_vga_rgb[11:8];		//assign the output signals for VGA to the VGA registers
assign 	o_vga_g 		= r_vga_rgb[7:4];
assign 	o_vga_b 		= r_vga_rgb[3:0];
assign 	o_vga_hs 		= r_vga_hs;
assign 	o_vga_vs 		= r_vga_vs;

endmodule
