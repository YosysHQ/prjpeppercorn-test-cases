TEST_CASE := bounce-dvi
TOP := colorBarDVI
YOSYS_PARAM := -nomx8 -nomult
YOSYS_DEFS := -DDISP_640x480_60Hz=1
VERILOG_FILES := \
	colorBarDVI.v \
	color_bar_shade.v \
	../lib/fpgalibs/clocks/gatemate_25MHz_125MHz_pll.v \
	../lib/fpgalibs/graphics/vga_core.v \
	../lib/fpgalibs/graphics/dvi_core.v \
	../lib/fpgalibs/graphics/tmds_encoder.v \
	../lib/fpgalibs/ios/serializer_gatemate_10_to_1_generic_ddr.v
include ../makefile.inc
