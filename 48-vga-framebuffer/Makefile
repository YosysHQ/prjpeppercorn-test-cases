TEST_CASE := vga-framebuffer
#TOP := top_david_16colr
#TOP := top_david_fizzle
#TOP := top_david_mono
TOP := top_david_scale
YOSYS_PARAM := -nomx8
VERILOG_FILES := \
	top_david_16colr.sv \
	top_david_fizzle.sv \
	top_david_mono.sv \
	top_david_scale.sv \
	../lib/clock/gatemate/clock_480p.sv \
	../lib/clock/gatemate/clock_sys.sv \
	../lib/display/display_480p.sv \
	../lib/display/clut_simple.sv \
	../lib/memory/bram_sdp.sv \
	../lib/display/linebuffer_simple.sv \
	../lib/maths/lfsr.sv \
	../lib/clock/xd.sv 
include ../makefile.inc
