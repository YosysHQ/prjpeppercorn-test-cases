YOSYS_PARAM ?=
TARGETS ?= impl
VERILOG_FILES ?= top.v
TOP ?= top
ROOT_DIR=$(dir $(lastword $(MAKEFILE_LIST)))
OFL   = openFPGALoader
CC_TOOL_DIR=$(CC_TOOL)
P_R   = $(CC_TOOL)/bin/p_r/p_r
YOSYS = yosys

ifndef CC_TOOL
$(error CC_TOOL variable is not set)
endif
ifndef BOARD
$(error BOARD variable is not set)
endif

ifeq ($(BOARD), olimex)
OFL_BOARD=olimex_gatemateevb
else
OFL_BOARD=gatemate_evb_jtag
endif

all:
	@echo "Use one of targets for '$(BOARD)' board:"
	@echo " - synth - running Yosys synthesys only"
	@echo " - pr - Yosys + p_r"
	@echo " - jtag_pr - programming bitstream produced by p_r"
#	@echo " - nextpnr - Yosys + nextpnr"
#	@echo " - jtag - programming bitstream produced by nextpnr"
	@exit

synth: $(TEST_CASE)_synth.v

$(TEST_CASE)_synth.v: $(VERILOG_FILES)
	@echo "Running Yosys"
	@$(YOSYS) -ql synth.log $(YS_OPTS) -p 'read_verilog -sv $^; synth_gatemate $(YOSYS_PARAM) -top $(TOP) -vlog $(TEST_CASE)_synth.v'

$(TEST_CASE)_$(BOARD)_00.cfg: $(TEST_CASE)_synth.v $(BOARD).ccf
	@echo "Running P_R for '$(BOARD)' board"
	@$(P_R) -i $(TEST_CASE)_synth.v -cCP -ccf $(BOARD).ccf -o $(TEST_CASE)_$(BOARD) > $@.log

pr: $(TEST_CASE)_$(BOARD)_00.cfg

jtag_pr: $(TEST_CASE)_$(BOARD)_00.cfg
	@echo "Running openFPGALoader for '$(BOARD)' board"
	@$(OFL) -b $(OFL_BOARD) $^

clean:
	@rm -rf *.log *_synth.v *.history *.txt *.refwire *.refparam
	@rm -rf *.refcomp *.pos *.pathes *.path_struc *.net *.id *.prn
	@rm -rf *_00.v *.used *.sdf *.place *.pin *.cfg *.bit  *.cdf

