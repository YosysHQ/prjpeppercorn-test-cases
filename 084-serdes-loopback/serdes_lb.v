`timescale 1ns / 1ps

module serdes_lb (
    input pll_rstn_i,
    input trx_rstn_i,

    output PLL_CLK_O,
    output RX_CLK_O,

    output RX_RESET_DONE_O_N, TX_RESET_DONE_O_N,
    output TX_DETECT_RX_PRESENT_O_N, TX_DETECT_RX_DONE_O_N,
    output TX_BUF_ERR_O_N, RX_BUF_ERR_O_N,
    output RX_PRBS_ERR_O_N
);
    wire [63:0] RX_DATA_O;

    wire trx_rst_i = ~trx_rstn_i;
    wire pll_rst_i = ~pll_rstn_i;

    wire CLK_CORE_PLL_O_N;

    wire TX_RESET_DONE_O;
    wire RX_RESET_DONE_O;
    assign TX_RESET_DONE_O_N = ~TX_RESET_DONE_O;
    assign RX_RESET_DONE_O_N = ~RX_RESET_DONE_O;

    wire TX_DETECT_RX_PRESENT_O;
    wire TX_DETECT_RX_DONE_O;
    assign TX_DETECT_RX_PRESENT_O_N = ~TX_DETECT_RX_PRESENT_O;
    assign TX_DETECT_RX_DONE_O_N = ~TX_DETECT_RX_DONE_O;

    wire RX_PRBS_ERR_O;
    assign RX_PRBS_ERR_O_N = ~RX_PRBS_ERR_O;

    wire TX_BUF_ERR_O;
    wire RX_BUF_ERR_O;
    assign TX_BUF_ERR_O_N  = ~TX_BUF_ERR_O;
    assign RX_BUF_ERR_O_N  = ~RX_BUF_ERR_O;

    wire [63:0] RX_DATA_O;

    wire RX_EI_EN_O, REGFILE_RDY_O, CLK_CORE_RX_O;
    wire [7:0]  RX_CHAR_IS_K_O, RX_CHAR_IS_COMMA_O, RX_NOT_IN_TABLE_O;
    wire [15:0] REGFILE_DO_O;

    // 8b/10b control bytes
    parameter [7:0]
        K28_0 = 8'h1C,
        K28_1 = 8'h3C,
        K28_2 = 8'h5C,
        K28_3 = 8'h7C,
        K28_4 = 8'h9C,
        K28_5 = 8'hBC,
        K28_6 = 8'hDC,
        K28_7 = 8'hFC,
        K23_7 = 8'hF7,
        K27_7 = 8'hFB,
        K29_7 = 8'hFD,
        K30_7 = 8'hFE;

    // ADPLL clock settings
    parameter N1 = 1; // 1/2
    parameter N2 = 2; // 2/3/4/5
    parameter N3 = 3; // 3/4/5
    parameter OUTDIV = 4; // 1/2/4

    parameter DATAPATH = 80; // 80/64, 40/32, 20/16

    parameter ENABLE_8B10B = 1'b1;
    parameter ENABLE_COMMADETECT = 1'b1;

    parameter [2:0] PRBS_SEL =
        3'b000; // PRBS checker disabled
        //3'b001; // PRBS-7
        //3'b010; // PRBS-15
        //3'b011; // PRBS-23
        //3'b100; // PRBS-31
        //3'b101; // RESERVED
        //3'b110; // 2 UI square wave (TX ONLY)
        //3'b111; // 20/40/80 UI square wave, depending on data path width (TX ONLY)

    parameter [2:0] LOOPBACK_SEL =
        3'b000; // normal operation
        //3'b001; // near-end PCS Loopback
        //3'b010; // near-end PMA Loopback
        //3'b011; // reserved
        //3'b100; // far-end PMA Loopback
        //3'b101; // reserved
        //3'b110; // far-end PCS Loopback
        //3'b111; // reserved

    parameter [1:0] TX_PMA_LOOPBACK =
        //2'b00; // disabled
        2'b01; // loopback from TX driver
        //2'b10; // loopback from TX pads

    parameter [1:0] DATAPATH_SEL = {
        (DATAPATH == 80) || (DATAPATH == 64) ? 2'b11 : (DATAPATH == 40) || (DATAPATH == 32) ? 2'b01 : (DATAPATH == 20) || (DATAPATH == 16) ? 2'b00 : 2'bx
    }; // default: 2'h3

    parameter [5:0] PLL_FCNTRL = {
        DATAPATH == 80 ? 6'h3A : (DATAPATH == 64 ? 6'd54 : (DATAPATH == 40 ? 6'h3A : (DATAPATH == 32 ? 6'd54 : (DATAPATH == 20 ? 6'd26 : (DATAPATH == 16 ? 6'd23 : 6'bx)))))
    }; // default: 6'h3A = 58 ^= 20;

    parameter [5:0] PLL_MAIN_DIVSEL = {
        1'b0, // PLL_MAINDIV[5]: not used
        N3 == 3 ? 2'b00 : (N3 == 4 ? 2'b10 : (N3 == 5 ? 2'b11 : 2'bx)),
        N1 == 1 ? 1'b0  : (N1 == 2 ? 1'b1  : 1'bx),
        N2 == 3 ? 2'b00 : (N2 == 2 ? 2'b01 : (N2 == 4 ? 2'b10 : (N2 == 5 ? 2'b11 : 2'bx)))
    }; // default: 6'h1B;

    parameter [1:0] PLL_OUT_DIVSEL = {
        OUTDIV == 1 ? 2'b00 : OUTDIV == 2 ? 2'b01 : OUTDIV == 4 ? 2'b11 : 2'bx
    }; // default: 2'h0;


// CC_SERDES instance generator
// generated: 2024-01-31 13:57:01

CC_SERDES #(
    .RX_BUF_RESET_TIME(5'h3),
    .RX_PCS_RESET_TIME(5'h3),
    .RX_RESET_TIMER_PRESC(5'h0),
    .RX_RESET_DONE_GATE(1'h0),
    .RX_CDR_RESET_TIME(5'h3),
    .RX_EQA_RESET_TIME(5'h3),
    .RX_PMA_RESET_TIME(5'h3),
    .RX_WAIT_CDR_LOCK(1'b0), // turn off if loopback
    .RX_CALIB_EN(1'h0),
    .RX_CALIB_OVR(1'h0),
    .RX_CALIB_VAL(4'h0),
    .RX_RTERM_VCMSEL(3'h4),
    .RX_RTERM_PD(1'h0),
    .RX_EQA_CKP_LF(8'hA3),
    .RX_EQA_CKP_HF(8'hA3),
    .RX_EQA_CKP_OFFSET(8'h01),
    .RX_EN_EQA(1'h0),
    .RX_EQA_LOCK_CFG(4'h0),
    .RX_TH_MON1(5'h8),
    .RX_EN_EQA_EXT_VALUE(4'h0),
    .RX_TH_MON2(5'h8),
    .RX_TAPW(5'h8),
    .RX_AFE_OFFSET(5'h8),
    .RX_EQA_CONFIG(16'h1C0),
    .RX_AFE_PEAK(5'hF),
    .RX_AFE_GAIN(4'h8),
    .RX_AFE_VCMSEL(3'h4),
    .RX_CDR_CKP(8'hF8),
    .RX_CDR_CKI(8'h00),
    .RX_CDR_TRANS_TH(9'h80), // h15?
    .RX_CDR_LOCK_CFG(6'hB),
    .RX_CDR_FREQ_ACC(15'h0),
    .RX_CDR_PHASE_ACC(16'h0000),
    .RX_CDR_SET_ACC_CONFIG(2'h0),
    .RX_CDR_FORCE_LOCK(1'h0),
    .RX_ALIGN_MCOMMA_VALUE(10'h283),
    .RX_MCOMMA_ALIGN_OVR(1'h0),
    .RX_MCOMMA_ALIGN(1'h0),
    .RX_ALIGN_PCOMMA_VALUE(10'h17C),
    .RX_PCOMMA_ALIGN_OVR(1'h0),
    .RX_PCOMMA_ALIGN(1'h0),
    .RX_ALIGN_COMMA_WORD(2'h3), // 11: 32 bit, 01: 16 bit, 00: 8 bit
    .RX_ALIGN_COMMA_ENABLE(10'h3FF),
    .RX_SLIDE_MODE(2'b00), // !!!
    .RX_COMMA_DETECT_EN_OVR(1'h0),
    .RX_COMMA_DETECT_EN(1'h0),
    .RX_SLIDE(2'h0),
    .RX_EYE_MEAS_EN(1'h0),
    .RX_EYE_MEAS_CFG(15'h0),
    .RX_MON_PH_OFFSET(6'h0),
    .RX_EI_BIAS(4'h4),
    .RX_EI_BW_SEL(4'h4),
    .RX_EN_EI_DETECTOR_OVR(1'h0),
    .RX_EN_EI_DETECTOR(1'h0),
    .RX_DATA_SEL(1'h0),
    .RX_BUF_BYPASS(1'h0),
    .RX_CLKCOR_USE(1'h0),
    .RX_CLKCOR_MIN_LAT(6'h20),
    .RX_CLKCOR_MAX_LAT(6'h27),
    .RX_CLKCOR_SEQ_1_0(10'h1F7),
    .RX_CLKCOR_SEQ_1_1(10'h1F7),
    .RX_CLKCOR_SEQ_1_2(10'h1F7),
    .RX_CLKCOR_SEQ_1_3(10'h1F7),
    .RX_PMA_LOOPBACK(1'h0),
    .RX_PCS_LOOPBACK(1'h0),
    .RX_DATAPATH_SEL(DATAPATH_SEL),
    .RX_PRBS_OVR(1'h0),
    .RX_PRBS_SEL(0),
    .RX_LOOPBACK_OVR(1'h0),
    .RX_PRBS_CNT_RESET(1'h0),
    .RX_POWER_DOWN_OVR(1'h0),
    .RX_POWER_DOWN_N(1'h0),
    .RX_RESET_OVR(1'h0),
    .RX_RESET(1'h0),
    .RX_PMA_RESET_OVR(1'h0),
    .RX_PMA_RESET(1'h0),
    .RX_EQA_RESET_OVR(1'h0),
    .RX_EQA_RESET(1'h0),
    .RX_CDR_RESET_OVR(1'h0),
    .RX_CDR_RESET(1'h0),
    .RX_PCS_RESET_OVR(1'h0),
    .RX_PCS_RESET(1'h0),
    .RX_BUF_RESET_OVR(1'h0),
    .RX_BUF_RESET(1'h0),
    .RX_POLARITY_OVR(1'h0),
    .RX_POLARITY(1'h0),
    .RX_8B10B_EN_OVR(1'h0),
    .RX_8B10B_EN(1'h0),
    .RX_8B10B_BYPASS(8'h0),
    .RX_BYTE_REALIGN(1'h0),
    .TX_SEL_PRE(5'h0),
    .TX_SEL_POST(5'h0),
    .TX_AMP(5'hF),
    .TX_BRANCH_EN_PRE(5'h0),
    .TX_BRANCH_EN_MAIN(6'h3F),
    .TX_BRANCH_EN_POST(5'h0),
    .TX_TAIL_CASCODE(3'h4),
    .TX_DC_ENABLE(7'h3F),
    .TX_DC_OFFSET(5'h8), // ? note: set to 8
    .TX_CM_RAISE(5'h0),
    .TX_CM_THRESHOLD_0(5'hE),
    .TX_CM_THRESHOLD_1(5'h10),
    .TX_SEL_PRE_EI(5'h0),
    .TX_SEL_POST_EI(5'h0),
    .TX_AMP_EI(5'hF),
    .TX_BRANCH_EN_PRE_EI(5'h0),
    .TX_BRANCH_EN_MAIN_EI(6'h3F),
    .TX_BRANCH_EN_POST_EI(5'h0),
    .TX_TAIL_CASCODE_EI(3'h4),
    .TX_DC_ENABLE_EI(7'h3F),
    .TX_DC_OFFSET_EI(5'h0),
    .TX_CM_RAISE_EI(5'h0),
    .TX_CM_THRESHOLD_0_EI(5'hE),
    .TX_CM_THRESHOLD_1_EI(5'h10),
    .TX_SEL_PRE_RXDET(5'h0),
    .TX_SEL_POST_RXDET(5'h0),
    .TX_AMP_RXDET(5'hF),
    .TX_BRANCH_EN_PRE_RXDET(5'h0),
    .TX_BRANCH_EN_MAIN_RXDET(6'h3F),
    .TX_BRANCH_EN_POST_RXDET(5'h0),
    .TX_TAIL_CASCODE_RXDET(3'h4),
    .TX_DC_ENABLE_RXDET(7'h3F),
    .TX_DC_OFFSET_RXDET(5'h0),
    .TX_CM_RAISE_RXDET(5'h0),
    .TX_CM_THRESHOLD_0_RXDET(5'hE),
    .TX_CM_THRESHOLD_1_RXDET(5'h10),
    .TX_CALIB_EN(1'h0),
    .TX_CALIB_OVR(1'h0),
    .TX_CALIB_VAL(4'h0),
    .TX_CM_REG_KI(8'h80),
    .TX_CM_SAR_EN(1'h0),
    .TX_CM_REG_EN(1'h1),
    .TX_PMA_RESET_TIME(5'h3),
    .TX_PCS_RESET_TIME(5'h3),
    .TX_PCS_RESET_OVR(1'h0),
    .TX_PCS_RESET(1'h0),
    .TX_PMA_RESET_OVR(1'h0),
    .TX_PMA_RESET(1'h0),
    .TX_RESET_OVR(1'h0),
    .TX_RESET(1'h0),
    .TX_PMA_LOOPBACK(TX_PMA_LOOPBACK),
    .TX_PCS_LOOPBACK(1'h0),
    .TX_DATAPATH_SEL(DATAPATH_SEL),
    .TX_PRBS_OVR(1'h0),
    .TX_PRBS_SEL(3'b0),
    .TX_PRBS_FORCE_ERR(1'h0),
    .TX_LOOPBACK_OVR(1'h0),
    .TX_POWER_DOWN_OVR(1'h0),
    .TX_POWER_DOWN_N(1'h1),
    .TX_ELEC_IDLE_OVR(1'h0),
    .TX_ELEC_IDLE(1'h0),
    .TX_DETECT_RX_OVR(1'h0),
    .TX_DETECT_RX(1'h0),
    .TX_POLARITY_OVR(1'h0),
    .TX_POLARITY(1'h0),
    .TX_8B10B_EN_OVR(1'h0),
    .TX_8B10B_EN(1'h0),
    .TX_DATA_OVR(1'h0),
    .TX_DATA_CNT(3'h0),
    .TX_DATA_VALID(1'h0),
    .PLL_EN_ADPLL_CTRL(1'h1),
    .PLL_CONFIG_SEL(1'h1), // 0: internal, 1: regfile
    .PLL_SET_OP_LOCK(1'h0),
    .PLL_ENFORCE_LOCK(1'h0),
    .PLL_DISABLE_LOCK(1'h0),
    .PLL_LOCK_WINDOW(1'h1), // 0: long, 1: short
    .PLL_FAST_LOCK(1'h1),
    .PLL_SYNC_BYPASS(1'h0),
    .PLL_PFD_SELECT(1'h0),
    .PLL_REF_BYPASS(1'h0),
    .PLL_REF_SEL(1'h1), // 0: single-ended, 1: lvds
    .PLL_REF_RTERM(1'h1),
    .PLL_FCNTRL(PLL_FCNTRL),
    .PLL_MAIN_DIVSEL(PLL_MAIN_DIVSEL),
    .PLL_OUT_DIVSEL(PLL_OUT_DIVSEL),
    .PLL_CI(5'h3),
    .PLL_CP(10'h50),
    .PLL_AO(4'h0),
    .PLL_SCAP(3'h0),
    .PLL_FILTER_SHIFT(2'h2),
    .PLL_SAR_LIMIT(3'h2),
    .PLL_FT(11'h200),
    .PLL_OPEN_LOOP(1'h0),
    .PLL_SCAP_AUTO_CAL(1'h1),
    .PLL_BISC_MODE(3'h4), // PLL_BISC_MODE[0]: enable
    .PLL_BISC_TIMER_MAX(4'hF),
    .PLL_BISC_OPT_DET_IND(1'h0),
    .PLL_BISC_PFD_SEL(1'h0),
    .PLL_BISC_DLY_DIR(1'h0),
    .PLL_BISC_COR_DLY(3'h1),
    .PLL_BISC_CAL_SIGN(1'h0),
    .PLL_BISC_CAL_AUTO(1'h1),
    .PLL_BISC_CP_MIN(5'h4),
    .PLL_BISC_CP_MAX(5'h12),
    .PLL_BISC_CP_START(5'hC),
    .PLL_BISC_DLY_PFD_MON_REF(5'h0),
    .PLL_BISC_DLY_PFD_MON_DIV(5'h2),
    .SERDES_ENABLE(1'h1),
    .SERDES_AUTO_INIT(1'h0),
    .SERDES_TESTMODE(1'h0)
) i_cc_serdes (
    // ADPLL
    .RX_CLK_O(RX_CLK_O), // CDR CLK
    .PLL_CLK_O(PLL_CLK_O),
    // LOPPBACK
    .LOOPBACK_I(LOOPBACK_SEL),
    // RESET
    .TX_RESET_I(trx_rst_i),
    .RX_RESET_I(trx_rst_i),
    .RX_PMA_RESET_I(1'b0),
    .RX_EQA_RESET_I(1'b0),
    .RX_CDR_RESET_I(1'b0),
    .RX_PCS_RESET_I(1'b0),
    .RX_BUF_RESET_I(1'b0),
    .TX_PCS_RESET_I(1'b0),
    .TX_PMA_RESET_I(1'b0),
    .PLL_RESET_I(pll_rst_i),
    .TX_RESET_DONE_O(TX_RESET_DONE_O),
    .RX_RESET_DONE_O(RX_RESET_DONE_O),
    // TX
    .TX_CLK_I(PLL_CLK_O),
    .TX_DATA_I({32'h00000000, 8'h00, 16'hCAFE, K28_5}),
    .TX_POWER_DOWN_N_I(1'h1),
    .TX_POLARITY_I(1'h0),
    .TX_PRBS_SEL_I(PRBS_SEL),
    .TX_PRBS_FORCE_ERR_I(1'b0),
    .TX_8B10B_EN_I(ENABLE_8B10B),
    .TX_8B10B_BYPASS_I(8'h0),
    .TX_CHAR_IS_K_I(ENABLE_8B10B ? 8'b0000_0001 : 8'h00),
    .TX_CHAR_DISPMODE_I(8'h0),
    .TX_CHAR_DISPVAL_I(8'h0),
    .TX_ELEC_IDLE_I(1'h0),
    .TX_DETECT_RX_I(1'b1),
    .TX_BUF_ERR_O(TX_BUF_ERR_O),
    // RX
    .RX_CLK_I(RX_CLK_O),
    .RX_POWER_DOWN_N_I(1'h1),
    .RX_POLARITY_I(1'h0),
    .RX_PRBS_SEL_I(PRBS_SEL),
    .RX_PRBS_CNT_RESET_I(1'b0),
    .RX_PRBS_ERR_O(RX_PRBS_ERR_O),
    .RX_8B10B_EN_I(ENABLE_8B10B),
    .RX_8B10B_BYPASS_I(8'h0),
    .RX_EN_EI_DETECTOR_I(1'h0),
    .RX_COMMA_DETECT_EN_I(1'h1), // 1
    .RX_SLIDE_I(1'h0),
    .RX_MCOMMA_ALIGN_I(1'h1),
    .RX_PCOMMA_ALIGN_I(1'h1),
    .RX_DATA_O(RX_DATA_O),
    .RX_NOT_IN_TABLE_O(),
    .RX_CHAR_IS_COMMA_O(),
    .RX_CHAR_IS_K_O(),
    .RX_DISP_ERR_O(),
    .TX_DETECT_RX_DONE_O(TX_DETECT_RX_DONE_O),
    .TX_DETECT_RX_PRESENT_O(TX_DETECT_RX_PRESENT_O),
    .RX_BUF_ERR_O(RX_BUF_ERR_O),
    .RX_BYTE_IS_ALIGNED_O(),
    .RX_BYTE_REALIGN_O(),
    .RX_EI_EN_O(),
    // REGFILE
    .REGFILE_CLK_I(1'h0),
    .REGFILE_WE_I(1'h0),
    .REGFILE_EN_I(1'h0),
    .REGFILE_ADDR_I(8'h0),
    .REGFILE_DI_I(16'h0),
    .REGFILE_MASK_I(16'h0),
    .REGFILE_DO_O(REGFILE_DO_O),
    .REGFILE_RDY_O(REGFILE_RDY_O)
);

endmodule
