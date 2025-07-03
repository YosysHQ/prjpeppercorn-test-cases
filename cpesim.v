module CPE_IBUF #(
	parameter [15:0] DELAY_IBF = 15'b0,
	parameter INPUT_ENABLE = 1'b1,
	parameter PULLUP = 1'b0,
	parameter PULLDOWN = 1'b0,
	parameter SCHMITT_TRIGGER = 1'b0,
	parameter SEL_IN_CLOCK = 1'b0,
	parameter IN1_FF = 1'b0,
	parameter IN2_FF = 1'b0,
	parameter INV_IN1_CLOCK = 1'b0,
	parameter INV_IN2_CLOCK = 1'b0,
)(
	input  I,
	input  OUT1,
	input  OUT2,
	input  OUT3,
	input  OUT4,
	output IN1,
	output IN2
);
  if (IN1_FF) begin
	reg q1_i;
	wire clk1 = INV_IN1_CLOCK ? ~OUT4 : OUT4;
	always @(posedge clk1)
	begin
		q1_i <= I;
	end
	assign IN1 = q1_i;
  end else begin
	assign IN1 = I;
  end
  if (IN2_FF) begin
	reg q2_i;
	wire clk2 = INV_IN2_CLOCK ? ~OUT4 : OUT4;
	always @(posedge clk2)
	begin
		q2_i <= I;
	end
	assign IN2 = q2_i;
  end else begin
	assign IN2 = I;
  end
endmodule


module CPE_OBUF #(
	parameter [15:0] DELAY_OBF = 15'b0,
	parameter OE_ENABLE = 1'b1,
	parameter OUT_SIGNAL = 1'b0,
	parameter OUT23_14_SEL = 1'b0,
	parameter SLEW = 1'b0,
	parameter DRIVE = 2'b0,
	parameter SEL_OUT_CLOCK = 1'b0,
	parameter OUT1_FF = 1'b0,
	parameter OUT2_FF = 1'b0,
	parameter INV_OUT1_CLOCK = 1'b0,
	parameter INV_OUT2_CLOCK = 1'b0,
	parameter USE_DDR = 1'b0,
)(
	input  OUT1,
	input  OUT2,
	input  OUT3,
	input  OUT4,
	input  DDR,
	output O
);
  if (USE_DDR) begin
	reg q1_i;
	wire clk1 = INV_OUT1_CLOCK ? ~OUT4 : OUT4;
	always @(posedge clk1)
	begin
		q1_i <= OUT1;
	end
	reg q2_i;
	wire clk2 = INV_OUT2_CLOCK ? ~OUT4 : OUT4;
	always @(posedge clk2)
	begin
		q2_i <= OUT2;
	end
	assign O = DDR ? q2_i : q1_i;
  end else begin
	if (OUT1_FF) begin
		reg q1_i;
		wire clk1 = INV_OUT1_CLOCK ? ~OUT4 : OUT4;
		always @(posedge clk1)
		begin
			q1_i <= OUT1;
		end
		assign O = q1_i;
	end else begin
		assign O = (OUT_SIGNAL == 1'b0) ? OUT23_14_SEL : OUT1;
	end
  end

endmodule

module CPE_LVDS_IBUF #(
	parameter [15:0] DELAY_IBF = 15'b0,
	parameter INPUT_ENABLE = 1'b1,
	parameter PULLUP = 1'b0,
	parameter PULLDOWN = 1'b0,
	parameter SCHMITT_TRIGGER = 1'b0,
	parameter LVDS_IE = 1'b1,
	parameter LVDS_EN = 1'b1,
	parameter SEL_IN_CLOCK = 1'b0,
)(
	input  I_P,
	input  I_N,
	input  OUT1,
	input  OUT2,
	input  OUT3,
	input  OUT4,
	output IN1,
	output IN2
);
	assign IN1 = I_P;
	assign IN2 = IN1;
endmodule

