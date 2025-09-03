TEST_CASE := litex-vexriscv-smp-quad
TOP := olimex_gatemate_a1_evb
YOSYS_PARAM := -nomx8
PR_OPTS := +uCIO
YOSYS_CMDS := hierarchy -top $(TOP); setattr -unset ram_style a:ram_style=distributed;
VERILOG_FILES := \
	Ram_1w_1rs_Generic.v \
	VexRiscvLitexSmpCluster_Cc4_Iw64Is8192Iy2_Dw64Ds8192Dy2_ITs4DTs4_Cdma_Ood_Wm_Hb1.v \
	olimex_gatemate_a1_evb.v

include ../makefile.inc
