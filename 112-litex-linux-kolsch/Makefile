TEST_CASE := litex-linux-kolsch
TOP := kolsch
YOSYS_PARAM := -nomx8 -nomult
YOSYS_CMDS := hierarchy -top $(TOP); setattr -unset ram_style a:ram_style=distributed;
VERILOG_FILES := \
	Ram_1w_1rs_Generic.v \
	VexRiscvLitexSmpCluster_Cc1_Iw32Is4096Iy1_Dw32Ds4096Dy1_ITs4DTs4_Ldw16_Ood_Hb1.v \
	kolsch.v

include ../makefile.inc
