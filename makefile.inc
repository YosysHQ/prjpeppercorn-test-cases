YOSYS_PARAM ?=
YOSYS_CMDS ?=
YOSYS_DEFS_OPT ?=
TARGETS ?= impl
FPGA ?= CCGM1A1
VERILOG_FILES ?= top.v
TOP ?= top
FIRMWARE ?= firmware.bin
ROOT_DIR=$(dir $(lastword $(MAKEFILE_LIST)))
OFL   = openFPGALoader
NEXTPNR = nextpnr-himbaechel
YOSYS = yosys
GMPACK = gmpack
GMUNPACK = gmunpack
EQY_CLOCK = async2sync

define check_cc_tool
  $(if $(CC_TOOL), \
    $(eval P_R := $(CC_TOOL)/bin/p_r/p_r), \
    $(error CC_TOOL variable is not set))
endef

ifndef BOARD
$(error BOARD variable is not set)
endif

ifeq ($(BOARD), olimex)
OFL_BOARD=-b olimex_gatemateevb
FREQ = 10
else ifeq ($(BOARD), kolsch)
OFL_BOARD=-c dirtyJtag
FREQ = 48
else
OFL_BOARD=-b gatemate_evb_jtag
FREQ = 10
endif

ifdef SEED
SEED_OPT=--seed $(SEED)
endif

ifdef MULTICLOCK
EQY_CLOCK=clk2fflogic
endif

ifdef YOSYS_DEFS
YOSYS_DEFS_OPT=verilog_defines $(YOSYS_DEFS);
endif

SDC_OPT ?=
ifneq ($(wildcard constraints.sdc),)
SDC_OPT = --sdc constraints.sdc
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
	@echo " - post - generate post pnr verilog netlist by nextpnr"
	@exit

synth: $(TEST_CASE)_synth.v
json: $(TEST_CASE).json

$(TEST_CASE)_synth.v: ../$(BOARD).vh $(VERILOG_FILES)
	@echo "Running Yosys"
	@$(YOSYS) -ql synth.log -p '$(YOSYS_DEFS_OPT) read_verilog -defer -sv $^; $(YOSYS_CMDS) synth_gatemate $(YOSYS_PARAM) -top $(TOP) -nomx8 -vlog $(TEST_CASE)_synth.v'

$(TEST_CASE).json $(TEST_CASE)_ys.v: ../$(BOARD).vh $(VERILOG_FILES)
	@echo "Running Yosys"
	@$(YOSYS) -ql synth.log -p '$(YOSYS_DEFS_OPT) read_verilog -defer -sv $^; $(YOSYS_CMDS) synth_gatemate $(YOSYS_PARAM) -luttree -top $(TOP) -json $(TEST_CASE).json; write_verilog -norename -noattr $(TEST_CASE)_ys.v'

$(TEST_CASE)_$(BOARD)_00.cfg: $(TEST_CASE)_synth.v $(BOARD).ccf
	$(call check_cc_tool)
	@echo "Running P_R for '$(BOARD)' board"
	@$(P_R) -i $(TEST_CASE)_synth.v ${PR_OPTS} -cCP -pr -ccf $(BOARD).ccf -o $(TEST_CASE)_$(BOARD)

$(TEST_CASE)_$(BOARD).txt $(TEST_CASE)_$(BOARD)_pnr.json: $(TEST_CASE).json $(BOARD).ccf
	@echo "Running nextpnr for '$(BOARD)' board"
	$(NEXTPNR) --device $(FPGA) --json $(TEST_CASE).json --vopt ccf=$(BOARD).ccf --vopt out=$(TEST_CASE)_$(BOARD).txt --router router2 --freq $(FREQ) $(SEED_OPT) $(SDC_OPT) --write $(TEST_CASE)_$(BOARD)_pnr.json --sdf $(TEST_CASE)_$(BOARD).sdf

$(TEST_CASE)_$(BOARD)_00.txt: $(TEST_CASE)_$(BOARD)_00.cfg
	@echo "Running unpack for '$(BOARD)' board"
	@$(GMUNPACK) $(TEST_CASE)_$(BOARD)_00.cfg.bit $(TEST_CASE)_$(BOARD)_00.txt

pr: $(TEST_CASE)_$(BOARD)_00.cfg

unpack: $(TEST_CASE)_$(BOARD)_00.txt

nextpnr: $(TEST_CASE)_$(BOARD).txt

post: $(TEST_CASE)_$(BOARD)_pnr.v

