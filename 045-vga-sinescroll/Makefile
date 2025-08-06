TEST_CASE := vga-sinescroll
TOP := top_sinescroll
YOSYS_PARAM := -nomx8
VERILOG_FILES := \
	top_sinescroll.sv \
	render_sinescroll.sv \
	../lib/clock/gatemate/clock_480p.sv \
	../lib/clock/gatemate/clock_sys.sv \
	../lib/display/display_480p.sv \
	../lib/display/clut_simple.sv \
	../lib/display/linebuffer_simple.sv \
	../lib/display/bitmap_addr.sv \
	../lib/clock/xd.sv \
	../lib/memory/bram_sdp.sv \
	../lib/memory/rom_sync.sv \
	../lib/memory/rom_async.sv \
	../lib/graphics/draw_char.sv \
	../lib/maths/sine_table.sv \
	../lib/graphics/get_glyph_line.sv 
include ../makefile.inc
