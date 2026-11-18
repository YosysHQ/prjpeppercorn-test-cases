TEST_CASE := altair
TOP := top
YOSYS_PARAM := -nomx8
VERILOG_FILES := \
	top_altair.v \
	altair.v \
	i8080.v \
	mc6850.v \
	jmp_boot.v \
	ram_memory.v \
	rom_memory.v \
	simpleuart.v
NEXTPNR_PARAMS := --vopt ff-init-zero
include ../makefile.inc
