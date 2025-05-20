TEST_CASE := vga-image
YOSYS_PARAM := -nomult -nomx8
YS_OPTS := -D DISP_640x480_60Hz=1
VERILOG_FILES := top.v image_rom.v ../lib/fpgalibs/graphics/vga_core.v ../lib/fpgalibs/clocks/gatemate_25MHz_pll.v 
include ../makefile.inc
