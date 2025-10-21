TEST_CASE := top
YOSYS_PARAM :=
FPGA := CCGM1A1
include ../makefile.inc

BOOTADDR := 1048576 # user image starts at 1MB

.PHONY: flash

flash: $(TEST_CASE)_$(BOARD).txt
	@echo "Running openFPGALoader for '$(BOARD)' board: secondary configuration at bootaddr $(BOOTADDR)"
	@$(OFL) $(OFL_BOARD) --index-chain 0 -o $(BOOTADDR) -f flash/secondary-config.bit
	@echo "Running openFPGALoader for '$(BOARD)' board: bootloader configuration"
	@$(GMPACK) $(TEST_CASE)_$(BOARD).txt $(TEST_CASE)_$(BOARD).bit --bootaddr=$(BOOTADDR)
	@$(OFL) $(OFL_BOARD) --index-chain 0 -f $(TEST_CASE)_$(BOARD).bit
