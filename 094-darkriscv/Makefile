TEST_CASE := darkriscv
TOP := darksocv
YOSYS_DEFS := -DOLIMEX_GATEMATE=1
YOSYS_PARAM := -nomx8 -nomult
VERILOG_FILES := \
	rtl/darksocv.v \
	rtl/darkbridge.v \
	rtl/darkcache.v \
	rtl/darkio.v \
	rtl/darkpll.v \
	rtl/darkram.v \
	rtl/darkriscv.v \
	rtl/darkspi.v \
	rtl/darkuart.v \
	gatemate_25MHz_pll.v

include ../makefile.inc
