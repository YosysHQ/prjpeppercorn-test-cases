`default_nettype none
module video (
  input         clk,
  input         reset,
  output [3:0]  vga_r,
  output [3:0]  vga_b,
  output [3:0]  vga_g,
  output        vga_hs,
  output        vga_vs,
  output        vga_de,
  input  [7:0]  vga_data,
  output [12:0] vga_addr,
  output        n_int,
  input  [2:0]  border_color
);

  parameter HA = 640;
  parameter HS  = 96;
  parameter HFP = 16;
  parameter HBP = 48;
  parameter HT  = HA + HS + HFP + HBP;
  parameter HB = 64;
  parameter HB2 = HB/2-8; // NOTE pixel coarse H-adjust
  parameter HDELAY = 3; // NOTE pixel fine H-adjust
  parameter HBattr = 4; // NOTE attr coarse H-adjust
  parameter HBadj = 4; // NOTE border H-adjust

  parameter VA = 480;
  parameter VS  = 2;
  parameter VFP = 11;
  parameter VBP = 31;
  parameter VT  = VA + VS + VFP + VBP;
  parameter VB = 48;
  parameter VB2 = VB/2;

  reg [9:0] hc = 0;
  reg [9:0] vc = 0;
  reg INT = 0;
  reg[5:0] intCnt = 1;
  reg [5:0] flash_cnt = 0;

  assign n_int = !INT;

  always @(posedge clk) begin
    if (hc == HT - 1) begin
      hc <= 0;
      if (vc == VT - 1) vc <= 0;
      else vc <= vc + 1;
    end else hc <= hc + 1;
    if (hc == HA + HFP && vc == VA + VFP) begin
      INT <= 1;
      flash_cnt <= flash_cnt + 1;
    end
    if (INT) intCnt <= intCnt + 1;
    if (!intCnt) INT <= 0;
  end

  assign vga_hs = !(hc >= HA + HFP && hc < HA + HFP + HS);
  assign vga_vs = !(vc >= VA + VFP && vc < VA + VFP + VS);
  assign vga_de = !(hc > HA || vc > VA);

  wire [7:0] x = hc[9:1] - HB2;
  wire [7:0] y = vc[9:1] - VB2;

  wire hBorder = (hc < (HB + HBadj) || hc >= (HA - HB + HBadj));
  wire vBorder = (vc < VB || vc >= VA - VB);
  wire border = hBorder || vBorder;

  wire [7:3] xattr_early = hc[8:4]-HBattr;
  reg [12:0] R_vga_addr;
  reg [7:0] R_attr_data, R_pixel_data;
  reg [HDELAY-1:0] R_pixel;
  always @(posedge clk)
  begin
    if (hc[0])
    begin
      R_vga_addr <= {3'b110, y[7:3], xattr_early[7:3]}; // attr addr
      R_attr_data <= vga_data;
    end
    else
    begin
      R_vga_addr <= {y[7:6], y[2:0], y[5:3],x[7:3]}; // pixel addr
      if (hc[3:1])
        R_pixel_data <= {R_pixel_data[6:0],1'b0};
      else
        R_pixel_data <= vga_data;
    end
    R_pixel <= {R_pixel_data[7], R_pixel[HDELAY-1:1]}; // delay line
  end
  assign vga_addr = R_vga_addr;
  wire pixel = R_pixel[0];

  wire [2:0] ink = R_attr_data[2:0];
  wire [2:0] paper = R_attr_data[5:3];
  wire bright = R_attr_data[6];
  wire flash = R_attr_data[7];
  wire flashing = flash && flash_cnt[5];

  wire ink_red = flashing ? paper[1] : ink[1];
  wire ink_green = flashing ? paper[2] : ink[2];
  wire ink_blue = flashing ? paper[0] : ink[0];

  wire paper_red = flashing ? ink[1] :paper[1];
  wire paper_green = flashing ? ink[2] : paper[2];
  wire paper_blue = flashing ? ink[0] : paper[0];

  wire [3:0] red   = border ? {1'b0,{3{border_color[1]}}} : bright ? {4{pixel ? ink_red   : paper_red}}   : {1'b0, {3{pixel ? ink_red   : paper_red}}};
  wire [3:0] green = border ? {1'b0,{3{border_color[2]}}} : bright ? {4{pixel ? ink_green : paper_green}} : {1'b0, {3{pixel ? ink_green : paper_green}}};
  wire [3:0] blue  = border ? {1'b0,{3{border_color[0]}}} : bright ? {4{pixel ? ink_blue  : paper_blue}}  : {1'b0, {3{pixel ? ink_blue  : paper_blue}}};
  assign vga_r = !vga_de ? 4'b0 : red;
  assign vga_g = !vga_de ? 4'b0 : green;
  assign vga_b = !vga_de ? 4'b0 : blue;

endmodule
