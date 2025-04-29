YOSYS_PARAM ?=
TARGETS ?= impl
VERILOG_FILES ?= top.v
TOP ?= top
ROOT_DIR=$(dir $(lastword $(MAKEFILE_LIST)))
OFL   = openFPGALoader
CC_TOOL_DIR=$(CC_TOOL)
P_R   = $(CC_TOOL)/bin/p_r/p_r
NEXTPNR = nextpnr-himbaechel
YOSYS = yosys
GMPACK = gmpack
GMUNPACK = gmunpack

check_cc_tool = \
	ifndef CC_TOOL \
	$(error CC_TOOL variable is not set) \
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
	@echo " - unpack - Unpack p_r bitstream"
	@echo " - jtag_pr - programming bitstream produced by p_r"
	@echo " - json - Yosys for nextpnr"
	@echo " - nextpnr - Yosys + nextpnr"
	@echo " - jtag - programming bitstream produced by nextpnr"
	@exit

synth: $(TEST_CASE)_synth.v
json: $(TEST_CASE).json

$(TEST_CASE)_synth.v: $(VERILOG_FILES)
	@echo "Running Yosys"
	@$(YOSYS) -ql synth.log $(YS_OPTS) -p 'read_verilog -defer -sv $^; synth_gatemate $(YOSYS_PARAM) -top $(TOP) -nomx8 -vlog $(TEST_CASE)_synth.v'

$(TEST_CASE).json: $(VERILOG_FILES)
	@echo "Running Yosys"
	@$(YOSYS) -ql synth.log $(YS_OPTS) -p 'read_verilog -defer -sv $^; synth_gatemate $(YOSYS_PARAM) -luttree -top $(TOP) -json $(TEST_CASE).json'

$(TEST_CASE)_$(BOARD)_00.cfg: $(TEST_CASE)_synth.v $(BOARD).ccf
	$(call check_cc_tool)
	@echo "Running P_R for '$(BOARD)' board"
	@$(P_R) -i $(TEST_CASE)_synth.v -cCP -pr -ccf $(BOARD).ccf -o $(TEST_CASE)_$(BOARD) > $@.log

$(TEST_CASE)_$(BOARD).txt: $(TEST_CASE).json $(BOARD).ccf
	@echo "Running nextpnr for '$(BOARD)' board"
	@$(NEXTPNR) --device CCGM1A1 --json $(TEST_CASE).json --vopt ccf=$(BOARD).ccf --vopt out=$(TEST_CASE)_$(BOARD).txt --router router2 --freq 10

$(TEST_CASE)_$(BOARD)_00.txt: $(TEST_CASE)_$(BOARD)_00.cfg
	@echo "Running unpack for '$(BOARD)' board"
	@$(GMUNPACK) $(TEST_CASE)_$(BOARD)_00.cfg.bit $(TEST_CASE)_$(BOARD)_00.txt

pr: $(TEST_CASE)_$(BOARD)_00.cfg

unpack: $(TEST_CASE)_$(BOARD)_00.txt

nextpnr: $(TEST_CASE)_$(BOARD).txt

jtag_pr: $(TEST_CASE)_$(BOARD)_00.cfg
	@echo "Running openFPGALoader for '$(BOARD)' board"
	@$(OFL) -b $(OFL_BOARD) $^

jtag: $(TEST_CASE)_$(BOARD).txt
	@echo "Running openFPGALoader for '$(BOARD)' board"
	@$(GMPACK) $(TEST_CASE)_$(BOARD).txt $(TEST_CASE)_$(BOARD).bit
	@$(OFL) -b $(OFL_BOARD) $(TEST_CASE)_$(BOARD).bit

clean:
	@rm -rf *.log *_synth.v *.history *.txt *.refwire *.refparam
	@rm -rf *.refcomp *.pos *.pathes *.path_struc *.net *.id *.prn
	@rm -rf *_00.v *.used *.sdf *.place *.pin *.cfg *.bit  *.cdf *.idh *.min *.json

.PHONY: synth json pr nextpnr jtag_pr jtag unpack
