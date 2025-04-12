TEST_CASE := vga-2dshapes
TOP := top_demo
YOSYS_PARAM := -nomx8 -nomult
VERILOG_FILES := \
	top_demo.sv \
	render_circles_fill.sv \
	render_circles.sv \
	render_cube_fill.sv \
	render_rects_fill.sv \
	render_rects.sv \
	render_triangles_fill.sv \
	../lib/clock/gatemate/clock_480p.sv \
  	../lib/clock/gatemate/clock_sys.sv \
  	../lib/clock/xd.sv \
  	../lib/display/bitmap_addr.sv \
  	../lib/display/clut_simple.sv \
  	../lib/display/display_480p.sv \
  	../lib/display/linebuffer_simple.sv \
  	../lib/graphics/draw_circle.sv \
  	../lib/graphics/draw_circle_fill.sv \
  	../lib/graphics/draw_line.sv \
  	../lib/graphics/draw_line_1d.sv \
  	../lib/graphics/draw_rectangle.sv \
  	../lib/graphics/draw_rectangle_fill.sv \
  	../lib/graphics/draw_triangle_fill.sv \
  	../lib/memory/bram_sdp.sv
include ../makefile.inc
