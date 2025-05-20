/*
 scan codes of keyboard are translated to ASCII
*/
`default_nettype none
module kbd(
	input			i_clk,
	input			i_rst,
	input  [23:0] 	i_ps2_data,
	output [15:0]	o_data
);

//scan codes 9 bits MSB=1 if shift-key is pressed
reg [7:0] scancode[0:511];
initial begin
	scancode[9'h029] = 8'h20;	//space	
	scancode[9'h116] = 8'h21;	//!
	scancode[9'h152] = 8'h22;	//"
	scancode[9'h126] = 8'h23;	//#
	scancode[9'h125] = 8'h24;	//$
	scancode[9'h12E] = 8'h25;	//%
	scancode[9'h13D] = 8'h26;	//&
	scancode[9'h052] = 8'h27;	//'
	scancode[9'h146] = 8'h28;	//(
	scancode[9'h145] = 8'h29;	//)
	scancode[9'h13E] = 8'h2A;	//*
	scancode[9'h155] = 8'h2B;	//+
	scancode[9'h041] = 8'h2C;	//,
	scancode[9'h04E] = 8'h2D;	//-
	scancode[9'h049] = 8'h2E;	//.
	scancode[9'h04A] = 8'h2F;	///
	
	scancode[9'h045] = 8'h30;	//0
	scancode[9'h016] = 8'h31;
	scancode[9'h01E] = 8'h32;
	scancode[9'h026] = 8'h33;
	scancode[9'h025] = 8'h34;
	scancode[9'h02E] = 8'h35;
	scancode[9'h036] = 8'h36;
	scancode[9'h03D] = 8'h37;
	scancode[9'h03E] = 8'h38;
	scancode[9'h046] = 8'h39;	//9
	scancode[9'h14C] = 8'h3A;	//:
	scancode[9'h04C] = 8'h3B;	//;
	scancode[9'h141] = 8'h3C;	//<
	scancode[9'h055] = 8'h3D;	//=
	scancode[9'h149] = 8'h3E;	//>
	scancode[9'h14A] = 8'h3F;	//?
	
	scancode[9'h11E] = 8'h40;	//@
	scancode[9'h11C] = 8'h41;	//A
	scancode[9'h132] = 8'h42;
	scancode[9'h121] = 8'h43;
	scancode[9'h123] = 8'h44;
	scancode[9'h124] = 8'h45;
	scancode[9'h12B] = 8'h46;
	scancode[9'h134] = 8'h47;
	scancode[9'h133] = 8'h48;
	scancode[9'h143] = 8'h49;
	scancode[9'h13B] = 8'h4A;
	scancode[9'h142] = 8'h4B;
	scancode[9'h14B] = 8'h4C;
	scancode[9'h13A] = 8'h4D;
	scancode[9'h131] = 8'h4E;
	scancode[9'h144] = 8'h4F;
	scancode[9'h14D] = 8'h50;
	scancode[9'h115] = 8'h51;
	scancode[9'h12D] = 8'h52;
	scancode[9'h11B] = 8'h53;
	scancode[9'h12C] = 8'h54;
	scancode[9'h13C] = 8'h55;
	scancode[9'h12A] = 8'h56;
	scancode[9'h11D] = 8'h57;
	scancode[9'h122] = 8'h58;
	scancode[9'h135] = 8'h59;
	scancode[9'h11A] = 8'h5A;	//Z
	scancode[9'h054] = 8'h5B;	//[
	scancode[9'h05D] = 8'h5C;	//\
	scancode[9'h05B] = 8'h5D;	//]
	scancode[9'h136] = 8'h5E;	//^
	scancode[9'h14E] = 8'h5F;	//_

	scancode[9'h00E] = 8'h60;	//`
	scancode[9'h01C] = 8'h61;	//a
	scancode[9'h032] = 8'h62;
	scancode[9'h021] = 8'h63;
	scancode[9'h023] = 8'h64;
	scancode[9'h024] = 8'h65;
	scancode[9'h02B] = 8'h66;
	scancode[9'h034] = 8'h67;
	scancode[9'h033] = 8'h68;
	scancode[9'h043] = 8'h69;
	scancode[9'h03B] = 8'h6A;
	scancode[9'h042] = 8'h6B;
	scancode[9'h04B] = 8'h6C;
	scancode[9'h03A] = 8'h6D;
	scancode[9'h031] = 8'h6E;
	scancode[9'h044] = 8'h6F;
	scancode[9'h04D] = 8'h70;
	scancode[9'h015] = 8'h71;
	scancode[9'h02D] = 8'h72;
	scancode[9'h01B] = 8'h73;
	scancode[9'h02C] = 8'h74;
	scancode[9'h03C] = 8'h75;
	scancode[9'h02A] = 8'h76;
	scancode[9'h01D] = 8'h77;
	scancode[9'h022] = 8'h78;
	scancode[9'h035] = 8'h79;
	scancode[9'h01A] = 8'h7A;	//z
	scancode[9'h154] = 8'h7B;	//{
	scancode[9'h15D] = 8'h7C;	//|
	scancode[9'h15B] = 8'h7D;	//}
	scancode[9'h10E] = 8'h7E;	//~

//HACK keycodes:
	scancode[9'h05A] = 8'd128;	//newline
	scancode[9'h066] = 8'd129;	//backspace
	scancode[9'h06B] = 8'd130;	//left arrow
	scancode[9'h075] = 8'd131;	//up arrow
	scancode[9'h074] = 8'd132;	//right arrow
	scancode[9'h072] = 8'd133;	//down arrow
	scancode[9'h06C] = 8'd134;	//home
	scancode[9'h069] = 8'd135;	//end
	scancode[9'h07D] = 8'd136;	//page up
	scancode[9'h07A] = 8'd137;	//page down
	scancode[9'h070] = 8'd138;	//insert
	scancode[9'h071] = 8'd139;	//delete
	scancode[9'h076] = 8'd140;	//esc
	scancode[9'h005] = 8'd141;	//f1
	scancode[9'h006] = 8'd142;	//f2
	scancode[9'h004] = 8'd143;	//f3
	scancode[9'h00C] = 8'd144;	//f4
	scancode[9'h003] = 8'd145;	//f5
	scancode[9'h00B] = 8'd146;	//f6
	scancode[9'h083] = 8'd147;	//f7
	scancode[9'h00A] = 8'd148;	//f8
	scancode[9'h001] = 8'd149;	//f9
	scancode[9'h009] = 8'd150;	//f10
	scancode[9'h078] = 8'd151;	//f11
	scancode[9'h007] = 8'd152;	//f12

//this is to prevent strange output when shift is pressed
	scancode[9'h0F0] = 8'd0;	//no key pressed
	scancode[9'h1F0] = 8'd0;	//no key pressed
	scancode[9'h0E0] = 8'd0;	//no key pressed
	scancode[9'h1E0] = 8'd0;	//no key pressed
	scancode[9'h000] = 8'd0;	//no key pressed
	scancode[9'h100] = 8'd0;	//no key pressed

end

//shift key has keycode 12 or 59.
//and the releaskey F012 or F059
reg shift = 1'b0;
always @(posedge i_clk)
	if (i_rst || (i_ps2_data[15:0]==16'hF012) || (i_ps2_data[15:0]==16'hF059)) shift <= 0;
	else if ((i_ps2_data[7:0]==8'h12)||(i_ps2_data[7:0]==8'h59)) shift <= 1;

//F0xx is release of scankey xx
//F0E0xx is releas of special key E0xx
reg [15:0] o_data;
always @(posedge i_clk)
	if (i_rst || (i_ps2_data[15:8]==8'hF0) || (i_ps2_data[24:8] == 16'hF0E0)) o_data <= 24'h000000;
	else o_data <= {8'h00, scancode[{shift,i_ps2_data[7:0]}]};

endmodule
