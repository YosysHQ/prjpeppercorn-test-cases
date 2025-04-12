TEST_CASE := vga-rasterbar
YOSYS_PARAM := -nomx8 -nomult
VERILOG_FILES := \
	top_rasterbars.sv  \
	render_rasterbars.sv \
	rasterbar.sv \
	../lib/clock/gatemate/clock_480p.sv \
	../lib/display/display_480p.sv \
	../lib/maths/sine_table.sv \
	../lib/memory/rom_async.sv 
include ../makefile.inc
