TEST_CASE := vga-pong
TOP := top_pong
YOSYS_PARAM := -noaddf -noclkbuf -nomult -nomx8
VERILOG_FILES := \
	top_pong.sv \
	simple_480p.sv \
	simple_score.sv \
	../lib/clock/gatemate/clock_480p.sv \
	../lib/display/display_480p.sv \
	../lib/essential/debounce.sv
include ../makefile.inc
