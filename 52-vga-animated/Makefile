TEST_CASE := vga-animated
TOP := top_demo
#TOP := top_demo_sb
YOSYS_PARAM := -nomx8 -nomult
VERILOG_FILES := \
	top_demo.sv \
	top_demo_sb.sv \
	render_cube_shatter.sv \
	render_square_colr.sv \
	render_teleport.sv \
	../lib/clock/gatemate/clock_480p.sv \
  	../lib/clock/gatemate/clock_sys.sv \
  	../lib/clock/xd.sv \
  	../lib/display/bitmap_addr.sv \
  	../lib/display/clut_simple.sv \
  	../lib/display/display_480p.sv \
  	../lib/display/linebuffer_simple.sv \
  	../lib/graphics/draw_line.sv \
  	../lib/graphics/draw_line_1d.sv \
  	../lib/graphics/draw_rectangle_fill.sv \
  	../lib/graphics/draw_triangle_fill.sv \
  	../lib/memory/bram_sdp.sv
include ../makefile.inc
