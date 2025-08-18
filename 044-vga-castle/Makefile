TEST_CASE := vga-castle
YOSYS_PARAM := -nomx8
TOP := top_castle
VERILOG_FILES := \
	top_castle.sv \
	render_castle.sv \
	../lib/clock/gatemate/clock_480p.sv \
	../lib/clock/gatemate/clock_sys.sv \
	../lib/display/display_480p.sv \
	../lib/display/clut_simple.sv \
	../lib/display/linebuffer_simple.sv \
	../lib/display/bitmap_addr.sv \
	../lib/clock/xd.sv \
	../lib/memory/bram_sdp.sv \
	../lib/graphics/draw_circle_fill.sv \
	../lib/graphics/draw_rectangle_fill.sv \
	../lib/graphics/draw_triangle_fill.sv \
	../lib/graphics/draw_line_1d.sv \
	../lib/graphics/draw_line.sv
include ../makefile.inc
