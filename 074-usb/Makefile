TEST_CASE := usb
TOP := colorBarVGAUSB
YOSYS_PARAM := -nomx8
YOSYS_DEFS := -DDISP_640x480_60Hz=1
VERILOG_FILES := \
	colorBarVGAUSB.v \
	../lib/fpgalibs/hdl/vga.v \
	../lib/fpgalibs/hdl/hex_decoder_v.v \
	../lib/fpgalibs/graphics/vga_core.v \
	../lib/fpgalibs/graphics/color_bar.v \
	../lib/fpgalibs/clocks/gatemate_25MHz_125MHz_pll.v \
	clocks/gatemate_48MHz_pll.v \
	usbhost/usbh_host_hid.v \
	usbhost/usbh_crc16.v \
	usbhost/usbh_crc5.v \
	usbhost/usbh_sie.v \
	usbhost/usb_phy.v \
	usbhost/usb_rx_phy.v \
	usbhost/usb_tx_phy.v \
	../lib/fpgalibs/graphics/dvi_core.v \
	../lib/fpgalibs/graphics/tmds_encoder.v \
	../lib/fpgalibs/ios/serializer_gatemate_10_to_1_generic_ddr.v

include ../makefile.inc
