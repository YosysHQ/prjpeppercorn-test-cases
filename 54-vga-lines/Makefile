TEST_CASE := vga-lines
TOP := top_demo
YOSYS_PARAM := -nomx8 -nomult
VERILOG_FILES := \
	top_demo.sv \
	render_cube.sv \
	render_edge.sv \
	render_line.sv \
	render_triangles.sv \
	../lib/clock/gatemate/clock_480p.sv \
  	../lib/clock/gatemate/clock_sys.sv \
  	../lib/clock/xd.sv \
  	../lib/display/bitmap_addr.sv \
  	../lib/display/clut_simple.sv \
  	../lib/display/display_480p.sv \
  	../lib/display/linebuffer_simple.sv \
  	../lib/graphics/draw_line.sv \
  	../lib/graphics/draw_triangle.sv \
  	../lib/memory/bram_sdp.sv
include ../makefile.inc
