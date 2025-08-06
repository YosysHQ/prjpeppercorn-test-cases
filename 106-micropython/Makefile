TEST_CASE := micropython
TOP := gatemate
YOSYS_PARAM := -nomx8
PR_OPTS := +uCIO
FIRMWARE := build/firmware.bin
VERILOG_FILES := \
	gatemate.v \
	spimemio.v \
	simpleuart.v \
	picosoc.v \
	picorv32.v \
 	../lib/fpgalibs/clocks/gatemate_25MHz_pll.v

include ../makefile.inc
