
module IOSEL #(
	parameter OPEN_DRAIN = 1'b0,
	parameter SLEW = 1'b0,
	parameter DRIVE = 2'b0,
	parameter INPUT_ENABLE = 1'b0,
	parameter PULLDOWN = 1'b0,
	parameter PULLUP = 1'b0,
	parameter SCHMITT_TRIGGER = 1'b0,
	parameter OUT_SIGNAL = 1'b0,
	parameter OUT1_4 = 1'b0,
	parameter OUT2_3 = 1'b0,
	parameter OUT23_14_SEL = 1'b0,
	parameter USE_CFG_BIT = 1'b0,
	parameter USE_DDR = 1'b0,
	parameter SEL_IN_CLOCK = 1'b0,
	parameter SEL_OUT_CLOCK = 1'b0,
	parameter OE_ENABLE = 1'b0,
	parameter [1:0] OE_SIGNAL = 2'b0,
	parameter OUT1_FF = 1'b0,
	parameter OUT2_FF = 1'b0,
	parameter IN1_FF = 1'b0,
	parameter IN2_FF = 1'b0,
	parameter [1:0] OUT_CLOCK = 2'b0,
	parameter INV_OUT1_CLOCK = 1'b0,
	parameter INV_OUT2_CLOCK = 1'b0,
	parameter [1:0] IN_CLOCK = 2'b0,
	parameter INV_IN1_CLOCK = 1'b0,
	parameter INV_IN2_CLOCK = 1'b0,
	parameter [15:0] DELAY_OBF = 15'b0,
	parameter [15:0] DELAY_IBF = 15'b0,
	parameter LVDS_EN = 1'b0,
	parameter LVDS_BOOST = 1'b0,
	parameter LVDS_IE = 1'b0,
	parameter LVDS_RTERM = 1'b0
)(
	input  OUT1,
	input  OUT2,
	input  OUT3,
	input  OUT4,
	input  DDR,
	output IN1,
	output IN2,
	input CLOCK1,
	input CLOCK2,
	input CLOCK3,
	input CLOCK4,

	output GPIO_OUT,
	output GPIO_EN,
	input GPIO_IN
);
	reg q0_o = 1'bx;
	reg q1_o = 1'bx;
	reg q2_o = 1'bx;
	reg q3_o = 1'bx;

	wire q0_i = OUT1_4 ? OUT4 : OUT1;
	wire q1_i = OUT2_3 ? OUT3 : OUT2;

	wire q0mx_o = OUT1_FF ? q0_o : q0_i;
	wire q1mx_o = OUT2_FF ? q1_o : q1_i;

	wire omux_sel = (USE_DDR & ~USE_CFG_BIT) ? DDR : OUT23_14_SEL;
	assign GPIO_OUT = OUT_SIGNAL ? (omux_sel ? q1mx_o : q0mx_o) : (omux_sel ? 1'b1 : 1'b0);

	wire clk_o = OUT_CLOCK[1] ? (OUT_CLOCK[0] ? CLOCK4 : CLOCK3) : (OUT_CLOCK[0] ? CLOCK2 : CLOCK1);
	wire clk_i = IN_CLOCK[1] ? (IN_CLOCK[0] ? CLOCK4 : CLOCK3) : (IN_CLOCK[0] ? CLOCK2 : CLOCK1);

	wire clk_out = SEL_OUT_CLOCK ? (~OUT1_4 ? OUT4 : OUT1) : clk_o;
	wire clk_in = SEL_IN_CLOCK ? (~OUT1_4 ? OUT4 : OUT1) : clk_i;

	wire q0clk = INV_OUT1_CLOCK ^ clk_out;
	wire q1clk = INV_OUT2_CLOCK ^ clk_out;
	wire q2clk = INV_IN1_CLOCK ^ clk_in;
	wire q3clk = INV_IN2_CLOCK ^ clk_in;

	assign IN1 = IN1_FF ? q2_o : GPIO_IN;
	assign IN2 = IN2_FF ? q3_o : GPIO_IN;

	always @(posedge q0clk)
	begin
		q0_o <= q0_i;
	end

	always @(posedge q1clk)
	begin
		q1_o <= q1_i;
	end

	always @(posedge q2clk)
	begin
		q2_o <= GPIO_IN;
	end

	always @(posedge q3clk)
	begin
		q3_o <= GPIO_IN;
	end

	assign GPIO_EN = ~(OE_SIGNAL[1] ? (OE_SIGNAL[0] ? OUT4 : OUT3) : (OE_SIGNAL[0] ? OUT2 : OE_ENABLE));
endmodule

module CPE_IBUF (
	input  I,
	output Y
);
  assign Y = I;
