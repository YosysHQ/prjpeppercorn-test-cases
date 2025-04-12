TEST_CASE := vga-mandelbrot
TOP := top_mandel
YOSYS_PARAM := -nomult -nomx8
VERILOG_FILES := \
	top_mandel.sv \
	render_mandel.sv \
	mandelbrot.sv  \
	../lib/clock/gatemate/clock_480p.sv \
	../lib/clock/gatemate/clock_sys.sv \
	../lib/display/display_480p.sv \
	../lib/display/linebuffer_simple.sv \
	../lib/display/bitmap_addr.sv \
	../lib/clock/xd.sv \
	../lib/memory/bram_sdp.sv \
	../lib/essential/debounce.sv \
	../lib/maths/mul.sv 
include ../makefile.inc