module CPE_LVDS_OBUF #(
	parameter [15:0] DELAY_OBF = 15'b0,
	parameter OE_ENABLE = 1'b1,
	parameter OUT_SIGNAL = 1'b0,
	parameter OUT23_14_SEL = 1'b0,
	parameter SLEW = 1'b0,
	parameter DRIVE = 2'b0,
	parameter LVDS_EN = 1'b1,
	parameter SEL_OUT_CLOCK = 1'b0,
)(
	input  OUT1,
	input  OUT2,
	input  OUT3,
	input  OUT4,
	output O_P,
	output O_N
);
	assign O_P = (OUT_SIGNAL == 1'b0) ? OUT23_14_SEL : OUT1;
	assign O_N = ~O_P;
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
	parameter [3:0] INIT_L00 = 4'b0,
	parameter [3:0] INIT_L01 = 4'b0,
	parameter [3:0] INIT_L10 = 4'b0,
	parameter [3:0] INIT_L02 = 4'b0000,
	parameter [3:0] INIT_L03 = 4'b0000,
	parameter [3:0] INIT_L11 = 4'b0000,
	parameter [3:0] INIT_L20 = 4'b0, // Unused
    parameter [2:0] C_FUNCTION = 3'b000,
)(
	input  IN1,
	input  IN2,
	input  IN3,
	input  IN4,
	input  IN5,
	input  IN6,
	input  IN7,
	input  IN8,
	output OUT1
);
	wire s1 = IN8;
	wire s0 = IN6;

	assign OUT1 = s1 ? (s0 ? IN4 : IN3) : (s0 ? IN2 : IN1);
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
	parameter [1:0] C_CPE_CLK = 2'b0,
    parameter [1:0] C_CPE_EN = 2'b0,
    parameter [1:0] C_CPE_RES = 2'b0,
    parameter [1:0] C_CPE_SET = 2'b0,
    parameter [1:0] FF_INIT = 2'b0,
	parameter C_EN_SR = 1'b0,
)(
	input DIN,
	input EN,
	input SR,
	input CLK,
	output DOUT
);
	wire CP_i, EN_i, RES_i, SET_i;
	reg  q_i;
	
	assign CP_i = (C_CPE_CLK == 2'b00) ? 1'b0 :
				  (C_CPE_CLK == 2'b01) ? ~CLK :
                  (C_CPE_CLK == 2'b10) ? CLK :
                  1'b1;
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
	parameter [1:0] C_CPE_CLK = 2'b0,
    parameter [1:0] C_CPE_EN = 2'b0,
    parameter [1:0] C_CPE_RES = 2'b0,
    parameter [1:0] C_CPE_SET = 2'b0,
    parameter [1:0] FF_INIT = 2'b0,
	parameter C_EN_SR = 1'b0,
	parameter C_L_D = 1'b1,
)(
	input DIN,
	input EN,
	input SR,
	input CLK,
	output DOUT
);
	wire CP_i, EN_i, RES_i, SET_i;
	reg  q_i;
	
	assign CP_i = (C_CPE_CLK == 2'b00) ? 1'b0 :
				  (C_CPE_CLK == 2'b01) ? ~CLK :
                  (C_CPE_CLK == 2'b10) ? CLK :
                  1'b1;
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
    output OUT1,
    output OUT2
);

	wire [1:0] l00_s1 = IN2 ? INIT_L00[3:2] : INIT_L00[1:0];
	wire A = IN1 ? l00_s1[1] : l00_s1[0];

	wire [1:0] l01_s1 = IN4 ? INIT_L01[3:2] : INIT_L01[1:0];
	wire B = IN3 ? l01_s1[1] : l01_s1[0];

	assign { OUT2, OUT1 } = A + B + CINY1;

	assign COUTY1 = OUT2;

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
    output OUT1,
    output OUT2
);

	wire [1:0] l00_s1 = IN2 ? INIT_L00[3:2] : INIT_L00[1:0];
	wire A2 = IN1 ? l00_s1[1] : l00_s1[0];

	wire [1:0] l01_s1 = IN4 ? INIT_L01[3:2] : INIT_L01[1:0];
	wire B2 = IN3 ? l01_s1[1] : l01_s1[0];

	wire [1:0] l02_s1 = IN6 ? INIT_L02[3:2] : INIT_L02[1:0];
	wire A1 = IN5 ? l02_s1[1] : l02_s1[0];

	wire [1:0] l03_s1 = IN8 ? INIT_L03[3:2] : INIT_L03[1:0];
	wire B1 = IN7 ? l03_s1[1] : l03_s1[0];

	wire CO;
	assign { CO, OUT1 } = A1 + B1 + CINY1;
	assign { COUTY1, OUT2 } = A2 + B2 + CO;

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
)(
	input IN1,
	input IN2,
    input IN3,
	input IN4,
	input IN5,
	input IN6,
    input IN7,
	input IN8,
    output CPOUT1,
    output CPOUT2,
	input CINX,
	input PINX,
	input CINY1,
	input CINY2,
	input PINY1,
	input PINY2,
);

endmodule

module CPE_COMP #(
    parameter [3:0] INIT_L30 = 4'b0000,
)(
    input COMB1,
    input COMB2,
    output COMPOUT,
);
    wire [1:0] l30_s1 = COMB2 ? INIT_L30[3:2] : INIT_L30[1:0];
    assign COMPOUT = COMB1 ? l30_s1[1] : l30_s1[0];
endmodule

module CLKIN #(
	parameter [3:0] REF0 = 4'b0,
	parameter REF0_INV = 1'b0,
	parameter [3:0] REF1 = 4'b0,
	parameter REF1_INV = 1'b0,
	parameter [3:0] REF2 = 4'b0,
	parameter REF2_INV = 1'b0,
	parameter [3:0] REF3 = 4'b0,
	parameter REF3_INV = 1'b0,
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
	parameter USR_FB3_EN = 1'b0,
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
	output USR_PLL_LOCKED,
	output USR_PLL_LOCKED_STDY,
	input USR_LOCKED_STDY_RST
);
	assign CLK0 = CLK_REF;
	assign USR_PLL_LOCKED = 1'b1;
	assign USR_PLL_LOCKED_STDY = 1'b1;
endmodule

module USR_RSTN (
    output USR_RSTN
);
    assign USR_RSTN = 1'b1;
endmodule