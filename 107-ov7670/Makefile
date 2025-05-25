TEST_CASE := ov7670
YOSYS_PARAM := -nomx8 -nomult
VERILOG_FILES := \
    top.v \
	camera_configure.v \
    camera_read.v \
    hvsync_generator.v \
    OV7670_config_rom.v \
    OV7670_config.v \
    SCCB_interface.v \
    vgabuff.v \
     ../lib/fpgalibs/clocks/gatemate_25MHz_pll.v \

include ../makefile.inc
