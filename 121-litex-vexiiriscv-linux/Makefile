TEST_CASE := litex-vexiiriscv-linux
TOP := olimex_gatemate_a1_evb
YOSYS_PARAM := -nomx8
YOSYS_CMDS := hierarchy -top $(TOP); setattr -unset keep_hierarchy;
VERILOG_FILES := \
	Ram_1w_1rs_Generic.v \
	Ram_1w_1ra_Generic.v \
	VexiiRiscvLitex_1ea420c1907d38b6bb5aeb9a6ed7fa07.v \
	olimex_gatemate_a1_evb.v

include ../makefile.inc
