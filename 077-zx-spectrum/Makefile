TEST_CASE := zx_spectrum
TOP := spectrum
YOSYS_PARAM := -nomx8
VERILOG_FILES := \
	spectrum.v \
	video.v \
	ps2.v \
	dpram.v \
	keyboard.v \
	../lib/Z80/tv80_core.v \
	../lib/Z80/tv80n.v \
	../lib/Z80/tv80_mcode.v \
	../lib/Z80/tv80_reg.v \
	../lib/Z80/tv80_alu.v \
	../lib/fpgalibs/clocks/gatemate_25MHz_pll.v

include ../makefile.inc
