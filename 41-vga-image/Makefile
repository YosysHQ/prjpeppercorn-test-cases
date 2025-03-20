TEST_CASE := vga-image
YOSYS_PARAM := -noaddf -noclkbuf -nomult -nomx8
YS_OPTS := -D DISP_640x480_60Hz=1
VERILOG_FILES := top.v image_rom.v ../libs/vga_core.v ../libs/gatemate_25MHz_pll.v 
include ../makefile.inc