jtag_pr: $(TEST_CASE)_$(BOARD)_00.cfg
	@echo "Running openFPGALoader for '$(BOARD)' board"
	@$(OFL) $(OFL_BOARD) --index-chain 0 $^

jtag: $(TEST_CASE)_$(BOARD).txt
	@echo "Running openFPGALoader for '$(BOARD)' board"
	@$(GMPACK) $(TEST_CASE)_$(BOARD).txt $(TEST_CASE)_$(BOARD).bit
	@$(OFL) $(OFL_BOARD) --index-chain 0 $(TEST_CASE)_$(BOARD).bit

$(TEST_CASE)_$(BOARD)_pnr.v: $(TEST_CASE)_$(BOARD).txt
	@echo "Generate post PnR Verilog netlist"
	@$(YOSYS) -q -p 'read_json $(TEST_CASE)_$(BOARD)_pnr.json; write_verilog -norename -noattr $(TEST_CASE)_$(BOARD)_pnr.v'

firmware: $(FIRMWARE)
	@echo "Running openFPGALoader to program '$(FIRMWARE)' on '$(BOARD)' board"
	@$(OFL) $(OFL_BOARD) --index-chain 0 -f -o 1048576 $(FIRMWARE)

clean:
	@rm -rf *.log *_synth.v *.history *.txt *.refwire *.refparam *_ys.v
	@rm -rf *.refcomp *.pos *.pathes *.path_struc *.net *.id *.prn
	@rm -rf *_00.v *.used *.sdf *.place *.pin *.cfg *.bit  *.cdf *.idh *.min *.json
	@rm -rf *_pnr.v check_yosys check_yosys.eqy check_pnr check_pnr.eqy check_pnr_post check_pnr_post.eqy

force-nextpnr:
	$(NEXTPNR) --device $(FPGA) --json $(TEST_CASE).json --vopt ccf=$(BOARD).ccf --vopt out=../logs/$(TEST_CASE)_$(BOARD)_$(SEED).txt --router router2 --freq $(FREQ) $(SEED_OPT) $(SDC_OPT)

.PHONY: synth json pr nextpnr force-nextpnr jtag_pr jtag unpack check_yosys check_pnr check_pnr_post

check_yosys.eqy: $(TEST_CASE)_ys.v ../$(BOARD).vh $(VERILOG_FILES)
	@echo "Generating EQY file"
	@{ \
	  echo "[gold]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../cells_extra.v"; \
	  echo "read_verilog -defer -sv ../$(BOARD).vh $(VERILOG_FILES)"; \
	  echo "$(YOSYS_CMDS)"; \
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[gate]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../cells_extra.v"; \
	  echo "read_verilog $(TEST_CASE)_ys.v"; \
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[collect *]"; \
	  echo "bind *"; \
	  echo ""; \
	  echo "[strategy pdr]"; \
	  echo "use sby"; \
	  echo "engine abc scorr; pdr"; \
	} > $@

check_yosys: check_yosys.eqy
	@eqy -f $^

check_pnr.eqy: $(TEST_CASE)_$(BOARD)_pnr.v ../$(BOARD).vh $(VERILOG_FILES)
	@echo "Generating EQY file"
	@{ \
	  echo "[gold]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../cells_extra.v"; \
	  echo "read_verilog -defer -sv ../$(BOARD).vh $(VERILOG_FILES)"; \
	  echo "$(YOSYS_CMDS)"; \
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[gate]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../cpesim.v"; \
	  echo "read_verilog $(TEST_CASE)_$(BOARD)_pnr.v"; \
	  echo "rename top $(TOP)";\
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[collect *]"; \
	  echo "bind *"; \
	  echo ""; \
	  echo "[strategy pdr]"; \
	  echo "use sby"; \
	  echo "engine abc scorr; pdr"; \
	} > $@

check_pnr: check_pnr.eqy
	@eqy -f $^

check_pnr_post.eqy: $(TEST_CASE)_$(BOARD)_pnr.v ../$(BOARD).vh $(TEST_CASE)_ys.v
	@echo "Generating EQY file"
	@{ \
	  echo "[gold]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../cells_extra.v"; \
	  echo "read_verilog $(TEST_CASE)_ys.v"; \
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[gate]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../cpesim.v"; \
	  echo "read_verilog $(TEST_CASE)_$(BOARD)_pnr.v"; \
	  echo "rename top $(TOP)";\
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[collect *]"; \
	  echo "bind *"; \
	  echo ""; \
	  echo "[strategy pdr]"; \
	  echo "use sby"; \
	  echo "engine abc scorr; pdr"; \
	} > $@

check_pnr_post: check_pnr_post.eqy
	@eqy -f $^