endmodule

module CPE_OBUF (
	input  A,
	output O
);
  assign O = A;
endmodule

module CPE_TOBUF (
	input A,
	input T,
	output O
);
  assign O = T ? 1'bz: A;
endmodule

module CPE_IOBUF (
	input A,
	input T,
	output Y,
	inout IO
);
  assign IO = T ? 1'bz: A;
  assign Y = IO;
endmodule

module CPE_LVDS_IBUF (
	input  I_P, I_N,
	output Y
);
	assign Y = I_P;
endmodule

module CPE_LVDS_OBUF (
	input  A,
	output O_P,
	output O_N
);
	assign O_P = A;
	assign O_N = ~O_P;
endmodule

module CPE_LVDS_TOBUF (
	input A,
	input T,
	output O_P,
	output O_N
);
  assign O_P = T ? 1'bz: A;
  assign O_N = T ? 1'bz: ~A;
endmodule

module CPE_LVDS_IOBUF (
	input A,
	input T,
	output Y,
	inout IO_P,
	inout IO_N,
);
  assign IO_P = T ? 1'bz: A;
  assign IO_N = T ? 1'bz: ~A;
  assign Y = IO_P;
endmodule

module CPE_L2T4 #(
	parameter [3:0] INIT_L00 = 4'b0000,
	parameter [3:0] INIT_L01 = 4'b0000,
	parameter [3:0] INIT_L10 = 4'b0000,
	parameter [3:0] INIT_L20 = 4'b0000,
	parameter L2T4_UPPER = 1'b0,
	parameter C_I1 = 1'b0,
	parameter C_I2 = 1'b0,
	parameter C_I3 = 1'b0,
	parameter C_I4 = 1'b0,
	parameter [2:0] C_FUNCTION = 3'b000,
	parameter C_HORIZ = 1'b0
)(
	input  IN1,
	input  IN2,
	input  IN3,
	input  IN4,
	input  CINY1,
	input  PINY1,
	input  CINX,
	input  PINX,
	input  COMBIN,
	output OUT
);
	wire IN2_int = L2T4_UPPER ? C_I1 ? PINY1 : IN2 : C_I3 ? PINY1 : IN2;
	wire IN4_int = L2T4_UPPER ? C_I2 ? CINX  : IN4 : C_I4 ? PINX  : IN4;
	wire CIN_int = C_HORIZ ? CINX : CINY1;

	wire [1:0] l00_s1 = IN2_int ? INIT_L00[3:2] : INIT_L00[1:0];
	wire l00 = IN1 ? l00_s1[1] : l00_s1[0];

	wire [1:0] l01_s1 = IN4_int ? INIT_L01[3:2] : INIT_L01[1:0];
	wire l01_int = (IN3 ? l01_s1[1] : l01_s1[0]);
	wire l01 = (L2T4_UPPER == 1'b0 && C_FUNCTION == 3'b101) ? CIN_int | l01_int : l01_int;

	wire [1:0] l10_s1 = l01 ? INIT_L10[3:2] : INIT_L10[1:0];
	wire l10 = l00 ? l10_s1[1] : l10_s1[0];

	wire [1:0] l20_s1 = l10 ? INIT_L20[3:2] : INIT_L20[1:0];
	wire OUT_int = L2T4_UPPER ? l10 : (INIT_L20==4'b1100 ? l10 : (COMBIN ? l20_s1[1] : l20_s1[0]));
	assign OUT = (L2T4_UPPER == 1'b0 && C_FUNCTION == 3'b111) ? CIN_int ^ OUT_int : OUT_int;
endmodule

module CPE_MX4 #(
	parameter [3:0] INIT_L00 = 4'b0000,
	parameter [3:0] INIT_L01 = 4'b0000,
	parameter [3:0] INIT_L10 = 4'b0000,
	parameter [3:0] INIT_L02 = 4'b0000,
	parameter [3:0] INIT_L03 = 4'b0000,
	parameter [3:0] INIT_L11 = 4'b0000,
	parameter [3:0] INIT_L20 = 4'b0000, // Unused
	parameter [2:0] C_FUNCTION = 3'b000,
	parameter C_I3 = 1'b0,
	parameter C_I4 = 1'b0
)(
	input  IN1,
	input  IN2,
	input  IN3,
	input  IN4,
	input  IN5,
	input  IN6,
	input  IN7,
	input  IN8,
	input  PINY1,
	input  PINX,
	output OUT1
);
	wire [1:0] l02_s1 = (C_I3 ? PINY1 : IN6) ? INIT_L02[3:2] : INIT_L02[1:0];
	wire s0 = IN5 ? l02_s1[1] : l02_s1[0];

	wire [1:0] l03_s1 = (C_I4 ? PINX  : IN8) ? INIT_L03[3:2] : INIT_L03[1:0];
	wire s1 = IN7 ? l03_s1[1] : l03_s1[0];

	wire in4_int = (INIT_L10[3] ? IN4 : 1'b0) ^ INIT_L11[3];
	wire in3_int = (INIT_L10[2] ? IN3 : 1'b0) ^ INIT_L11[2];
	wire in2_int = (INIT_L10[1] ? IN2 : 1'b0) ^ INIT_L11[1];
	wire in1_int = (INIT_L10[0] ? IN1 : 1'b0) ^ INIT_L11[0];

	assign OUT1 = s1 ? (s0 ? in4_int : in3_int) : (s0 ? in2_int : in1_int);
endmodule

module CPE_RAMO #(
	parameter C_RAM_O = 1'b0
)(
	input  I,
	output RAM_O
);
	assign RAM_O = I;
endmodule

module CPE_RAMI #(
	parameter C_RAM_I = 1'b0
)(
	input  RAM_I,
	output OUT
);
	assign OUT = RAM_I;
endmodule

module CPE_RAMIO #(
	parameter C_RAM_O = 1'b0,
	parameter C_RAM_I = 1'b0
)(
	input  I,
	input  RAM_I,
	output OUT,
	output RAM_O
);
	assign RAM_O = I;
	assign OUT = RAM_I;
endmodule

module CPE_FF #(
	parameter [1:0] C_CPE_CLK = 2'b00,
	parameter [1:0] C_CPE_EN = 2'b00,
	parameter [1:0] C_CPE_RES = 2'b00,
	parameter [1:0] C_CPE_SET = 2'b00,
	parameter [1:0] FF_INIT = 2'b00,
	parameter C_EN_SR = 1'b0,
	parameter C_CLKSEL = 1'b0, // used in routing
	parameter C_ENSEL = 1'b0   // used in routing
)(
	input DIN,
	input EN,
	input SR,
	input CLK,
	output DOUT
);
	wire CP_i, EN_i, RES_i, SET_i;
	reg  q_i;
	
	if (C_CLKSEL)
		// actual CLK signal is from CINY2
		assign CP_i = (C_CPE_CLK == 2'b00) ? CLK : ~CLK;
	else
		assign CP_i = (C_CPE_CLK == 2'b00) ? 1'b0 :
					(C_CPE_CLK == 2'b01) ? ~CLK :
					(C_CPE_CLK == 2'b10) ? CLK :
					1'b1;
	if (C_ENSEL)
		// actual EN signal is from PINY2
		assign EN_i = (C_CPE_EN == 2'b00) ? EN : ~EN;
	else
		assign EN_i = (C_CPE_EN == 2'b00) ? 1'b0 :
					(C_CPE_EN == 2'b01) ? ~EN :
					(C_CPE_EN == 2'b10) ? EN :
					1'b1;
	assign RES_i = (C_CPE_RES == 2'b00) ? 1'b1 :
				   (C_CPE_RES == 2'b01) ? SR :
				   (C_CPE_RES == 2'b10) ? ~SR :
				   1'b0;

	assign SET_i = (C_CPE_SET == 2'b00) ? 1'b1 :
				   (C_CPE_SET == 2'b01) ? (C_EN_SR ? SR : EN) :
				   (C_CPE_SET == 2'b10) ? ~(C_EN_SR ? SR : EN) :
				   1'b0;

	initial q_i = (FF_INIT[1] == 1'b1) ? FF_INIT[0] : 1'bx;

	always @(posedge CP_i or posedge RES_i or posedge SET_i)
	begin
		if (RES_i) begin
			q_i <= 1'b0;
		end
		else
		if (SET_i) begin
			q_i <= 1'b1;
		end
		else
		if (EN_i) begin
			q_i <= DIN;
		end
	end
	assign DOUT = q_i;
endmodule

module CPE_LATCH #(
	parameter [1:0] C_CPE_CLK = 2'b00,
	parameter [1:0] C_CPE_EN = 2'b00,
	parameter [1:0] C_CPE_RES = 2'b00,
	parameter [1:0] C_CPE_SET = 2'b00,
	parameter [1:0] FF_INIT = 2'b00,
	parameter C_EN_SR = 1'b0,
	parameter C_L_D = 1'b1,
	parameter C_CLKSEL = 1'b0, // used in routing
	parameter C_ENSEL = 1'b0   // used in routing
)(
	input DIN,
	input EN,
	input SR,
	input CLK,
	output DOUT
);
	wire CP_i, EN_i, RES_i, SET_i;
	reg  q_i;
	
	if (C_CLKSEL)
		// actual CLK signal is from CINY2
		assign CP_i = (C_CPE_CLK == 2'b00) ? CLK : ~CLK;
	else
		assign CP_i = (C_CPE_CLK == 2'b00) ? 1'b0 :
					(C_CPE_CLK == 2'b01) ? ~CLK :
					(C_CPE_CLK == 2'b10) ? CLK :
					1'b1;
	if (C_ENSEL)
		// actual EN signal is from PINY2
		assign EN_i = (C_CPE_EN == 2'b00) ? EN : ~EN;
	else
		assign EN_i = (C_CPE_EN == 2'b00) ? 1'b0 :
					(C_CPE_EN == 2'b01) ? ~EN :
					(C_CPE_EN == 2'b10) ? EN :
					1'b1;
	assign RES_i = (C_CPE_RES == 2'b00) ? 1'b1 :
				   (C_CPE_RES == 2'b01) ? SR :
				   (C_CPE_RES == 2'b10) ? ~SR :
				   1'b0;

	assign SET_i = (C_CPE_SET == 2'b00) ? 1'b1 :
				   (C_CPE_SET == 2'b01) ? (C_EN_SR ? SR : EN) :
				   (C_CPE_SET == 2'b10) ? ~(C_EN_SR ? SR : EN) :
				   1'b0;

	initial q_i = (FF_INIT[1] == 1'b1) ? FF_INIT[0] : 1'bx;

	always @(*)
	begin
		if (RES_i) begin
			q_i = 1'b0;
		end
		else if (SET_i) begin
			q_i = 1'b1;
		end
		else if (CP_i) begin
			q_i = DIN;
		end
	end
	assign DOUT = q_i;
endmodule


module CPE_CPLINES #(
	parameter C_SELX  = 1'b0,
	parameter C_SELY1 = 1'b0,
	parameter C_SELY2 = 1'b0,
	parameter C_SEL_C = 1'b0,
	parameter C_SEL_P = 1'b0,
	parameter C_Y12   = 1'b0,
	parameter C_CX_I  = 1'b0,
	parameter C_CY1_I = 1'b0,
	parameter C_CY2_I = 1'b0,
	parameter C_PX_I  = 1'b0,
	parameter C_PY1_I = 1'b0,
	parameter C_PY2_I = 1'b0
)(
	input OUT1,
	input OUT2,
	input COMPOUT,
	input CINX,
	input PINX,
	input CINY1,
	input PINY1,
	input CINY2,
	input PINY2,
	output COUTX,
	output POUTX,
	output COUTY1,
	output POUTY1,
	output COUTY2,
	output POUTY2
);
	wire CIY12 = C_Y12 ? CINY2 : CINY1;
	wire PIY12 = C_Y12 ? PINY2 : PINY1;

	wire CX_VAL  = C_SEL_C ? (C_SELX ? CIY12 : COMPOUT) : (C_SELX  ? OUT2 : OUT1);
	wire PX_VAL  = C_SEL_P ? (C_SELX ? PIY12 : COMPOUT) : (C_SELX  ? OUT1 : OUT2);
	wire CY1_VAL = C_SEL_C ? (C_SELY1 ? CINX : COMPOUT) : (C_SELY1 ? OUT1 : OUT2);
	wire PY1_VAL = C_SEL_P ? (C_SELY1 ? PINX : COMPOUT) : (C_SELY1 ? OUT2 : OUT1);
	wire CY2_VAL = C_SEL_C ? (C_SELY2 ? CINX : COMPOUT) : (C_SELY2 ? OUT2 : OUT1);
	wire PY2_VAL = C_SEL_P ? (C_SELY2 ? PINX : COMPOUT) : (C_SELY2 ? OUT1 : OUT2);

	assign COUTX  = C_CX_I  ? CX_VAL  : CINX;
	assign COUTY1 = C_CY1_I ? CY1_VAL : CINY1;
	assign COUTY2 = C_CY2_I ? CY2_VAL : CINY2;
	assign POUTX  = C_PX_I  ? PX_VAL  : PINX;
	assign POUTY1 = C_PY1_I ? PY1_VAL : PINY1;
	assign POUTY2 = C_PY2_I ? PY2_VAL : PINY2;
endmodule

module CPE_ADDF #(
	parameter [2:0] C_FUNCTION = 3'b000,
	parameter [3:0] INIT_L00 = 4'b0000,
	parameter [3:0] INIT_L01 = 4'b0000,
	parameter [3:0] INIT_L02 = 4'b0000,
	parameter [3:0] INIT_L03 = 4'b0000,
	parameter [3:0] INIT_L10 = 4'b0000,
	parameter [3:0] INIT_L11 = 4'b0000,
	parameter [3:0] INIT_L20 = 4'b0000,
	parameter C_I1 = 1'b0,
	parameter C_I2 = 1'b0,
	parameter C_I3 = 1'b0,
	parameter C_I4 = 1'b0
)(
	input CINY1,
	output COUTY1,
	input IN1,
	input IN2,
	input IN3,
	input IN4,
	input IN5,
	input IN6,
	input IN7,
	input IN8,
	input PINY1,
	input CINX,
	output OUT1,
	output CPOUT2
);

	wire [1:0] l00_s1 = (C_I1 ? PINY1 : IN2) ? INIT_L00[3:2] : INIT_L00[1:0];
	wire A = IN1 ? l00_s1[1] : l00_s1[0];

	wire [1:0] l01_s1 = (C_I2 ? CINX  : IN4) ? INIT_L01[3:2] : INIT_L01[1:0];
	wire B = IN3 ? l01_s1[1] : l01_s1[0];

	assign { CPOUT2, OUT1 } = A + B + CINY1;

	assign COUTY1 = CPOUT2;

endmodule


module CPE_ADDF2 #(
	parameter [2:0] C_FUNCTION = 3'b000,
	parameter [3:0] INIT_L00 = 4'b0000,
	parameter [3:0] INIT_L01 = 4'b0000,
	parameter [3:0] INIT_L02 = 4'b0000,
	parameter [3:0] INIT_L03 = 4'b0000,
	parameter [3:0] INIT_L10 = 4'b0000,
	parameter [3:0] INIT_L11 = 4'b0000,
	parameter [3:0] INIT_L20 = 4'b0000,
	parameter C_I1 = 1'b0,
	parameter C_I2 = 1'b0,
	parameter C_I3 = 1'b0,
	parameter C_I4 = 1'b0
)(
	input CINY1,
	output COUTY1,
	input IN1,
	input IN2,
	input IN3,
	input IN4,
	input IN5,
	input IN6,
	input IN7,
	input IN8,
	input PINY1,
	input CINX,
	input PINX,
	output OUT1,
	output OUT2
);

	wire [1:0] l00_s1 = (C_I1 ? PINY1 : IN2) ? INIT_L00[3:2] : INIT_L00[1:0];
	wire A2 = IN1 ? l00_s1[1] : l00_s1[0];

	wire [1:0] l01_s1 = (C_I2 ? CINX  : IN4) ? INIT_L01[3:2] : INIT_L01[1:0];
	wire B2 = IN3 ? l01_s1[1] : l01_s1[0];

	wire [1:0] l02_s1 = (C_I3 ? PINY1 : IN6) ? INIT_L02[3:2] : INIT_L02[1:0];
	wire A1 = IN5 ? l02_s1[1] : l02_s1[0];

	wire [1:0] l03_s1 = (C_I4 ? PINX  : IN8) ? INIT_L03[3:2] : INIT_L03[1:0];
	wire B1 = IN7 ? l03_s1[1] : l03_s1[0];

	wire CO1;
	assign { CO1, OUT1 } = A1 + B1 + CINY1;
	assign { COUTY1, OUT2 } = A2 + B2 + CO1;

endmodule

module CPE_MULT #(
	parameter C_C_P = 1'b0,
	parameter [2:0] C_FUNCTION = 3'b000,
	parameter [3:0] INIT_L00 = 4'b0000,
	parameter [3:0] INIT_L01 = 4'b0000,
	parameter [3:0] INIT_L02 = 4'b0000,
	parameter [3:0] INIT_L03 = 4'b0000,
	parameter [3:0] INIT_L10 = 4'b0000,
	parameter [3:0] INIT_L11 = 4'b0000,
	parameter [3:0] INIT_L20 = 4'b0000,
	parameter C_I1 = 1'b0,
	parameter C_I2 = 1'b0,
	parameter C_I3 = 1'b0,
	parameter C_I4 = 1'b0,
	parameter C_PY1_I = 1'b0,
	parameter MULT_INVERT = 1'b0,
	parameter C_O1 = 1'b0, // Unused
	parameter C_O2 = 1'b0  // Unused
)(
	input IN1,
	input IN5,
	input IN8,
	output CPOUT1,
	output CPOUT2,
	input CINX,
	input PINX,
	input CINY1,
	input CINY2,
	input PINY1,
	input PINY2,
	output COUTX,
	output POUTX,
	output COUTY1,
	output POUTY1,
	output COUTY2,
	output POUTY2
);

	wire [8:1] cpe_i;

	assign cpe_i[1] = IN1 ^ MULT_INVERT;
	assign cpe_i[2] = PINY1;
	assign cpe_i[4] = CINX;
	assign cpe_i[5] = IN5 ^ MULT_INVERT;
	assign cpe_i[6] = PINY1;
	assign cpe_i[8] = PINX;

	wire L10 = ~((&cpe_i[2:1]) ^ CINX);
	wire L11 = ~((&cpe_i[6:5]) ^ PINX);
	wire L02OUT = &cpe_i[6:5];
	wire NOROUT = ~((&cpe_i[2:1]) | CINX);

	// COMB02 ADDF2
	wire CADD_A = ((~NOROUT | ~L10) & ~(~L02OUT & ~L10));
	wire CADD_S = (~L10) & (~L11);
	wire ADDF2 = ~(~(~L11 & ~CINY1) & ~(~L02OUT & L11));

	// COMB02 MULT
	wire nand2_0 = ~(PINY2 & (IN5 ^ MULT_INVERT));
	wire nand2_1 = ~(PINY2 & (IN8 ^ MULT_INVERT));
	wire xnor3_0 = ~(nand2_0 ^ ~L10 ^ ~ADDF2);
	wire xnor3_1 = ~(nand2_1 ^ CINY1 ^ ~L11);
	wire mx2_0 = ~(( nand2_0 | xnor3_0) & (nand2_1 | ~xnor3_0));
	wire mx2_1 = ~((~nand2_1 | xnor3_1) & (CINY2 | ~xnor3_1));

	wire COY2_A = mx2_0;
	wire COY2_S = ~(~xnor3_0 | ~xnor3_1);
	wire MULTO1 = ~(xnor3_1 ^ ~CINY2);
	wire MULTO2 = ~(xnor3_0 ^ mx2_1);

	// COMB03
	assign COUTX  = MULTO2;
	assign COUTY1 = CADD_S ? CINY1 : CADD_A;
	assign COUTY2 = COY2_S ? CINY2 : COY2_A;
	assign CPOUT2   = COUTX;

	// COMB04
	assign POUTX  = MULTO1;
	assign POUTY1 = C_PY1_I ? COUTX : PINY1;
	assign POUTY2 = PINY2;
	assign CPOUT1 = C_C_P ? COUTX : POUTX;

endmodule

module CPE_COMP #(
	parameter [3:0] INIT_L30 = 4'b0000
)(
	input COMB1,
	input COMB2,
	output COMPOUT
);
	wire [1:0] l30_s1 = COMB2 ? INIT_L30[3:2] : INIT_L30[1:0];
	wire comp = COMB1 ? l30_s1[1] : l30_s1[0];
	assign COMPOUT = ~comp;
endmodule

module CLKIN #(
	parameter [3:0] REF0 = 4'b0,
	parameter REF0_INV = 1'b0,
	parameter [3:0] REF1 = 4'b0,
	parameter REF1_INV = 1'b0,
	parameter [3:0] REF2 = 4'b0,
	parameter REF2_INV = 1'b0,
	parameter [3:0] REF3 = 4'b0,
	parameter REF3_INV = 1'b0
)(
	output CLK_REF0, CLK_REF1, CLK_REF2, CLK_REF3,
	input  CLK0, CLK1, CLK2, CLK3,
	input  SER_CLK, JTAG_CLK, SPI_CLK
);
	wire CLK_MUX0, CLK_MUX1, CLK_MUX2, CLK_MUX3;
	assign CLK_MUX0 = REF0[2] ? (REF0[1] ? (REF0[0] ? 1'b0 : JTAG_CLK) : (REF0[0] ? SPI_CLK : SER_CLK)) : (REF0[1] ? (REF0[0] ? CLK3 : CLK2) : (REF0[0] ? CLK1 : CLK0));
	assign CLK_MUX1 = REF1[2] ? (REF1[1] ? (REF1[0] ? 1'b0 : JTAG_CLK) : (REF1[0] ? SPI_CLK : SER_CLK)) : (REF1[1] ? (REF1[0] ? CLK3 : CLK2) : (REF1[0] ? CLK1 : CLK0));
	assign CLK_MUX2 = REF2[2] ? (REF2[1] ? (REF2[0] ? 1'b0 : JTAG_CLK) : (REF2[0] ? SPI_CLK : SER_CLK)) : (REF2[1] ? (REF2[0] ? CLK3 : CLK2) : (REF2[0] ? CLK1 : CLK0));
	assign CLK_MUX3 = REF3[2] ? (REF3[1] ? (REF3[0] ? 1'b0 : JTAG_CLK) : (REF3[0] ? SPI_CLK : SER_CLK)) : (REF3[1] ? (REF3[0] ? CLK3 : CLK2) : (REF3[0] ? CLK1 : CLK0));

	assign CLK_REF0 = CLK_MUX0 ^ REF0_INV;
	assign CLK_REF1 = CLK_MUX1 ^ REF1_INV;
	assign CLK_REF2 = CLK_MUX2 ^ REF2_INV;
	assign CLK_REF3 = CLK_MUX3 ^ REF3_INV;
endmodule

module GLBOUT #(
	parameter [3:0] GLB0_CFG = 4'b0,
	parameter [3:0] GLB1_CFG = 4'b0,
	parameter [3:0] GLB2_CFG = 4'b0,
	parameter [3:0] GLB3_CFG = 4'b0,
	parameter USR_GLB0_EN = 1'b0,
	parameter USR_GLB1_EN = 1'b0,
	parameter USR_GLB2_EN = 1'b0,
	parameter USR_GLB3_EN = 1'b0,
	parameter GLB0_EN = 1'b0,
	parameter GLB1_EN = 1'b0,
	parameter GLB2_EN = 1'b0,
	parameter GLB3_EN = 1'b0,
	parameter [1:0] FB0_CFG = 2'b0,
	parameter [1:0] FB1_CFG = 2'b0,
	parameter [1:0] FB2_CFG = 2'b0,
	parameter [1:0] FB3_CFG = 2'b0,
	parameter USR_FB0_EN = 1'b0,
	parameter USR_FB1_EN = 1'b0,
	parameter USR_FB2_EN = 1'b0,
	parameter USR_FB3_EN = 1'b0
)(
	output GLB0, GLB1, GLB2, GLB3,
	output CLK_FB0, CLK_FB1, CLK_FB2, CLK_FB3,
	input  CLK0_0, CLK90_0, CLK180_0, CLK270_0, CLK_REF_OUT0,
	input  CLK0_1, CLK90_1, CLK180_1, CLK270_1, CLK_REF_OUT1,
	input  CLK0_2, CLK90_2, CLK180_2, CLK270_2, CLK_REF_OUT2,
	input  CLK0_3, CLK90_3, CLK180_3, CLK270_3, CLK_REF_OUT3,
	input  USR_GLB0, USR_GLB1, USR_GLB2, USR_GLB3,
	input  USR_FB0, USR_FB1, USR_FB2, USR_FB3
);
	wire GLB_MUX0,GLB_MUX1,GLB_MUX2,GLB_MUX3;
	assign GLB_MUX0 = GLB0_CFG[2] ? (GLB0_CFG[1] ? (GLB0_CFG[0] ? CLK270_0 : CLK180_0) : (GLB0_CFG[0] ? CLK90_0 : CLK0_0)) : (GLB0_CFG[1] ? (GLB0_CFG[0] ? CLK0_3   : CLK0_2)   : (GLB0_CFG[0] ? CLK0_1   : CLK_REF_OUT0));
	assign GLB_MUX1 = GLB1_CFG[2] ? (GLB1_CFG[1] ? (GLB1_CFG[0] ? CLK270_1 : CLK180_1) : (GLB1_CFG[0] ? CLK90_1 : CLK0_1)) : (GLB1_CFG[1] ? (GLB1_CFG[0] ? CLK90_3  : CLK90_2)  : (GLB1_CFG[0] ? CLK90_0  : CLK_REF_OUT1));
	assign GLB_MUX2 = GLB2_CFG[2] ? (GLB2_CFG[1] ? (GLB2_CFG[0] ? CLK270_2 : CLK180_2) : (GLB2_CFG[0] ? CLK90_2 : CLK0_2)) : (GLB2_CFG[1] ? (GLB2_CFG[0] ? CLK180_3 : CLK180_1) : (GLB2_CFG[0] ? CLK180_0 : CLK_REF_OUT2));
	assign GLB_MUX3 = GLB2_CFG[2] ? (GLB3_CFG[1] ? (GLB3_CFG[0] ? CLK270_3 : CLK180_3) : (GLB3_CFG[0] ? CLK90_3 : CLK0_3)) : (GLB3_CFG[1] ? (GLB3_CFG[0] ? CLK270_2 : CLK270_1) : (GLB3_CFG[0] ? CLK270_0 : CLK_REF_OUT3));

	wire FB_MUX0,FB_MUX1,FB_MUX2,FB_MUX3;
	assign FB_MUX0 = FB0_CFG[1] ? (FB0_CFG[0] ? GLB3 : GLB2) : (FB0_CFG[0] ? GLB1 : GLB0);
	assign FB_MUX1 = FB1_CFG[1] ? (FB1_CFG[0] ? GLB3 : GLB2) : (FB1_CFG[0] ? GLB1 : GLB0);
	assign FB_MUX2 = FB2_CFG[1] ? (FB2_CFG[0] ? GLB3 : GLB2) : (FB2_CFG[0] ? GLB1 : GLB0);
	assign FB_MUX3 = FB3_CFG[1] ? (FB3_CFG[0] ? GLB3 : GLB2) : (FB3_CFG[0] ? GLB1 : GLB0);

	assign CLK_FB0 = USR_FB0_EN ? USR_FB0 : FB_MUX0;
	assign CLK_FB1 = USR_FB1_EN ? USR_FB1 : FB_MUX1;
	assign CLK_FB2 = USR_FB2_EN ? USR_FB2 : FB_MUX2;
	assign CLK_FB3 = USR_FB3_EN ? USR_FB3 : FB_MUX3;

	assign GLB0 = GLB0_EN ? (USR_GLB0_EN ? USR_GLB0 : GLB_MUX0) : 1'b0;
	assign GLB1 = GLB1_EN ? (USR_GLB1_EN ? USR_GLB1 : GLB_MUX1) : 1'b0;
	assign GLB2 = GLB2_EN ? (USR_GLB2_EN ? USR_GLB2 : GLB_MUX2) : 1'b0;
	assign GLB3 = GLB3_EN ? (USR_GLB3_EN ? USR_GLB3 : GLB_MUX3) : 1'b0;
endmodule

module PLL #(
	parameter [4:0] CFG_A_AO_SW = 5'd0,
	parameter [4:0] CFG_A_CI_FILTER_CONST = 5'd0,
	parameter [2:0] CFG_A_COARSE_TUNE = 3'd0,
	parameter [4:0] CFG_A_CP_FILTER_CONST = 5'd0,
	parameter CFG_A_ENFORCE_LOCK = 1'b0,
	parameter CFG_A_EN_COARSE_TUNE = 1'b0,
	parameter CFG_A_EN_USR_CFG = 1'b0,
	parameter CFG_A_FAST_LOCK = 1'b0,
	parameter [1:0] CFG_A_FILTER_SHIFT = 2'd0,
	parameter [10:0] CFG_A_FINE_TUNE = 11'd0,
	parameter [11:0] CFG_A_K = 12'd0,
	parameter CFG_A_LOCK_DETECT_WIN = 1'b0,
	parameter [5:0] CFG_A_M1 = 6'd0,
	parameter [9:0] CFG_A_M2 = 10'd0,
	parameter [5:0] CFG_A_N1 = 6'd0,
	parameter [9:0] CFG_A_N2 = 10'd0,
	parameter CFG_A_OPEN_LOOP = 1'b0,
	parameter CFG_A_OP_LOCK = 1'b0,
	parameter CFG_A_PDIV0_MUX = 1'b0,
	parameter CFG_A_PDIV1_SEL = 1'b0,
	parameter CFG_A_PFD_SEL = 1'b0,
	parameter CFG_A_PLL_EN_SEL = 1'b0,
	parameter [2:0] CFG_A_SAR_LIMIT = 3'b000,
	parameter CFG_A_SYNC_BYPASS = 1'b0,
	parameter CLK180_DOUB = 1'b0,
	parameter CLK270_DOUB = 1'b0,
	parameter CLK_OUT_EN = 1'b1,
	parameter LOCK_REQ = 1'b0,
	parameter PLL_EN = 1'b1,
	parameter PLL_RST = 1'b1
)(
	input CLK_REF,
	output CLK0,
	output CLK90,
	output CLK180,
	output CLK270,
	output USR_PLL_LOCKED,
	output USR_PLL_LOCKED_STDY,
	input USR_LOCKED_STDY_RST
);
	assign CLK0 = CLK_REF;
	assign CLK90 = CLK_REF;
	assign CLK180 = CLK_REF;
	assign CLK270 = CLK_REF;
	assign USR_PLL_LOCKED = 1'b1;
	assign USR_PLL_LOCKED_STDY = 1'b1;
endmodule

module USR_RSTN (
	output USR_RSTN
);
	assign USR_RSTN = 1'b1;
endmodule

module CPE_BRIDGE #(
    parameter C_BR = 1'b1,
    parameter C_SN = 3'b000
)(
    output MUXOUT,
    input  IN1, IN2, IN3, IN4,
    input  IN5, IN6, IN7, IN8
);
	assign MUXOUT =
		(C_SN == 3'h0) ? IN1 :
		(C_SN == 3'h1) ? IN2 :
		(C_SN == 3'h2) ? IN3 :
		(C_SN == 3'h3) ? IN4 :
		(C_SN == 3'h4) ? IN5 :
		(C_SN == 3'h5) ? IN6 :
		(C_SN == 3'h6) ? IN7 :
						 IN8 ;
endmodule
