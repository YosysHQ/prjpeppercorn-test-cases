TEST_CASE := litex-linux
TOP := colognechip_gatemate_evb
YOSYS_PARAM := -nomx8
YOSYS_CMDS := hierarchy -top $(TOP); setattr -unset ram_style a:ram_style=distributed;
VERILOG_FILES := \
	Ram_1w_1rs_Generic.v \
	VexRiscvLitexSmpCluster_Cc1_Iw32Is4096Iy1_Dw32Ds4096Dy1_ITs4DTs4_Ood_Wm_Hb1.v \
	colognechip_gatemate_evb.v

include ../makefile.inc
