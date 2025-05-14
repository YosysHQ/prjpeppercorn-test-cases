TEST_CASE := litex-serv
TOP := olimex_gatemate_a1_evb
YOSYS_PARAM := -nomx8 -nomult -noclkbuf
VERILOG_FILES := \
	serv/serv_immdec.v \
	serv/serv_rf_ram.v \
	serv/serv_synth_wrapper.v \
	serv/serv_bufreg.v \
	serv/serv_aligner.v \
	serv/serv_decode.v \
	serv/serv_bufreg2.v \
	serv/serv_top.v \
	serv/serv_mem_if.v \
	serv/serv_rf_top.v \
	serv/serv_csr.v \
	serv/serv_ctrl.v \
	serv/serv_state.v \
	serv/serv_rf_ram_if.v \
	serv/serv_rf_if.v \
	serv/serv_alu.v \
	serv/serv_compdec.v \
	olimex_gatemate_a1_evb.v

include ../makefile.inc
