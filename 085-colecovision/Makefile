TEST_CASE := colecovision
TOP := coleco
YOSYS_PARAM := -nomx8 -nomult
VERILOG_FILES := \
	src/coleco.v \
	src/dac.v \
	src/gamerom.v \
	src/keypad.v \
	src/ps2.v \
	src/ram.v \
	src/rom.v \
	src/sn76489.v \
	src/tone_generator.v \
	src/video.v \
	src/vram.v \
	../lib/Z80/tv80_core.v \
	../lib/Z80/tv80n.v \
	../lib/Z80/tv80_mcode.v \
	../lib/Z80/tv80_reg.v \
	../lib/Z80/tv80_alu.v \
	../lib/fpgalibs/clocks/gatemate_25MHz_pll.v

include ../makefile.inc
