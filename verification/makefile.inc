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
	@echo "Use one of targets for:"
	@echo " - synth - running Yosys synthesys only"
	@echo " - pr - Yosys + p_r"
	@echo " - unpack - Unpack p_r bitstream"
	@echo " - json - Yosys for nextpnr"
	@echo " - nextpnr - Yosys + nextpnr"
	@echo " - post - generate post pnr verilog netlist by nextpnr"
	@exit

synth: $(TEST_CASE)_synth.v
json: $(TEST_CASE).json

$(TEST_CASE)_synth.v: $(VERILOG_FILES)
	@echo "Running Yosys"
	@$(YOSYS) -ql synth.log -p '$(YOSYS_DEFS_OPT) read_verilog -defer -sv $^; $(YOSYS_CMDS) synth_gatemate $(YOSYS_PARAM) -top $(TOP) -nomx8 -vlog $(TEST_CASE)_synth.v'

$(TEST_CASE).json $(TEST_CASE)_ys.v: $(VERILOG_FILES)
	@echo "Running Yosys"
	@$(YOSYS) -ql synth.log -p '$(YOSYS_DEFS_OPT) read_verilog -defer -sv $^; $(YOSYS_CMDS) synth_gatemate $(YOSYS_PARAM) -luttree -top $(TOP) -json $(TEST_CASE).json; write_verilog -norename -noattr $(TEST_CASE)_ys.v'

$(TEST_CASE)_00.cfg: $(TEST_CASE)_synth.v
	$(call check_cc_tool)
	@echo "Running P_R"
	@$(P_R) -i $(TEST_CASE)_synth.v ${PR_OPTS} -cCP -pr -ccf ../dummy.ccf -o $(TEST_CASE)

$(TEST_CASE).txt $(TEST_CASE)_pnr.json: $(TEST_CASE).json
	@echo "Running nextpnr"
	$(NEXTPNR) --device $(FPGA) --json $(TEST_CASE).json --vopt out=$(TEST_CASE).txt --vopt allow-unconstrained --router router2 $(SEED_OPT) $(SDC_OPT) --write $(TEST_CASE)_pnr.json

$(TEST_CASE)_00.txt: $(TEST_CASE)_00.cfg
	@echo "Running unpack"
	@$(GMUNPACK) $(TEST_CASE)_00.cfg.bit $(TEST_CASE)_00.txt

pr: $(TEST_CASE)_00.cfg

unpack: $(TEST_CASE)_00.txt

nextpnr: $(TEST_CASE).txt

post: $(TEST_CASE)_pnr.v

$(TEST_CASE)_pnr.v: $(TEST_CASE).txt
	@echo "Generate post PnR Verilog netlist"
	@$(YOSYS) -q -p 'read_json $(TEST_CASE)_pnr.json; write_verilog -norename -noattr $(TEST_CASE)_pnr.v'

clean:
	@rm -rf *.log *_synth.v *.history *.txt *.refwire *.refparam *_ys.v
	@rm -rf *.refcomp *.pos *.pathes *.path_struc *.net *.id *.prn
	@rm -rf *_00.v *.used *.sdf *.place *.pin *.cfg *.bit  *.cdf *.idh *.min *.json
	@rm -rf *_pnr.v check_yosys check_yosys.eqy check_pnr check_pnr.eqy check_pnr_post check_pnr_post.eqy

force-nextpnr:
	$(NEXTPNR) --device $(FPGA) --json $(TEST_CASE).json --vopt out=../logs/$(TEST_CASE)_$(SEED).txt --vopt allow-unconstrained --router router2 $(SEED_OPT) $(SDC_OPT)

.PHONY: synth json pr nextpnr force-nextpnr jtag_pr jtag unpack check_yosys check_pnr check_pnr_post

check_yosys.eqy: $(TEST_CASE)_ys.v $(VERILOG_FILES)
	@echo "Generating EQY file"
	@{ \
	  echo "[gold]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../../cells_extra.v"; \
	  echo "read_verilog -defer -sv $(VERILOG_FILES)"; \
	  echo "$(YOSYS_CMDS)"; \
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[gate]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../../cells_extra.v"; \
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

check_pnr.eqy: $(TEST_CASE)_pnr.v $(VERILOG_FILES)
	@echo "Generating EQY file"
	@{ \
	  echo "[gold]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../../cells_extra.v"; \
	  echo "read_verilog -defer -sv $(VERILOG_FILES)"; \
	  echo "$(YOSYS_CMDS)"; \
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[gate]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../../cpesim.v"; \
	  echo "read_verilog $(TEST_CASE)_pnr.v"; \
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

check_pnr_post.eqy: $(TEST_CASE)_pnr.v $(TEST_CASE)_ys.v
	@echo "Generating EQY file"
	@{ \
	  echo "[gold]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../../cells_extra.v"; \
	  echo "read_verilog $(TEST_CASE)_ys.v"; \
	  echo "prep -top $(TOP)"; \
	  echo "flatten";\
	  echo "$(EQY_CLOCK)";\
	  echo "memory_map";\
	  echo ""; \
	  echo "[gate]"; \
	  echo "$(YOSYS_DEFS_OPT)"; \
	  echo "read_verilog -nowb -noblackbox +/gatemate/cells_sim.v ../../cpesim.v"; \
	  echo "read_verilog $(TEST_CASE)_pnr.v"; \
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
