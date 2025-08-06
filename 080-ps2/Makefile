TEST_CASE := ps2
TOP := colorBarVGAPS2
YOSYS_PARAM := -nomx8
YOSYS_DEFS := -DDISP_640x480_60Hz=1
VERILOG_FILES := \
	colorBarVGAPS2.v \
	../lib/fpgalibs/hdl/ps2kbd.v \
	../lib/fpgalibs/hdl/vga.v \
	../lib/fpgalibs/hdl/hex_decoder_v.v \
	../lib/fpgalibs/hdl/ps2mouse.v \
	../lib/fpgalibs/hdl/mousem_v.v \
	../lib/fpgalibs/graphics/vga_core.v \
	../lib/fpgalibs/graphics/color_bar.v \
	../lib/fpgalibs/clocks/gatemate_25MHz_pll.v 

include ../makefile.inc
