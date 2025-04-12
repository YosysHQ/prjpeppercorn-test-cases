TEST_CASE := vga-animated
TOP := top_hedgehog
#TOP := top_hourglass
#TOP := top_tinyf_inline
#TOP := top_tinyf_move
#TOP := top_tinyf_rom
#TOP := top_tinyf_scale
YOSYS_PARAM := -nomx8 -nomult
VERILOG_FILES := \
	top_hedgehog.sv \
	top_hourglass.sv \
	top_tinyf_inline.sv \
	top_tinyf_move.sv \
	top_tinyf_rom.sv \
	top_tinyf_scale.sv \
	sprite.sv \
	sprite_inline.sv \
	sprite_rom.sv \
	../lib/clock/gatemate/clock_480p.sv \
  	../lib/display/clut_simple.sv \
  	../lib/display/display_480p.sv \
	../lib/memory/bram_sdp.sv \
  	../lib/memory/rom_async.sv
include ../makefile.inc
