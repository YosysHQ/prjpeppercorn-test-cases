`define SYNTHESIS
// Generator : SpinalHDL dev    git head : 002ffd50bca59e0f8b9c74b0d00cac86d8379810
// Component : VexRiscvLitexSmpCluster_Cc1_Iw32Is4096Iy1_Dw32Ds4096Dy1_ITs4DTs4_Ood_Wm_Hb1
// Git hash  : 625fc8437952ca00d474f0547faef72cbe68a32c

`timescale 1ns/1ps

module VexRiscvLitexSmpCluster_Cc1_Iw32Is4096Iy1_Dw32Ds4096Dy1_ITs4DTs4_Ood_Wm_Hb1 (
  input  wire          debugCd_external_clk,
  input  wire          debugCd_external_reset,
  input  wire [31:0]   interrupts,
  input  wire          debugPort_tdi,
  input  wire          debugPort_enable,
  input  wire          debugPort_capture,
  input  wire          debugPort_shift,
  input  wire          debugPort_update,
  input  wire          debugPort_reset,
  output wire          debugPort_tdo,
  input  wire          clintWishbone_CYC,
  input  wire          clintWishbone_STB,
  output wire          clintWishbone_ACK,
  input  wire          clintWishbone_WE,
  input  wire [13:0]   clintWishbone_ADR,
  output wire [31:0]   clintWishbone_DAT_MISO,
  input  wire [31:0]   clintWishbone_DAT_MOSI,
  input  wire          plicWishbone_CYC,
  input  wire          plicWishbone_STB,
  output wire          plicWishbone_ACK,
  input  wire          plicWishbone_WE,
  input  wire [19:0]   plicWishbone_ADR,
  output wire [31:0]   plicWishbone_DAT_MISO,
  input  wire [31:0]   plicWishbone_DAT_MOSI,
  output wire          peripheral_CYC,
  output wire          peripheral_STB,
  input  wire          peripheral_ACK,
  output wire          peripheral_WE,
  output wire [29:0]   peripheral_ADR,
  input  wire [31:0]   peripheral_DAT_MISO,
  output wire [31:0]   peripheral_DAT_MOSI,
  output wire [3:0]    peripheral_SEL,
  input  wire          peripheral_ERR,
  output wire [2:0]    peripheral_CTI,
  output wire [1:0]    peripheral_BTE,
  input  wire          jtag_clk
);

  wire                bufferCC_4_io_dataIn;
  wire                bufferCC_5_io_dataIn;
  wire                clint_logic_io_stop;
  reg                 cores_0_cpu_logic_cpu_dBus_rsp_valid;
  wire                cores_0_cpu_logic_cpu_dBus_rsp_payload_error;
  wire                cores_0_cpu_logic_cpu_timerInterrupt;
  wire                cores_0_cpu_logic_cpu_softwareInterrupt;
  wire                cores_0_cpu_logic_cpu_debug_bus_cmd_payload_wr;
  wire                cores_0_cpu_logic_cpu_iBus_rsp_payload_error;
  wire                bufferCC_6_io_dataIn;
  wire       [31:0]   peripheralBridge_bmb_arbiter_io_inputs_1_cmd_payload_fragment_data;
  wire       [3:0]    peripheralBridge_bmb_arbiter_io_inputs_1_cmd_payload_fragment_mask;
  wire                bufferCC_4_io_dataOut;
  wire                bufferCC_5_io_dataOut;
  wire                customDebug_debugBridge_logic_jtagBridge_io_ctrl_tdo;
  wire                customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_valid;
  wire                customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_payload_last;
  wire       [0:0]    customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_payload_fragment;
  wire                customDebug_debugBridge_logic_jtagBridge_io_remote_rsp_ready;
  wire                customDebug_debugBridge_logic_debugger_io_remote_cmd_ready;
  wire                customDebug_debugBridge_logic_debugger_io_remote_rsp_valid;
  wire                customDebug_debugBridge_logic_debugger_io_remote_rsp_payload_error;
  wire       [31:0]   customDebug_debugBridge_logic_debugger_io_remote_rsp_payload_data;
  wire                customDebug_debugBridge_logic_debugger_io_mem_cmd_valid;
  wire       [31:0]   customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_address;
  wire       [31:0]   customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_data;
  wire                customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_wr;
  wire       [1:0]    customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_size;
  wire                clint_logic_io_bus_cmd_ready;
  wire                clint_logic_io_bus_rsp_valid;
  wire                clint_logic_io_bus_rsp_payload_last;
  wire       [0:0]    clint_logic_io_bus_rsp_payload_fragment_opcode;
  wire       [31:0]   clint_logic_io_bus_rsp_payload_fragment_data;
  wire       [0:0]    clint_logic_io_timerInterrupt;
  wire       [0:0]    clint_logic_io_softwareInterrupt;
  wire       [63:0]   clint_logic_io_time;
  wire                cores_0_cpu_logic_cpu_dBus_cmd_valid;
  wire                cores_0_cpu_logic_cpu_dBus_cmd_payload_wr;
  wire                cores_0_cpu_logic_cpu_dBus_cmd_payload_uncached;
  wire       [31:0]   cores_0_cpu_logic_cpu_dBus_cmd_payload_address;
  wire       [31:0]   cores_0_cpu_logic_cpu_dBus_cmd_payload_data;
  wire       [3:0]    cores_0_cpu_logic_cpu_dBus_cmd_payload_mask;
  wire       [2:0]    cores_0_cpu_logic_cpu_dBus_cmd_payload_size;
  wire                cores_0_cpu_logic_cpu_dBus_cmd_payload_last;
  wire                cores_0_cpu_logic_cpu_debug_bus_cmd_ready;
  wire       [31:0]   cores_0_cpu_logic_cpu_debug_bus_rsp_data;
  wire                cores_0_cpu_logic_cpu_debug_resetOut;
  wire                cores_0_cpu_logic_cpu_iBus_cmd_valid;
  wire       [31:0]   cores_0_cpu_logic_cpu_iBus_cmd_payload_address;
  wire       [2:0]    cores_0_cpu_logic_cpu_iBus_cmd_payload_size;
  wire                bufferCC_6_io_dataOut;
  wire       [31:0]   clintWishboneBridge_logic_bridge_io_input_DAT_MISO;
  wire                clintWishboneBridge_logic_bridge_io_input_ACK;
  wire                clintWishboneBridge_logic_bridge_io_output_cmd_valid;
  wire                clintWishboneBridge_logic_bridge_io_output_cmd_payload_last;
  wire       [0:0]    clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_opcode;
  wire       [15:0]   clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_address;
  wire       [1:0]    clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_length;
  wire       [31:0]   clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_data;
  wire       [3:0]    clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_mask;
  wire                clintWishboneBridge_logic_bridge_io_output_rsp_ready;
  wire       [31:0]   plicWishboneBridge_logic_bridge_io_input_DAT_MISO;
  wire                plicWishboneBridge_logic_bridge_io_input_ACK;
  wire                plicWishboneBridge_logic_bridge_io_output_cmd_valid;
  wire                plicWishboneBridge_logic_bridge_io_output_cmd_payload_last;
  wire       [0:0]    plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_opcode;
  wire       [21:0]   plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_address;
  wire       [1:0]    plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_length;
  wire       [31:0]   plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_data;
  wire       [3:0]    plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_mask;
  wire                plicWishboneBridge_logic_bridge_io_output_rsp_ready;
  wire                customDebug_debugBridge_bmb_decoder_io_input_cmd_ready;
  wire                customDebug_debugBridge_bmb_decoder_io_input_rsp_valid;
  wire                customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_last;
  wire       [0:0]    customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_fragment_data;
  wire                customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_valid;
  wire                customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_last;
  wire       [0:0]    customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  wire       [31:0]   customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_address;
  wire       [1:0]    customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_length;
  wire       [31:0]   customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_data;
  wire       [3:0]    customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_mask;
  wire                customDebug_debugBridge_bmb_decoder_io_outputs_0_rsp_ready;
  wire                iArbiter_bmb_decoder_io_input_cmd_ready;
  wire                iArbiter_bmb_decoder_io_input_rsp_valid;
  wire                iArbiter_bmb_decoder_io_input_rsp_payload_last;
  wire       [0:0]    iArbiter_bmb_decoder_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   iArbiter_bmb_decoder_io_input_rsp_payload_fragment_data;
  wire                iArbiter_bmb_decoder_io_outputs_0_cmd_valid;
  wire                iArbiter_bmb_decoder_io_outputs_0_cmd_payload_last;
  wire       [0:0]    iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  wire       [31:0]   iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_address;
  wire       [5:0]    iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_length;
  wire                iArbiter_bmb_decoder_io_outputs_0_rsp_ready;
  wire                peripheralBridge_logic_io_input_cmd_ready;
  wire                peripheralBridge_logic_io_input_rsp_valid;
  wire                peripheralBridge_logic_io_input_rsp_payload_last;
  wire       [0:0]    peripheralBridge_logic_io_input_rsp_payload_fragment_source;
  wire       [0:0]    peripheralBridge_logic_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   peripheralBridge_logic_io_input_rsp_payload_fragment_data;
  wire       [0:0]    peripheralBridge_logic_io_input_rsp_payload_fragment_context;
  wire       [31:0]   peripheralBridge_logic_io_output_DAT_MOSI;
  wire       [29:0]   peripheralBridge_logic_io_output_ADR;
  wire                peripheralBridge_logic_io_output_CYC;
  wire       [3:0]    peripheralBridge_logic_io_output_SEL;
  wire                peripheralBridge_logic_io_output_STB;
  wire                peripheralBridge_logic_io_output_WE;
  wire       [2:0]    peripheralBridge_logic_io_output_CTI;
  wire       [1:0]    peripheralBridge_logic_io_output_BTE;
  wire                peripheralBridge_bmb_arbiter_io_inputs_0_cmd_ready;
  wire                peripheralBridge_bmb_arbiter_io_inputs_0_rsp_valid;
  wire                peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_last;
  wire       [0:0]    peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode;
  wire       [31:0]   peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data;
  wire       [0:0]    peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context;
  wire                peripheralBridge_bmb_arbiter_io_inputs_1_cmd_ready;
  wire                peripheralBridge_bmb_arbiter_io_inputs_1_rsp_valid;
  wire                peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_last;
  wire       [0:0]    peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode;
  wire       [31:0]   peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data;
  wire                peripheralBridge_bmb_arbiter_io_output_cmd_valid;
  wire                peripheralBridge_bmb_arbiter_io_output_cmd_payload_last;
  wire       [0:0]    peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_source;
  wire       [0:0]    peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_address;
  wire       [5:0]    peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_length;
  wire       [31:0]   peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_data;
  wire       [3:0]    peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_mask;
  wire       [0:0]    peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_context;
  wire                peripheralBridge_bmb_arbiter_io_output_rsp_ready;
  wire       [29:0]   _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_address;
  wire       [6:0]    _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask_1;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_82;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_83;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_84;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_85;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_86;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_87;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_88;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_89;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_90;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_91;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_92;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_93;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_94;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_95;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_96;
  wire       [4:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_97;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_82;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_83;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_84;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_85;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_86;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_87;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_88;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_89;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_90;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_91;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_92;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_93;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_94;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_95;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_96;
  wire       [4:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_97;
  reg                 debugCd_logic_inputResetTrigger;
  reg                 debugCd_logic_outputResetUnbuffered;
  reg        [11:0]   debugCd_logic_holdingLogic_resetCounter;
  wire                when_ClockDomainGenerator_l222;
  reg                 debugCd_logic_outputReset;
  wire                debugCd_logic_inputResetAdapter_stuff_syncTrigger;
  reg                 systemCd_logic_inputResetTrigger;
  reg                 systemCd_logic_outputResetUnbuffered;
  reg        [5:0]    systemCd_logic_holdingLogic_resetCounter;
  wire                when_ClockDomainGenerator_l222_1;
  reg                 systemCd_logic_outputReset;
  wire                systemCd_logic_inputResetAdapter_stuff_syncTrigger;
  wire                customDebug_debugBridge_logic_mmMaster_cmd_valid;
  wire                customDebug_debugBridge_logic_mmMaster_cmd_ready;
  wire                customDebug_debugBridge_logic_mmMaster_cmd_payload_last;
  wire       [0:0]    customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_opcode;
  wire       [31:0]   customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_address;
  wire       [1:0]    customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_length;
  wire       [31:0]   customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_data;
  wire       [3:0]    customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask;
  wire                customDebug_debugBridge_logic_mmMaster_rsp_valid;
  wire                customDebug_debugBridge_logic_mmMaster_rsp_ready;
  wire                customDebug_debugBridge_logic_mmMaster_rsp_payload_last;
  wire       [0:0]    customDebug_debugBridge_logic_mmMaster_rsp_payload_fragment_opcode;
  wire       [31:0]   customDebug_debugBridge_logic_mmMaster_rsp_payload_fragment_data;
  reg        [3:0]    _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask;
  wire                _zz_when_PlicGateway_l21;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_1;
  reg                 _zz_when_PlicGateway_l21_1;
  wire                when_PlicGateway_l21;
  wire                _zz_when_PlicGateway_l21_2;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_2;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_3;
  reg                 _zz_when_PlicGateway_l21_3;
  wire                when_PlicGateway_l21_1;
  wire                _zz_when_PlicGateway_l21_4;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_4;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_5;
  reg                 _zz_when_PlicGateway_l21_5;
  wire                when_PlicGateway_l21_2;
  wire                _zz_when_PlicGateway_l21_6;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_6;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_7;
  reg                 _zz_when_PlicGateway_l21_7;
  wire                when_PlicGateway_l21_3;
  wire                _zz_when_PlicGateway_l21_8;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_8;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_9;
  reg                 _zz_when_PlicGateway_l21_9;
  wire                when_PlicGateway_l21_4;
  wire                _zz_when_PlicGateway_l21_10;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_10;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_11;
  reg                 _zz_when_PlicGateway_l21_11;
  wire                when_PlicGateway_l21_5;
  wire                _zz_when_PlicGateway_l21_12;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_12;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_13;
  reg                 _zz_when_PlicGateway_l21_13;
  wire                when_PlicGateway_l21_6;
  wire                _zz_when_PlicGateway_l21_14;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_14;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_15;
  reg                 _zz_when_PlicGateway_l21_15;
  wire                when_PlicGateway_l21_7;
  wire                _zz_when_PlicGateway_l21_16;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_16;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_17;
  reg                 _zz_when_PlicGateway_l21_17;
  wire                when_PlicGateway_l21_8;
  wire                _zz_when_PlicGateway_l21_18;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_18;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_19;
  reg                 _zz_when_PlicGateway_l21_19;
  wire                when_PlicGateway_l21_9;
  wire                _zz_when_PlicGateway_l21_20;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_20;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_21;
  reg                 _zz_when_PlicGateway_l21_21;
  wire                when_PlicGateway_l21_10;
  wire                _zz_when_PlicGateway_l21_22;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_22;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_23;
  reg                 _zz_when_PlicGateway_l21_23;
  wire                when_PlicGateway_l21_11;
  wire                _zz_when_PlicGateway_l21_24;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_24;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_25;
  reg                 _zz_when_PlicGateway_l21_25;
  wire                when_PlicGateway_l21_12;
  wire                _zz_when_PlicGateway_l21_26;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_26;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_27;
  reg                 _zz_when_PlicGateway_l21_27;
  wire                when_PlicGateway_l21_13;
  wire                _zz_when_PlicGateway_l21_28;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_28;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_29;
  reg                 _zz_when_PlicGateway_l21_29;
  wire                when_PlicGateway_l21_14;
  wire                _zz_when_PlicGateway_l21_30;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_30;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_31;
  reg                 _zz_when_PlicGateway_l21_31;
  wire                when_PlicGateway_l21_15;
  wire                _zz_when_PlicGateway_l21_32;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_32;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_33;
  reg                 _zz_when_PlicGateway_l21_33;
  wire                when_PlicGateway_l21_16;
  wire                _zz_when_PlicGateway_l21_34;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_34;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_35;
  reg                 _zz_when_PlicGateway_l21_35;
  wire                when_PlicGateway_l21_17;
  wire                _zz_when_PlicGateway_l21_36;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_36;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_37;
  reg                 _zz_when_PlicGateway_l21_37;
  wire                when_PlicGateway_l21_18;
  wire                _zz_when_PlicGateway_l21_38;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_38;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_39;
  reg                 _zz_when_PlicGateway_l21_39;
  wire                when_PlicGateway_l21_19;
  wire                _zz_when_PlicGateway_l21_40;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_40;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_41;
  reg                 _zz_when_PlicGateway_l21_41;
  wire                when_PlicGateway_l21_20;
  wire                _zz_when_PlicGateway_l21_42;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_42;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_43;
  reg                 _zz_when_PlicGateway_l21_43;
  wire                when_PlicGateway_l21_21;
  wire                _zz_when_PlicGateway_l21_44;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_44;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_45;
  reg                 _zz_when_PlicGateway_l21_45;
  wire                when_PlicGateway_l21_22;
  wire                _zz_when_PlicGateway_l21_46;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_46;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_47;
  reg                 _zz_when_PlicGateway_l21_47;
  wire                when_PlicGateway_l21_23;
  wire                _zz_when_PlicGateway_l21_48;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_48;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_49;
  reg                 _zz_when_PlicGateway_l21_49;
  wire                when_PlicGateway_l21_24;
  wire                _zz_when_PlicGateway_l21_50;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_50;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_51;
  reg                 _zz_when_PlicGateway_l21_51;
  wire                when_PlicGateway_l21_25;
  wire                _zz_when_PlicGateway_l21_52;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_52;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_53;
  reg                 _zz_when_PlicGateway_l21_53;
  wire                when_PlicGateway_l21_26;
  wire                _zz_when_PlicGateway_l21_54;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_54;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_55;
  reg                 _zz_when_PlicGateway_l21_55;
  wire                when_PlicGateway_l21_27;
  wire                _zz_when_PlicGateway_l21_56;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_56;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_57;
  reg                 _zz_when_PlicGateway_l21_57;
  wire                when_PlicGateway_l21_28;
  wire                _zz_when_PlicGateway_l21_58;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_58;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_59;
  reg                 _zz_when_PlicGateway_l21_59;
  wire                when_PlicGateway_l21_29;
  wire                _zz_when_PlicGateway_l21_60;
  wire       [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_60;
  reg                 _zz_plic_logic_bus_rsp_payload_fragment_data_61;
  reg                 _zz_when_PlicGateway_l21_61;
  wire                when_PlicGateway_l21_30;
  wire                cores_0_cpu_iBus_cmd_valid;
  wire                cores_0_cpu_iBus_cmd_ready;
  wire                cores_0_cpu_iBus_cmd_payload_last;
  wire       [0:0]    cores_0_cpu_iBus_cmd_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_iBus_cmd_payload_fragment_address;
  wire       [5:0]    cores_0_cpu_iBus_cmd_payload_fragment_length;
  wire                cores_0_cpu_iBus_rsp_valid;
  wire                cores_0_cpu_iBus_rsp_ready;
  wire                cores_0_cpu_iBus_rsp_payload_last;
  wire       [0:0]    cores_0_cpu_iBus_rsp_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_iBus_rsp_payload_fragment_data;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_valid;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_ready;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_last;
  wire       [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_opcode;
  wire       [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_address;
  wire       [5:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length;
  wire       [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_data;
  wire       [3:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_mask;
  wire       [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_context;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_ready;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_last;
  wire       [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_opcode;
  wire       [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_data;
  wire       [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_context;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_withoutWriteBuffer_busCmdContext_isWrite;
  reg        [5:0]    _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length;
  wire                when_DataCache_l535;
  reg                 cores_0_cpu_debugReset;
  wire                plic_logic_bmb_cmd_valid;
  wire                plic_logic_bmb_cmd_ready;
  wire                plic_logic_bmb_cmd_payload_last;
  wire       [0:0]    plic_logic_bmb_cmd_payload_fragment_opcode;
  wire       [21:0]   plic_logic_bmb_cmd_payload_fragment_address;
  wire       [1:0]    plic_logic_bmb_cmd_payload_fragment_length;
  wire       [31:0]   plic_logic_bmb_cmd_payload_fragment_data;
  wire       [3:0]    plic_logic_bmb_cmd_payload_fragment_mask;
  wire                plic_logic_bmb_rsp_valid;
  wire                plic_logic_bmb_rsp_ready;
  wire                plic_logic_bmb_rsp_payload_last;
  wire       [0:0]    plic_logic_bmb_rsp_payload_fragment_opcode;
  wire       [31:0]   plic_logic_bmb_rsp_payload_fragment_data;
  wire                plic_logic_bus_readErrorFlag;
  wire                plic_logic_bus_writeErrorFlag;
  reg                 plic_logic_bus_readHaltTrigger;
  wire                plic_logic_bus_writeHaltTrigger;
  wire                plic_logic_bus_rsp_valid;
  wire                plic_logic_bus_rsp_ready;
  wire                plic_logic_bus_rsp_payload_last;
  reg        [0:0]    plic_logic_bus_rsp_payload_fragment_opcode;
  reg        [31:0]   plic_logic_bus_rsp_payload_fragment_data;
  wire                _zz_plic_logic_bus_rsp_ready;
  reg                 _zz_plic_logic_bus_rsp_ready_1;
  wire                _zz_plic_logic_bmb_rsp_valid;
  reg                 _zz_plic_logic_bmb_rsp_valid_1;
  reg                 _zz_plic_logic_bmb_rsp_payload_last;
  reg        [0:0]    _zz_plic_logic_bmb_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_plic_logic_bmb_rsp_payload_fragment_data;
  wire                when_Stream_l372;
  wire                plic_logic_bus_askWrite;
  wire                plic_logic_bus_askRead;
  wire                plic_logic_bmb_cmd_fire;
  wire                plic_logic_bus_doWrite;
  wire                plic_logic_bus_doRead;
  wire                when_BmbSlaveFactory_l33;
  wire                when_BmbSlaveFactory_l35;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_0;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_1;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_2;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_3;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_4;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_5;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_6;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_7;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_8;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_9;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_10;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_11;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_12;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_13;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_14;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_15;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_16;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_17;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_18;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_19;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_20;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_21;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_22;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_23;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_24;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_25;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_26;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_27;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_28;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_29;
  wire                cores_0_cpu_externalInterrupt_plic_target_ie_30;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_threshold;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_0_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_0_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_0_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_1_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_1_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_1_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_2_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_2_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_2_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_3_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_3_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_3_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_4_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_4_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_4_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_5_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_5_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_5_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_6_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_6_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_6_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_7_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_7_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_7_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_8_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_8_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_8_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_9_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_9_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_9_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_10_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_10_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_10_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_11_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_11_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_11_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_12_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_12_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_12_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_13_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_13_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_13_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_14_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_14_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_14_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_15_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_15_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_15_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_16_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_16_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_16_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_17_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_17_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_17_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_18_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_18_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_18_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_19_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_19_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_19_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_20_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_20_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_20_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_21_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_21_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_21_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_22_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_22_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_22_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_23_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_23_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_23_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_24_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_24_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_24_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_25_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_25_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_25_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_26_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_26_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_26_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_27_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_27_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_27_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_28_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_28_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_28_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_29_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_29_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_29_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_30_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_30_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_30_valid;
  wire       [1:0]    cores_0_cpu_externalInterrupt_plic_target_requests_31_priority;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_requests_31_id;
  wire                cores_0_cpu_externalInterrupt_plic_target_requests_31_valid;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_1;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_2;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_3;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_4;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_5;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_6;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_7;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_8;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_9;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_10;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_11;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_12;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_13;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_14;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_15;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_16;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_17;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_18;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_19;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_20;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_21;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_22;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_23;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_24;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_25;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_26;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_27;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_28;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_29;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_30;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_31;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_32;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_33;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_34;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_35;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_36;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_37;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_38;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_39;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_40;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_41;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_42;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_43;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_44;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_45;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_46;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_47;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_48;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_49;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_50;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_51;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_52;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_53;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_54;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_55;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_56;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_57;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_58;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_59;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_60;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_61;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_62;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_63;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_64;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_65;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_66;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_67;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_68;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_69;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_70;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_71;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_72;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_73;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_74;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_1;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_75;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_76;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_2;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_77;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_78;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_3;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_79;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_80;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_4;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_81;
  wire       [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_5;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid_1;
  wire                _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_6;
  reg        [1:0]    cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority;
  reg        [4:0]    cores_0_cpu_externalInterrupt_plic_target_bestRequest_id;
  reg                 cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid;
  wire                cores_0_cpu_externalInterrupt_plic_target_iep;
  wire       [4:0]    cores_0_cpu_externalInterrupt_plic_target_claim;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_0;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_1;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_2;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_3;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_4;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_5;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_6;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_7;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_8;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_9;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_10;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_11;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_12;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_13;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_14;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_15;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_16;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_17;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_18;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_19;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_20;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_21;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_22;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_23;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_24;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_25;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_26;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_27;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_28;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_29;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_30;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_threshold;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_valid;
  wire       [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_priority;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_id;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_valid;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_1;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_2;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_3;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_4;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_5;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_6;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_7;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_8;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_9;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_10;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_11;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_12;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_13;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_14;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_15;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_16;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_17;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_18;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_19;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_20;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_21;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_22;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_23;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_24;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_25;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_26;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_27;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_28;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_29;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_30;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_31;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_32;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_33;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_34;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_35;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_36;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_37;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_38;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_39;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_40;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_41;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_42;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_43;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_44;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_45;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_46;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_47;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_48;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_49;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_50;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_51;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_52;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_53;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_54;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_55;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_56;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_57;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_58;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_59;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_60;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_61;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_62;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_63;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_64;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_65;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_66;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_67;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_68;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_69;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_70;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_71;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_72;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_73;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_74;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_1;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_75;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_76;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_2;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_77;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_78;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_3;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_79;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_80;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_4;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_81;
  wire       [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_5;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid_1;
  wire                _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_6;
  reg        [1:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority;
  reg        [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id;
  reg                 cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid;
  wire                cores_0_cpu_externalSupervisorInterrupt_plic_target_iep;
  wire       [4:0]    cores_0_cpu_externalSupervisorInterrupt_plic_target_claim;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_62;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_63;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_64;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_65;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_66;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_67;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_68;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_69;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_70;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_71;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_72;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_73;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_74;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_75;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_76;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_77;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_78;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_79;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_80;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_81;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_82;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_83;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_84;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_85;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_86;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_87;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_88;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_89;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_90;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_91;
  reg        [1:0]    _zz_plic_logic_bus_rsp_payload_fragment_data_92;
  reg                 plic_logic_bridge_claim_valid;
  reg        [4:0]    plic_logic_bridge_claim_payload;
  reg                 plic_logic_bridge_completion_valid;
  reg        [4:0]    plic_logic_bridge_completion_payload;
  reg                 plic_logic_bridge_coherencyStall_willIncrement;
  wire                plic_logic_bridge_coherencyStall_willClear;
  reg        [0:0]    plic_logic_bridge_coherencyStall_valueNext;
  reg        [0:0]    plic_logic_bridge_coherencyStall_value;
  wire                plic_logic_bridge_coherencyStall_willOverflowIfInc;
  wire                plic_logic_bridge_coherencyStall_willOverflow;
  wire                when_PlicMapper_l122;
  reg        [1:0]    _zz_cores_0_cpu_externalInterrupt_plic_target_threshold;
  reg                 plic_logic_bridge_targetMapping_0_targetCompletion_valid;
  wire       [4:0]    plic_logic_bridge_targetMapping_0_targetCompletion_payload;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_0;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_1;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_2;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_3;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_4;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_5;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_6;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_7;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_8;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_9;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_10;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_11;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_12;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_13;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_14;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_15;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_16;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_17;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_18;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_19;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_20;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_21;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_22;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_23;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_24;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_25;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_26;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_27;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_28;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_29;
  reg                 _zz_cores_0_cpu_externalInterrupt_plic_target_ie_30;
  reg        [1:0]    _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_threshold;
  reg                 plic_logic_bridge_targetMapping_1_targetCompletion_valid;
  wire       [4:0]    plic_logic_bridge_targetMapping_1_targetCompletion_payload;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_0;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_1;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_2;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_3;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_4;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_5;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_6;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_7;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_8;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_9;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_10;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_11;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_12;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_13;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_14;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_15;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_16;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_17;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_18;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_19;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_20;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_21;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_22;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_23;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_24;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_25;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_26;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_27;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_28;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_29;
  reg                 _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_30;
  reg                 cores_0_cpu_externalInterrupt_plic_target_iep_regNext;
  reg                 cores_0_cpu_externalSupervisorInterrupt_plic_target_iep_regNext;
  wire                cores_0_cpu_dBus_connector_decoder_cmd_valid;
  wire                cores_0_cpu_dBus_connector_decoder_cmd_ready;
  wire                cores_0_cpu_dBus_connector_decoder_cmd_payload_last;
  wire       [0:0]    cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_address;
  wire       [5:0]    cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_length;
  wire       [31:0]   cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_data;
  wire       [3:0]    cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_mask;
  wire       [0:0]    cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_context;
  wire                cores_0_cpu_dBus_connector_decoder_rsp_valid;
  wire                cores_0_cpu_dBus_connector_decoder_rsp_ready;
  wire                cores_0_cpu_dBus_connector_decoder_rsp_payload_last;
  wire       [0:0]    cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_data;
  wire       [0:0]    cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_context;
  reg                 _zz_cores_0_cpu_dBus_connector_decoder_rsp_ready;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_valid;
  reg                 toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_ready;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_last;
  wire       [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_address;
  wire       [5:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_length;
  wire       [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_data;
  wire       [3:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_mask;
  wire       [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_context;
  reg                 toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN;
  reg                 toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_last;
  reg        [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_opcode;
  reg        [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_address;
  reg        [5:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_length;
  reg        [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_data;
  reg        [3:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_mask;
  reg        [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_context;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_valid;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_ready;
  wire                toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  wire       [5:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  wire       [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  wire       [3:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  wire       [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  reg                 toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rValid;
  reg                 toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_last;
  reg        [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_address;
  reg        [5:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_length;
  reg        [31:0]   toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_data;
  reg        [3:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_mask;
  reg        [0:0]    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_context;
  wire                when_Stream_l372_1;
  wire                _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid;
  reg                 _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid_1;
  reg                 _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_last;
  reg        [0:0]    _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_data;
  reg        [0:0]    _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_context;
  wire                when_Stream_l372_2;
  wire                cores_0_cpu_iBus_connector_decoder_cmd_valid;
  wire                cores_0_cpu_iBus_connector_decoder_cmd_ready;
  wire                cores_0_cpu_iBus_connector_decoder_cmd_payload_last;
  wire       [0:0]    cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_address;
  wire       [5:0]    cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_length;
  wire                cores_0_cpu_iBus_connector_decoder_rsp_valid;
  wire                cores_0_cpu_iBus_connector_decoder_rsp_ready;
  wire                cores_0_cpu_iBus_connector_decoder_rsp_payload_last;
  wire       [0:0]    cores_0_cpu_iBus_connector_decoder_rsp_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_iBus_connector_decoder_rsp_payload_fragment_data;
  reg                 _zz_cores_0_cpu_iBus_connector_decoder_rsp_ready;
  wire                cores_0_cpu_iBus_cmd_halfPipe_valid;
  wire                cores_0_cpu_iBus_cmd_halfPipe_ready;
  wire                cores_0_cpu_iBus_cmd_halfPipe_payload_last;
  wire       [0:0]    cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_address;
  wire       [5:0]    cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_length;
  reg                 cores_0_cpu_iBus_cmd_rValid;
  wire                cores_0_cpu_iBus_cmd_halfPipe_fire;
  reg                 cores_0_cpu_iBus_cmd_rData_last;
  reg        [0:0]    cores_0_cpu_iBus_cmd_rData_fragment_opcode;
  reg        [31:0]   cores_0_cpu_iBus_cmd_rData_fragment_address;
  reg        [5:0]    cores_0_cpu_iBus_cmd_rData_fragment_length;
  wire                _zz_cores_0_cpu_iBus_rsp_valid;
  reg                 _zz_cores_0_cpu_iBus_rsp_valid_1;
  reg                 _zz_cores_0_cpu_iBus_rsp_payload_last;
  reg        [0:0]    _zz_cores_0_cpu_iBus_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_cores_0_cpu_iBus_rsp_payload_fragment_data;
  wire                when_Stream_l372_3;
  wire                dBusCoherent_bmb_cmd_valid;
  wire                dBusCoherent_bmb_cmd_ready;
  wire                dBusCoherent_bmb_cmd_payload_last;
  wire       [0:0]    dBusCoherent_bmb_cmd_payload_fragment_opcode;
  wire       [31:0]   dBusCoherent_bmb_cmd_payload_fragment_address;
  wire       [5:0]    dBusCoherent_bmb_cmd_payload_fragment_length;
  wire       [31:0]   dBusCoherent_bmb_cmd_payload_fragment_data;
  wire       [3:0]    dBusCoherent_bmb_cmd_payload_fragment_mask;
  wire       [0:0]    dBusCoherent_bmb_cmd_payload_fragment_context;
  wire                dBusCoherent_bmb_rsp_valid;
  wire                dBusCoherent_bmb_rsp_ready;
  wire                dBusCoherent_bmb_rsp_payload_last;
  wire       [0:0]    dBusCoherent_bmb_rsp_payload_fragment_opcode;
  wire       [31:0]   dBusCoherent_bmb_rsp_payload_fragment_data;
  wire       [0:0]    dBusCoherent_bmb_rsp_payload_fragment_context;
  wire                cores_0_cpu_debugBmb_cmd_valid;
  wire                cores_0_cpu_debugBmb_cmd_ready;
  wire                cores_0_cpu_debugBmb_cmd_payload_last;
  wire       [0:0]    cores_0_cpu_debugBmb_cmd_payload_fragment_opcode;
  wire       [7:0]    cores_0_cpu_debugBmb_cmd_payload_fragment_address;
  wire       [1:0]    cores_0_cpu_debugBmb_cmd_payload_fragment_length;
  wire       [31:0]   cores_0_cpu_debugBmb_cmd_payload_fragment_data;
  wire       [3:0]    cores_0_cpu_debugBmb_cmd_payload_fragment_mask;
  wire                cores_0_cpu_debugBmb_rsp_valid;
  wire                cores_0_cpu_debugBmb_rsp_ready;
  wire                cores_0_cpu_debugBmb_rsp_payload_last;
  wire       [0:0]    cores_0_cpu_debugBmb_rsp_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_debugBmb_rsp_payload_fragment_data;
  wire                iArbiter_bmb_cmd_valid;
  wire                iArbiter_bmb_cmd_ready;
  wire                iArbiter_bmb_cmd_payload_last;
  wire       [0:0]    iArbiter_bmb_cmd_payload_fragment_opcode;
  wire       [31:0]   iArbiter_bmb_cmd_payload_fragment_address;
  wire       [5:0]    iArbiter_bmb_cmd_payload_fragment_length;
  wire                iArbiter_bmb_rsp_valid;
  wire                iArbiter_bmb_rsp_ready;
  wire                iArbiter_bmb_rsp_payload_last;
  wire       [0:0]    iArbiter_bmb_rsp_payload_fragment_opcode;
  wire       [31:0]   iArbiter_bmb_rsp_payload_fragment_data;
  wire                dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [31:0]   dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [5:0]    dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [3:0]    dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  wire       [0:0]    dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [0:0]    dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  wire                cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [7:0]    cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [1:0]    cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [3:0]    cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  wire                cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire                toplevel_cores_0_cpu_logic_cpu_debug_bus_cmd_fire;
  reg                 toplevel_cores_0_cpu_logic_cpu_debug_bus_cmd_fire_regNext;
  wire                iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [31:0]   iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [5:0]    iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire                iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire                dBusCoherent_bmb_connector_decoder_cmd_valid;
  wire                dBusCoherent_bmb_connector_decoder_cmd_ready;
  wire                dBusCoherent_bmb_connector_decoder_cmd_payload_last;
  wire       [0:0]    dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_opcode;
  wire       [31:0]   dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_address;
  wire       [5:0]    dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_length;
  wire       [31:0]   dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_data;
  wire       [3:0]    dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_mask;
  wire       [0:0]    dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_context;
  wire                dBusCoherent_bmb_connector_decoder_rsp_valid;
  wire                dBusCoherent_bmb_connector_decoder_rsp_ready;
  wire                dBusCoherent_bmb_connector_decoder_rsp_payload_last;
  wire       [0:0]    dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_opcode;
  wire       [31:0]   dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_data;
  wire       [0:0]    dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_context;
  wire                dBusCoherent_bmb_cmd_s2mPipe_valid;
  reg                 dBusCoherent_bmb_cmd_s2mPipe_ready;
  wire                dBusCoherent_bmb_cmd_s2mPipe_payload_last;
  wire       [0:0]    dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_address;
  wire       [5:0]    dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_length;
  wire       [31:0]   dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_data;
  wire       [3:0]    dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_mask;
  wire       [0:0]    dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_context;
  reg                 dBusCoherent_bmb_cmd_rValidN;
  reg                 dBusCoherent_bmb_cmd_rData_last;
  reg        [0:0]    dBusCoherent_bmb_cmd_rData_fragment_opcode;
  reg        [31:0]   dBusCoherent_bmb_cmd_rData_fragment_address;
  reg        [5:0]    dBusCoherent_bmb_cmd_rData_fragment_length;
  reg        [31:0]   dBusCoherent_bmb_cmd_rData_fragment_data;
  reg        [3:0]    dBusCoherent_bmb_cmd_rData_fragment_mask;
  reg        [0:0]    dBusCoherent_bmb_cmd_rData_fragment_context;
  wire                dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_valid;
  wire                dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_ready;
  wire                dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  wire       [5:0]    dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  wire       [31:0]   dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  wire       [3:0]    dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  wire       [0:0]    dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  reg                 dBusCoherent_bmb_cmd_s2mPipe_rValid;
  reg                 dBusCoherent_bmb_cmd_s2mPipe_rData_last;
  reg        [0:0]    dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_address;
  reg        [5:0]    dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_length;
  reg        [31:0]   dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_data;
  reg        [3:0]    dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_mask;
  reg        [0:0]    dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_context;
  wire                when_Stream_l372_4;
  wire                dBusNonCoherent_bmb_cmd_valid;
  wire                dBusNonCoherent_bmb_cmd_ready;
  wire                dBusNonCoherent_bmb_cmd_payload_last;
  wire       [0:0]    dBusNonCoherent_bmb_cmd_payload_fragment_opcode;
  wire       [31:0]   dBusNonCoherent_bmb_cmd_payload_fragment_address;
  wire       [5:0]    dBusNonCoherent_bmb_cmd_payload_fragment_length;
  wire       [31:0]   dBusNonCoherent_bmb_cmd_payload_fragment_data;
  wire       [3:0]    dBusNonCoherent_bmb_cmd_payload_fragment_mask;
  wire       [0:0]    dBusNonCoherent_bmb_cmd_payload_fragment_context;
  wire                dBusNonCoherent_bmb_rsp_valid;
  wire                dBusNonCoherent_bmb_rsp_ready;
  wire                dBusNonCoherent_bmb_rsp_payload_last;
  wire       [0:0]    dBusNonCoherent_bmb_rsp_payload_fragment_opcode;
  wire       [31:0]   dBusNonCoherent_bmb_rsp_payload_fragment_data;
  wire       [0:0]    dBusNonCoherent_bmb_rsp_payload_fragment_context;
  wire                dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  wire                dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  wire                dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  wire       [0:0]    dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  wire       [31:0]   dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  wire       [5:0]    dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  wire       [31:0]   dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  wire       [3:0]    dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  wire       [0:0]    dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  wire                dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  wire                dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  wire                dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  wire       [0:0]    dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  wire       [31:0]   dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  wire       [0:0]    dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  reg                 _zz_io_input_rsp_ready;
  wire                iArbiter_bmb_cmd_halfPipe_valid;
  wire                iArbiter_bmb_cmd_halfPipe_ready;
  wire                iArbiter_bmb_cmd_halfPipe_payload_last;
  wire       [0:0]    iArbiter_bmb_cmd_halfPipe_payload_fragment_opcode;
  wire       [31:0]   iArbiter_bmb_cmd_halfPipe_payload_fragment_address;
  wire       [5:0]    iArbiter_bmb_cmd_halfPipe_payload_fragment_length;
  reg                 iArbiter_bmb_cmd_rValid;
  wire                iArbiter_bmb_cmd_halfPipe_fire;
  reg                 iArbiter_bmb_cmd_rData_last;
  reg        [0:0]    iArbiter_bmb_cmd_rData_fragment_opcode;
  reg        [31:0]   iArbiter_bmb_cmd_rData_fragment_address;
  reg        [5:0]    iArbiter_bmb_cmd_rData_fragment_length;
  wire                _zz_iArbiter_bmb_rsp_valid;
  reg                 _zz_iArbiter_bmb_rsp_valid_1;
  reg                 _zz_iArbiter_bmb_rsp_payload_last;
  reg        [0:0]    _zz_iArbiter_bmb_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_iArbiter_bmb_rsp_payload_fragment_data;
  wire                when_Stream_l372_5;
  wire                peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_valid;
  wire                peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_ready;
  wire                peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_last;
  wire       [0:0]    peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_opcode;
  wire       [31:0]   peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_address;
  wire       [5:0]    peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_length;
  wire       [31:0]   peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_data;
  wire       [3:0]    peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_mask;
  wire       [0:0]    peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_context;
  wire                peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_valid;
  wire                peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready;
  wire                peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_last;
  wire       [0:0]    peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_opcode;
  wire       [31:0]   peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_data;
  wire       [0:0]    peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_context;
  reg                 _zz_peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready;
  wire                dBusNonCoherent_bmb_cmd_s2mPipe_valid;
  reg                 dBusNonCoherent_bmb_cmd_s2mPipe_ready;
  wire                dBusNonCoherent_bmb_cmd_s2mPipe_payload_last;
  wire       [0:0]    dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_address;
  wire       [5:0]    dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_length;
  wire       [31:0]   dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_data;
  wire       [3:0]    dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_mask;
  wire       [0:0]    dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_context;
  reg                 dBusNonCoherent_bmb_cmd_rValidN;
  reg                 dBusNonCoherent_bmb_cmd_rData_last;
  reg        [0:0]    dBusNonCoherent_bmb_cmd_rData_fragment_opcode;
  reg        [31:0]   dBusNonCoherent_bmb_cmd_rData_fragment_address;
  reg        [5:0]    dBusNonCoherent_bmb_cmd_rData_fragment_length;
  reg        [31:0]   dBusNonCoherent_bmb_cmd_rData_fragment_data;
  reg        [3:0]    dBusNonCoherent_bmb_cmd_rData_fragment_mask;
  reg        [0:0]    dBusNonCoherent_bmb_cmd_rData_fragment_context;
  wire                dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_valid;
  wire                dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_ready;
  wire                dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  wire       [5:0]    dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  wire       [31:0]   dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  wire       [3:0]    dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  wire       [0:0]    dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  reg                 dBusNonCoherent_bmb_cmd_s2mPipe_rValid;
  reg                 dBusNonCoherent_bmb_cmd_s2mPipe_rData_last;
  reg        [0:0]    dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_address;
  reg        [5:0]    dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_length;
  reg        [31:0]   dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_data;
  reg        [3:0]    dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_mask;
  reg        [0:0]    dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_context;
  wire                when_Stream_l372_6;
  wire                _zz_dBusNonCoherent_bmb_rsp_valid;
  reg                 _zz_dBusNonCoherent_bmb_rsp_valid_1;
  reg                 _zz_dBusNonCoherent_bmb_rsp_payload_last;
  reg        [0:0]    _zz_dBusNonCoherent_bmb_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_dBusNonCoherent_bmb_rsp_payload_fragment_data;
  reg        [0:0]    _zz_dBusNonCoherent_bmb_rsp_payload_fragment_context;
  wire                when_Stream_l372_7;
  reg                 _zz_io_input_rsp_ready_1;
  wire                toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_valid;
  reg                 toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_ready;
  wire                toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_last;
  wire       [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_source;
  wire       [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_address;
  wire       [5:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_length;
  wire       [31:0]   toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_data;
  wire       [3:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_mask;
  wire       [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_context;
  reg                 toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN;
  reg                 toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_last;
  reg        [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_source;
  reg        [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_opcode;
  reg        [31:0]   toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_address;
  reg        [5:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_length;
  reg        [31:0]   toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_data;
  reg        [3:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_mask;
  reg        [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_context;
  wire                toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_valid;
  wire                toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_ready;
  wire                toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_source;
  wire       [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  wire       [5:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  wire       [31:0]   toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  wire       [3:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  wire       [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  reg                 toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rValid;
  reg                 toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_last;
  reg        [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_source;
  reg        [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_address;
  reg        [5:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_length;
  reg        [31:0]   toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_data;
  reg        [3:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_mask;
  reg        [0:0]    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_context;
  wire                when_Stream_l372_8;
  wire                _zz_when_Stream_l372;
  reg                 _zz_when_Stream_l372_1;
  reg                 _zz_io_output_rsp_payload_last;
  reg        [0:0]    _zz_io_output_rsp_payload_fragment_source;
  reg        [0:0]    _zz_io_output_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_io_output_rsp_payload_fragment_data;
  reg        [0:0]    _zz_io_output_rsp_payload_fragment_context;
  wire                when_Stream_l372_9;
  wire                when_BusSlaveFactory_l1041;
  wire                when_BusSlaveFactory_l1041_1;
  wire                when_BusSlaveFactory_l1041_2;
  wire                when_BusSlaveFactory_l1041_3;
  wire                when_BusSlaveFactory_l1041_4;
  wire                when_BusSlaveFactory_l1041_5;
  wire                when_BusSlaveFactory_l1041_6;
  wire                when_BusSlaveFactory_l1041_7;
  wire                when_BusSlaveFactory_l1041_8;
  wire                when_BusSlaveFactory_l1041_9;
  wire                when_BusSlaveFactory_l1041_10;
  wire                when_BusSlaveFactory_l1041_11;
  wire                when_BusSlaveFactory_l1041_12;
  wire                when_BusSlaveFactory_l1041_13;
  wire                when_BusSlaveFactory_l1041_14;
  wire                when_BusSlaveFactory_l1041_15;
  wire                when_BusSlaveFactory_l1041_16;
  wire                when_BusSlaveFactory_l1041_17;
  wire                when_BusSlaveFactory_l1041_18;
  wire                when_BusSlaveFactory_l1041_19;
  wire                when_BusSlaveFactory_l1041_20;
  wire                when_BusSlaveFactory_l1041_21;
  wire                when_BusSlaveFactory_l1041_22;
  wire                when_BusSlaveFactory_l1041_23;
  wire                when_BusSlaveFactory_l1041_24;
  wire                when_BusSlaveFactory_l1041_25;
  wire                when_BusSlaveFactory_l1041_26;
  wire                when_BusSlaveFactory_l1041_27;
  wire                when_BusSlaveFactory_l1041_28;
  wire                when_BusSlaveFactory_l1041_29;
  wire                when_BusSlaveFactory_l1041_30;
  wire                when_BusSlaveFactory_l1041_31;
  wire                when_BusSlaveFactory_l1041_32;
  wire                when_BusSlaveFactory_l1041_33;
  wire                when_BusSlaveFactory_l1041_34;
  wire                when_BusSlaveFactory_l1041_35;
  wire                when_BusSlaveFactory_l1041_36;
  wire                when_BusSlaveFactory_l1041_37;
  wire                when_BusSlaveFactory_l1041_38;
  wire                when_BusSlaveFactory_l1041_39;
  wire                when_BusSlaveFactory_l1041_40;
  wire                when_BusSlaveFactory_l1041_41;
  wire                when_BusSlaveFactory_l1041_42;
  wire                when_BusSlaveFactory_l1041_43;
  wire                when_BusSlaveFactory_l1041_44;
  wire                when_BusSlaveFactory_l1041_45;
  wire                when_BusSlaveFactory_l1041_46;
  wire                when_BusSlaveFactory_l1041_47;
  wire                when_BusSlaveFactory_l1041_48;
  wire                when_BusSlaveFactory_l1041_49;
  wire                when_BusSlaveFactory_l1041_50;
  wire                when_BusSlaveFactory_l1041_51;
  wire                when_BusSlaveFactory_l1041_52;
  wire                when_BusSlaveFactory_l1041_53;
  wire                when_BusSlaveFactory_l1041_54;
  wire                when_BusSlaveFactory_l1041_55;
  wire                when_BusSlaveFactory_l1041_56;
  wire                when_BusSlaveFactory_l1041_57;
  wire                when_BusSlaveFactory_l1041_58;
  wire                when_BusSlaveFactory_l1041_59;
  wire                when_BusSlaveFactory_l1041_60;
  wire                when_BusSlaveFactory_l1041_61;
  wire                when_BusSlaveFactory_l1041_62;
  wire                when_BusSlaveFactory_l1041_63;
  wire                when_BusSlaveFactory_l1041_64;
  wire                when_BusSlaveFactory_l1041_65;
  wire                when_BusSlaveFactory_l1041_66;
  wire                when_BusSlaveFactory_l1041_67;
  wire                when_BusSlaveFactory_l1041_68;
  wire                when_BusSlaveFactory_l1041_69;
  wire                when_BusSlaveFactory_l1041_70;
  wire                when_BusSlaveFactory_l1041_71;
  wire                when_BusSlaveFactory_l1041_72;
  wire                when_BusSlaveFactory_l1041_73;
  wire                when_BusSlaveFactory_l1041_74;
  wire                when_BusSlaveFactory_l1041_75;
  wire                when_BusSlaveFactory_l1041_76;
  wire                when_BusSlaveFactory_l1041_77;
  wire                when_BusSlaveFactory_l1041_78;
  wire                when_BusSlaveFactory_l1041_79;
  wire                when_BusSlaveFactory_l1041_80;
  wire                when_BusSlaveFactory_l1041_81;
  wire                when_BusSlaveFactory_l1041_82;
  wire                when_BusSlaveFactory_l1041_83;
  wire                when_BusSlaveFactory_l1041_84;
  wire                when_BusSlaveFactory_l1041_85;
  wire                when_BusSlaveFactory_l1041_86;
  wire                when_BusSlaveFactory_l1041_87;
  wire                when_BusSlaveFactory_l1041_88;
  wire                when_BusSlaveFactory_l1041_89;
  wire                when_BusSlaveFactory_l1041_90;
  wire                when_BusSlaveFactory_l1041_91;
  wire                when_BusSlaveFactory_l1041_92;
  wire                when_BusSlaveFactory_l1041_93;
  wire                when_BusSlaveFactory_l1041_94;
  wire                when_BmbSlaveFactory_l77;

  assign _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_address = (customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_address >>> 2'd2);
  assign _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask_1 = ({3'd0,_zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask} <<< customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_address[1 : 0]);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_82 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id ? cores_0_cpu_externalInterrupt_plic_target_requests_0_id : cores_0_cpu_externalInterrupt_plic_target_requests_1_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_83 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_3 ? cores_0_cpu_externalInterrupt_plic_target_requests_2_id : cores_0_cpu_externalInterrupt_plic_target_requests_3_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_84 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_6 ? cores_0_cpu_externalInterrupt_plic_target_requests_4_id : cores_0_cpu_externalInterrupt_plic_target_requests_5_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_85 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_9 ? cores_0_cpu_externalInterrupt_plic_target_requests_6_id : cores_0_cpu_externalInterrupt_plic_target_requests_7_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_86 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_12 ? cores_0_cpu_externalInterrupt_plic_target_requests_8_id : cores_0_cpu_externalInterrupt_plic_target_requests_9_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_87 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_15 ? cores_0_cpu_externalInterrupt_plic_target_requests_10_id : cores_0_cpu_externalInterrupt_plic_target_requests_11_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_88 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_18 ? cores_0_cpu_externalInterrupt_plic_target_requests_12_id : cores_0_cpu_externalInterrupt_plic_target_requests_13_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_89 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_21 ? cores_0_cpu_externalInterrupt_plic_target_requests_14_id : cores_0_cpu_externalInterrupt_plic_target_requests_15_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_90 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_24 ? cores_0_cpu_externalInterrupt_plic_target_requests_16_id : cores_0_cpu_externalInterrupt_plic_target_requests_17_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_91 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_27 ? cores_0_cpu_externalInterrupt_plic_target_requests_18_id : cores_0_cpu_externalInterrupt_plic_target_requests_19_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_92 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_30 ? cores_0_cpu_externalInterrupt_plic_target_requests_20_id : cores_0_cpu_externalInterrupt_plic_target_requests_21_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_93 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_33 ? cores_0_cpu_externalInterrupt_plic_target_requests_22_id : cores_0_cpu_externalInterrupt_plic_target_requests_23_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_94 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_36 ? cores_0_cpu_externalInterrupt_plic_target_requests_24_id : cores_0_cpu_externalInterrupt_plic_target_requests_25_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_95 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_39 ? cores_0_cpu_externalInterrupt_plic_target_requests_26_id : cores_0_cpu_externalInterrupt_plic_target_requests_27_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_96 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_42 ? cores_0_cpu_externalInterrupt_plic_target_requests_28_id : cores_0_cpu_externalInterrupt_plic_target_requests_29_id);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_97 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_45 ? cores_0_cpu_externalInterrupt_plic_target_requests_30_id : cores_0_cpu_externalInterrupt_plic_target_requests_31_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_82 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_83 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_3 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_84 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_6 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_85 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_9 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_86 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_12 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_87 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_15 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_88 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_18 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_89 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_21 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_90 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_24 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_91 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_27 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_92 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_30 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_93 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_33 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_94 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_36 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_95 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_39 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_96 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_42 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_id);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_97 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_45 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_id : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_id);
  BufferCC bufferCC_4 (
    .io_dataIn              (bufferCC_4_io_dataIn  ), //i
    .io_dataOut             (bufferCC_4_io_dataOut ), //o
    .debugCd_external_clk   (debugCd_external_clk  ), //i
    .debugCd_external_reset (debugCd_external_reset)  //i
  );
  BufferCC_1 bufferCC_5 (
    .io_dataIn                 (bufferCC_5_io_dataIn     ), //i
    .io_dataOut                (bufferCC_5_io_dataOut    ), //o
    .debugCd_external_clk      (debugCd_external_clk     ), //i
    .debugCd_logic_outputReset (debugCd_logic_outputReset)  //i
  );
  JtagBridgeNoTap customDebug_debugBridge_logic_jtagBridge (
    .io_ctrl_tdi                    (debugPort_tdi                                                          ), //i
    .io_ctrl_enable                 (debugPort_enable                                                       ), //i
    .io_ctrl_capture                (debugPort_capture                                                      ), //i
    .io_ctrl_shift                  (debugPort_shift                                                        ), //i
    .io_ctrl_update                 (debugPort_update                                                       ), //i
    .io_ctrl_reset                  (debugPort_reset                                                        ), //i
    .io_ctrl_tdo                    (customDebug_debugBridge_logic_jtagBridge_io_ctrl_tdo                   ), //o
    .io_remote_cmd_valid            (customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_valid           ), //o
    .io_remote_cmd_ready            (customDebug_debugBridge_logic_debugger_io_remote_cmd_ready             ), //i
    .io_remote_cmd_payload_last     (customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_payload_last    ), //o
    .io_remote_cmd_payload_fragment (customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_payload_fragment), //o
    .io_remote_rsp_valid            (customDebug_debugBridge_logic_debugger_io_remote_rsp_valid             ), //i
    .io_remote_rsp_ready            (customDebug_debugBridge_logic_jtagBridge_io_remote_rsp_ready           ), //o
    .io_remote_rsp_payload_error    (customDebug_debugBridge_logic_debugger_io_remote_rsp_payload_error     ), //i
    .io_remote_rsp_payload_data     (customDebug_debugBridge_logic_debugger_io_remote_rsp_payload_data[31:0]), //i
    .debugCd_external_clk           (debugCd_external_clk                                                   ), //i
    .debugCd_logic_outputReset      (debugCd_logic_outputReset                                              ), //i
    .jtag_clk                       (jtag_clk                                                               )  //i
  );
  SystemDebugger customDebug_debugBridge_logic_debugger (
    .io_remote_cmd_valid            (customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_valid           ), //i
    .io_remote_cmd_ready            (customDebug_debugBridge_logic_debugger_io_remote_cmd_ready             ), //o
    .io_remote_cmd_payload_last     (customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_payload_last    ), //i
    .io_remote_cmd_payload_fragment (customDebug_debugBridge_logic_jtagBridge_io_remote_cmd_payload_fragment), //i
    .io_remote_rsp_valid            (customDebug_debugBridge_logic_debugger_io_remote_rsp_valid             ), //o
    .io_remote_rsp_ready            (customDebug_debugBridge_logic_jtagBridge_io_remote_rsp_ready           ), //i
    .io_remote_rsp_payload_error    (customDebug_debugBridge_logic_debugger_io_remote_rsp_payload_error     ), //o
    .io_remote_rsp_payload_data     (customDebug_debugBridge_logic_debugger_io_remote_rsp_payload_data[31:0]), //o
    .io_mem_cmd_valid               (customDebug_debugBridge_logic_debugger_io_mem_cmd_valid                ), //o
    .io_mem_cmd_ready               (customDebug_debugBridge_logic_mmMaster_cmd_ready                       ), //i
    .io_mem_cmd_payload_address     (customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_address[31:0]), //o
    .io_mem_cmd_payload_data        (customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_data[31:0]   ), //o
    .io_mem_cmd_payload_wr          (customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_wr           ), //o
    .io_mem_cmd_payload_size        (customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_size[1:0]    ), //o
    .io_mem_rsp_valid               (customDebug_debugBridge_logic_mmMaster_rsp_valid                       ), //i
    .io_mem_rsp_payload             (customDebug_debugBridge_logic_mmMaster_rsp_payload_fragment_data[31:0] ), //i
    .debugCd_external_clk           (debugCd_external_clk                                                   ), //i
    .debugCd_logic_outputReset      (debugCd_logic_outputReset                                              )  //i
  );
  BmbClint clint_logic (
    .io_bus_cmd_valid                    (clintWishboneBridge_logic_bridge_io_output_cmd_valid                         ), //i
    .io_bus_cmd_ready                    (clint_logic_io_bus_cmd_ready                                                 ), //o
    .io_bus_cmd_payload_last             (clintWishboneBridge_logic_bridge_io_output_cmd_payload_last                  ), //i
    .io_bus_cmd_payload_fragment_opcode  (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_opcode       ), //i
    .io_bus_cmd_payload_fragment_address (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_address[15:0]), //i
    .io_bus_cmd_payload_fragment_length  (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_length[1:0]  ), //i
    .io_bus_cmd_payload_fragment_data    (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_data[31:0]   ), //i
    .io_bus_cmd_payload_fragment_mask    (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_mask[3:0]    ), //i
    .io_bus_rsp_valid                    (clint_logic_io_bus_rsp_valid                                                 ), //o
    .io_bus_rsp_ready                    (clintWishboneBridge_logic_bridge_io_output_rsp_ready                         ), //i
    .io_bus_rsp_payload_last             (clint_logic_io_bus_rsp_payload_last                                          ), //o
    .io_bus_rsp_payload_fragment_opcode  (clint_logic_io_bus_rsp_payload_fragment_opcode                               ), //o
    .io_bus_rsp_payload_fragment_data    (clint_logic_io_bus_rsp_payload_fragment_data[31:0]                           ), //o
    .io_timerInterrupt                   (clint_logic_io_timerInterrupt                                                ), //o
    .io_softwareInterrupt                (clint_logic_io_softwareInterrupt                                             ), //o
    .io_time                             (clint_logic_io_time[63:0]                                                    ), //o
    .io_stop                             (clint_logic_io_stop                                                          ), //i
    .debugCd_external_clk                (debugCd_external_clk                                                         ), //i
    .systemCd_logic_outputReset          (systemCd_logic_outputReset                                                   )  //i
  );
  VexRiscv cores_0_cpu_logic_cpu (
    .dBus_cmd_valid                (cores_0_cpu_logic_cpu_dBus_cmd_valid                                          ), //o
    .dBus_cmd_ready                (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_ready                      ), //i
    .dBus_cmd_payload_wr           (cores_0_cpu_logic_cpu_dBus_cmd_payload_wr                                     ), //o
    .dBus_cmd_payload_uncached     (cores_0_cpu_logic_cpu_dBus_cmd_payload_uncached                               ), //o
    .dBus_cmd_payload_address      (cores_0_cpu_logic_cpu_dBus_cmd_payload_address[31:0]                          ), //o
    .dBus_cmd_payload_data         (cores_0_cpu_logic_cpu_dBus_cmd_payload_data[31:0]                             ), //o
    .dBus_cmd_payload_mask         (cores_0_cpu_logic_cpu_dBus_cmd_payload_mask[3:0]                              ), //o
    .dBus_cmd_payload_size         (cores_0_cpu_logic_cpu_dBus_cmd_payload_size[2:0]                              ), //o
    .dBus_cmd_payload_last         (cores_0_cpu_logic_cpu_dBus_cmd_payload_last                                   ), //o
    .dBus_rsp_valid                (cores_0_cpu_logic_cpu_dBus_rsp_valid                                          ), //i
    .dBus_rsp_payload_last         (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_last               ), //i
    .dBus_rsp_payload_data         (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_data[31:0]), //i
    .dBus_rsp_payload_error        (cores_0_cpu_logic_cpu_dBus_rsp_payload_error                                  ), //i
    .timerInterrupt                (cores_0_cpu_logic_cpu_timerInterrupt                                          ), //i
    .externalInterrupt             (cores_0_cpu_externalInterrupt_plic_target_iep_regNext                         ), //i
    .softwareInterrupt             (cores_0_cpu_logic_cpu_softwareInterrupt                                       ), //i
    .externalInterruptS            (cores_0_cpu_externalSupervisorInterrupt_plic_target_iep_regNext               ), //i
    .utime                         (clint_logic_io_time[63:0]                                                     ), //i
    .debug_bus_cmd_valid           (cores_0_cpu_debugBmb_cmd_valid                                                ), //i
    .debug_bus_cmd_ready           (cores_0_cpu_logic_cpu_debug_bus_cmd_ready                                     ), //o
    .debug_bus_cmd_payload_wr      (cores_0_cpu_logic_cpu_debug_bus_cmd_payload_wr                                ), //i
    .debug_bus_cmd_payload_address (cores_0_cpu_debugBmb_cmd_payload_fragment_address[7:0]                        ), //i
    .debug_bus_cmd_payload_data    (cores_0_cpu_debugBmb_cmd_payload_fragment_data[31:0]                          ), //i
    .debug_bus_rsp_data            (cores_0_cpu_logic_cpu_debug_bus_rsp_data[31:0]                                ), //o
    .debug_resetOut                (cores_0_cpu_logic_cpu_debug_resetOut                                          ), //o
    .iBus_cmd_valid                (cores_0_cpu_logic_cpu_iBus_cmd_valid                                          ), //o
    .iBus_cmd_ready                (cores_0_cpu_iBus_cmd_ready                                                    ), //i
    .iBus_cmd_payload_address      (cores_0_cpu_logic_cpu_iBus_cmd_payload_address[31:0]                          ), //o
    .iBus_cmd_payload_size         (cores_0_cpu_logic_cpu_iBus_cmd_payload_size[2:0]                              ), //o
    .iBus_rsp_valid                (cores_0_cpu_iBus_rsp_valid                                                    ), //i
    .iBus_rsp_payload_data         (cores_0_cpu_iBus_rsp_payload_fragment_data[31:0]                              ), //i
    .iBus_rsp_payload_error        (cores_0_cpu_logic_cpu_iBus_rsp_payload_error                                  ), //i
    .debugCd_external_clk          (debugCd_external_clk                                                          ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                                                    ), //i
    .debugCd_logic_outputReset     (debugCd_logic_outputReset                                                     )  //i
  );
  BufferCC_2 bufferCC_6 (
    .io_dataIn              (bufferCC_6_io_dataIn  ), //i
    .io_dataOut             (bufferCC_6_io_dataOut ), //o
    .debugCd_external_clk   (debugCd_external_clk  ), //i
    .cores_0_cpu_debugReset (cores_0_cpu_debugReset)  //i
  );
  WishboneToBmb clintWishboneBridge_logic_bridge (
    .io_input_CYC                           (clintWishbone_CYC                                                            ), //i
    .io_input_STB                           (clintWishbone_STB                                                            ), //i
    .io_input_ACK                           (clintWishboneBridge_logic_bridge_io_input_ACK                                ), //o
    .io_input_WE                            (clintWishbone_WE                                                             ), //i
    .io_input_ADR                           (clintWishbone_ADR[13:0]                                                      ), //i
    .io_input_DAT_MISO                      (clintWishboneBridge_logic_bridge_io_input_DAT_MISO[31:0]                     ), //o
    .io_input_DAT_MOSI                      (clintWishbone_DAT_MOSI[31:0]                                                 ), //i
    .io_output_cmd_valid                    (clintWishboneBridge_logic_bridge_io_output_cmd_valid                         ), //o
    .io_output_cmd_ready                    (clint_logic_io_bus_cmd_ready                                                 ), //i
    .io_output_cmd_payload_last             (clintWishboneBridge_logic_bridge_io_output_cmd_payload_last                  ), //o
    .io_output_cmd_payload_fragment_opcode  (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_opcode       ), //o
    .io_output_cmd_payload_fragment_address (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_address[15:0]), //o
    .io_output_cmd_payload_fragment_length  (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_length[1:0]  ), //o
    .io_output_cmd_payload_fragment_data    (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_data[31:0]   ), //o
    .io_output_cmd_payload_fragment_mask    (clintWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_mask[3:0]    ), //o
    .io_output_rsp_valid                    (clint_logic_io_bus_rsp_valid                                                 ), //i
    .io_output_rsp_ready                    (clintWishboneBridge_logic_bridge_io_output_rsp_ready                         ), //o
    .io_output_rsp_payload_last             (clint_logic_io_bus_rsp_payload_last                                          ), //i
    .io_output_rsp_payload_fragment_opcode  (clint_logic_io_bus_rsp_payload_fragment_opcode                               ), //i
    .io_output_rsp_payload_fragment_data    (clint_logic_io_bus_rsp_payload_fragment_data[31:0]                           ), //i
    .debugCd_external_clk                   (debugCd_external_clk                                                         ), //i
    .systemCd_logic_outputReset             (systemCd_logic_outputReset                                                   )  //i
  );
  WishboneToBmb_1 plicWishboneBridge_logic_bridge (
    .io_input_CYC                           (plicWishbone_CYC                                                            ), //i
    .io_input_STB                           (plicWishbone_STB                                                            ), //i
    .io_input_ACK                           (plicWishboneBridge_logic_bridge_io_input_ACK                                ), //o
    .io_input_WE                            (plicWishbone_WE                                                             ), //i
    .io_input_ADR                           (plicWishbone_ADR[19:0]                                                      ), //i
    .io_input_DAT_MISO                      (plicWishboneBridge_logic_bridge_io_input_DAT_MISO[31:0]                     ), //o
    .io_input_DAT_MOSI                      (plicWishbone_DAT_MOSI[31:0]                                                 ), //i
    .io_output_cmd_valid                    (plicWishboneBridge_logic_bridge_io_output_cmd_valid                         ), //o
    .io_output_cmd_ready                    (plic_logic_bmb_cmd_ready                                                    ), //i
    .io_output_cmd_payload_last             (plicWishboneBridge_logic_bridge_io_output_cmd_payload_last                  ), //o
    .io_output_cmd_payload_fragment_opcode  (plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_opcode       ), //o
    .io_output_cmd_payload_fragment_address (plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_address[21:0]), //o
    .io_output_cmd_payload_fragment_length  (plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_length[1:0]  ), //o
    .io_output_cmd_payload_fragment_data    (plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_data[31:0]   ), //o
    .io_output_cmd_payload_fragment_mask    (plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_mask[3:0]    ), //o
    .io_output_rsp_valid                    (plic_logic_bmb_rsp_valid                                                    ), //i
    .io_output_rsp_ready                    (plicWishboneBridge_logic_bridge_io_output_rsp_ready                         ), //o
    .io_output_rsp_payload_last             (plic_logic_bmb_rsp_payload_last                                             ), //i
    .io_output_rsp_payload_fragment_opcode  (plic_logic_bmb_rsp_payload_fragment_opcode                                  ), //i
    .io_output_rsp_payload_fragment_data    (plic_logic_bmb_rsp_payload_fragment_data[31:0]                              ), //i
    .debugCd_external_clk                   (debugCd_external_clk                                                        ), //i
    .systemCd_logic_outputReset             (systemCd_logic_outputReset                                                  )  //i
  );
  BmbDecoder customDebug_debugBridge_bmb_decoder (
    .io_input_cmd_valid                        (customDebug_debugBridge_logic_mmMaster_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (customDebug_debugBridge_bmb_decoder_io_input_cmd_ready                                     ), //o
    .io_input_cmd_payload_last                 (customDebug_debugBridge_logic_mmMaster_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_opcode      (customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_length[1:0]                    ), //i
    .io_input_cmd_payload_fragment_data        (customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_data[31:0]                     ), //i
    .io_input_cmd_payload_fragment_mask        (customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask[3:0]                      ), //i
    .io_input_rsp_valid                        (customDebug_debugBridge_bmb_decoder_io_input_rsp_valid                                     ), //o
    .io_input_rsp_ready                        (customDebug_debugBridge_logic_mmMaster_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_last                              ), //o
    .io_input_rsp_payload_fragment_opcode      (customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_fragment_opcode                   ), //o
    .io_input_rsp_payload_fragment_data        (customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_fragment_data[31:0]               ), //o
    .io_outputs_0_cmd_valid                    (customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_valid                                 ), //o
    .io_outputs_0_cmd_ready                    (cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready                      ), //i
    .io_outputs_0_cmd_payload_last             (customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_last                          ), //o
    .io_outputs_0_cmd_payload_fragment_opcode  (customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode               ), //o
    .io_outputs_0_cmd_payload_fragment_address (customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_address[31:0]        ), //o
    .io_outputs_0_cmd_payload_fragment_length  (customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]          ), //o
    .io_outputs_0_cmd_payload_fragment_data    (customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_data[31:0]           ), //o
    .io_outputs_0_cmd_payload_fragment_mask    (customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_mask[3:0]            ), //o
    .io_outputs_0_rsp_valid                    (cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid                      ), //i
    .io_outputs_0_rsp_ready                    (customDebug_debugBridge_bmb_decoder_io_outputs_0_rsp_ready                                 ), //o
    .io_outputs_0_rsp_payload_last             (cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last               ), //i
    .io_outputs_0_rsp_payload_fragment_opcode  (cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode    ), //i
    .io_outputs_0_rsp_payload_fragment_data    (cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data[31:0]), //i
    .debugCd_external_clk                      (debugCd_external_clk                                                                       ), //i
    .debugCd_logic_outputReset                 (debugCd_logic_outputReset                                                                  )  //i
  );
  BmbDecoder_1 iArbiter_bmb_decoder (
    .io_input_cmd_valid                        (iArbiter_bmb_cmd_halfPipe_valid                                         ), //i
    .io_input_cmd_ready                        (iArbiter_bmb_decoder_io_input_cmd_ready                                 ), //o
    .io_input_cmd_payload_last                 (iArbiter_bmb_cmd_halfPipe_payload_last                                  ), //i
    .io_input_cmd_payload_fragment_opcode      (iArbiter_bmb_cmd_halfPipe_payload_fragment_opcode                       ), //i
    .io_input_cmd_payload_fragment_address     (iArbiter_bmb_cmd_halfPipe_payload_fragment_address[31:0]                ), //i
    .io_input_cmd_payload_fragment_length      (iArbiter_bmb_cmd_halfPipe_payload_fragment_length[5:0]                  ), //i
    .io_input_rsp_valid                        (iArbiter_bmb_decoder_io_input_rsp_valid                                 ), //o
    .io_input_rsp_ready                        (_zz_io_input_rsp_ready                                                  ), //i
    .io_input_rsp_payload_last                 (iArbiter_bmb_decoder_io_input_rsp_payload_last                          ), //o
    .io_input_rsp_payload_fragment_opcode      (iArbiter_bmb_decoder_io_input_rsp_payload_fragment_opcode               ), //o
    .io_input_rsp_payload_fragment_data        (iArbiter_bmb_decoder_io_input_rsp_payload_fragment_data[31:0]           ), //o
    .io_outputs_0_cmd_valid                    (iArbiter_bmb_decoder_io_outputs_0_cmd_valid                             ), //o
    .io_outputs_0_cmd_ready                    (peripheralBridge_bmb_arbiter_io_inputs_1_cmd_ready                      ), //i
    .io_outputs_0_cmd_payload_last             (iArbiter_bmb_decoder_io_outputs_0_cmd_payload_last                      ), //o
    .io_outputs_0_cmd_payload_fragment_opcode  (iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode           ), //o
    .io_outputs_0_cmd_payload_fragment_address (iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_address[31:0]    ), //o
    .io_outputs_0_cmd_payload_fragment_length  (iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_length[5:0]      ), //o
    .io_outputs_0_rsp_valid                    (peripheralBridge_bmb_arbiter_io_inputs_1_rsp_valid                      ), //i
    .io_outputs_0_rsp_ready                    (iArbiter_bmb_decoder_io_outputs_0_rsp_ready                             ), //o
    .io_outputs_0_rsp_payload_last             (peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_last               ), //i
    .io_outputs_0_rsp_payload_fragment_opcode  (peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode    ), //i
    .io_outputs_0_rsp_payload_fragment_data    (peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data[31:0])  //i
  );
  BmbToWishbone peripheralBridge_logic (
    .io_input_cmd_valid                    (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_valid                         ), //i
    .io_input_cmd_ready                    (peripheralBridge_logic_io_input_cmd_ready                                                         ), //o
    .io_input_cmd_payload_last             (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_last                  ), //i
    .io_input_cmd_payload_fragment_source  (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_source       ), //i
    .io_input_cmd_payload_fragment_opcode  (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_opcode       ), //i
    .io_input_cmd_payload_fragment_address (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_address[31:0]), //i
    .io_input_cmd_payload_fragment_length  (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_length[5:0]  ), //i
    .io_input_cmd_payload_fragment_data    (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_data[31:0]   ), //i
    .io_input_cmd_payload_fragment_mask    (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_mask[3:0]    ), //i
    .io_input_cmd_payload_fragment_context (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_context      ), //i
    .io_input_rsp_valid                    (peripheralBridge_logic_io_input_rsp_valid                                                         ), //o
    .io_input_rsp_ready                    (_zz_io_input_rsp_ready_1                                                                          ), //i
    .io_input_rsp_payload_last             (peripheralBridge_logic_io_input_rsp_payload_last                                                  ), //o
    .io_input_rsp_payload_fragment_source  (peripheralBridge_logic_io_input_rsp_payload_fragment_source                                       ), //o
    .io_input_rsp_payload_fragment_opcode  (peripheralBridge_logic_io_input_rsp_payload_fragment_opcode                                       ), //o
    .io_input_rsp_payload_fragment_data    (peripheralBridge_logic_io_input_rsp_payload_fragment_data[31:0]                                   ), //o
    .io_input_rsp_payload_fragment_context (peripheralBridge_logic_io_input_rsp_payload_fragment_context                                      ), //o
    .io_output_CYC                         (peripheralBridge_logic_io_output_CYC                                                              ), //o
    .io_output_STB                         (peripheralBridge_logic_io_output_STB                                                              ), //o
    .io_output_ACK                         (peripheral_ACK                                                                                    ), //i
    .io_output_WE                          (peripheralBridge_logic_io_output_WE                                                               ), //o
    .io_output_ADR                         (peripheralBridge_logic_io_output_ADR[29:0]                                                        ), //o
    .io_output_DAT_MISO                    (peripheral_DAT_MISO[31:0]                                                                         ), //i
    .io_output_DAT_MOSI                    (peripheralBridge_logic_io_output_DAT_MOSI[31:0]                                                   ), //o
    .io_output_SEL                         (peripheralBridge_logic_io_output_SEL[3:0]                                                         ), //o
    .io_output_ERR                         (peripheral_ERR                                                                                    ), //i
    .io_output_CTI                         (peripheralBridge_logic_io_output_CTI[2:0]                                                         ), //o
    .io_output_BTE                         (peripheralBridge_logic_io_output_BTE[1:0]                                                         ), //o
    .debugCd_external_clk                  (debugCd_external_clk                                                                              ), //i
    .systemCd_logic_outputReset            (systemCd_logic_outputReset                                                                        )  //i
  );
  BmbArbiter peripheralBridge_bmb_arbiter (
    .io_inputs_0_cmd_valid                    (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_valid                         ), //i
    .io_inputs_0_cmd_ready                    (peripheralBridge_bmb_arbiter_io_inputs_0_cmd_ready                                                  ), //o
    .io_inputs_0_cmd_payload_last             (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_last                  ), //i
    .io_inputs_0_cmd_payload_fragment_opcode  (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_opcode       ), //i
    .io_inputs_0_cmd_payload_fragment_address (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_address[31:0]), //i
    .io_inputs_0_cmd_payload_fragment_length  (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_length[5:0]  ), //i
    .io_inputs_0_cmd_payload_fragment_data    (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_data[31:0]   ), //i
    .io_inputs_0_cmd_payload_fragment_mask    (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_mask[3:0]    ), //i
    .io_inputs_0_cmd_payload_fragment_context (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_context      ), //i
    .io_inputs_0_rsp_valid                    (peripheralBridge_bmb_arbiter_io_inputs_0_rsp_valid                                                  ), //o
    .io_inputs_0_rsp_ready                    (peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready                         ), //i
    .io_inputs_0_rsp_payload_last             (peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_last                                           ), //o
    .io_inputs_0_rsp_payload_fragment_opcode  (peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode                                ), //o
    .io_inputs_0_rsp_payload_fragment_data    (peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data[31:0]                            ), //o
    .io_inputs_0_rsp_payload_fragment_context (peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context                               ), //o
    .io_inputs_1_cmd_valid                    (iArbiter_bmb_decoder_io_outputs_0_cmd_valid                                                         ), //i
    .io_inputs_1_cmd_ready                    (peripheralBridge_bmb_arbiter_io_inputs_1_cmd_ready                                                  ), //o
    .io_inputs_1_cmd_payload_last             (iArbiter_bmb_decoder_io_outputs_0_cmd_payload_last                                                  ), //i
    .io_inputs_1_cmd_payload_fragment_opcode  (iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode                                       ), //i
    .io_inputs_1_cmd_payload_fragment_address (iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_address[31:0]                                ), //i
    .io_inputs_1_cmd_payload_fragment_length  (iArbiter_bmb_decoder_io_outputs_0_cmd_payload_fragment_length[5:0]                                  ), //i
    .io_inputs_1_cmd_payload_fragment_data    (peripheralBridge_bmb_arbiter_io_inputs_1_cmd_payload_fragment_data[31:0]                            ), //i
    .io_inputs_1_cmd_payload_fragment_mask    (peripheralBridge_bmb_arbiter_io_inputs_1_cmd_payload_fragment_mask[3:0]                             ), //i
    .io_inputs_1_rsp_valid                    (peripheralBridge_bmb_arbiter_io_inputs_1_rsp_valid                                                  ), //o
    .io_inputs_1_rsp_ready                    (iArbiter_bmb_decoder_io_outputs_0_rsp_ready                                                         ), //i
    .io_inputs_1_rsp_payload_last             (peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_last                                           ), //o
    .io_inputs_1_rsp_payload_fragment_opcode  (peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode                                ), //o
    .io_inputs_1_rsp_payload_fragment_data    (peripheralBridge_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data[31:0]                            ), //o
    .io_output_cmd_valid                      (peripheralBridge_bmb_arbiter_io_output_cmd_valid                                                    ), //o
    .io_output_cmd_ready                      (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN                                         ), //i
    .io_output_cmd_payload_last               (peripheralBridge_bmb_arbiter_io_output_cmd_payload_last                                             ), //o
    .io_output_cmd_payload_fragment_source    (peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_source                                  ), //o
    .io_output_cmd_payload_fragment_opcode    (peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_opcode                                  ), //o
    .io_output_cmd_payload_fragment_address   (peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_address[31:0]                           ), //o
    .io_output_cmd_payload_fragment_length    (peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_length[5:0]                             ), //o
    .io_output_cmd_payload_fragment_data      (peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_data[31:0]                              ), //o
    .io_output_cmd_payload_fragment_mask      (peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_mask[3:0]                               ), //o
    .io_output_cmd_payload_fragment_context   (peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_context                                 ), //o
    .io_output_rsp_valid                      (_zz_when_Stream_l372                                                                                ), //i
    .io_output_rsp_ready                      (peripheralBridge_bmb_arbiter_io_output_rsp_ready                                                    ), //o
    .io_output_rsp_payload_last               (_zz_io_output_rsp_payload_last                                                                      ), //i
    .io_output_rsp_payload_fragment_source    (_zz_io_output_rsp_payload_fragment_source                                                           ), //i
    .io_output_rsp_payload_fragment_opcode    (_zz_io_output_rsp_payload_fragment_opcode                                                           ), //i
    .io_output_rsp_payload_fragment_data      (_zz_io_output_rsp_payload_fragment_data[31:0]                                                       ), //i
    .io_output_rsp_payload_fragment_context   (_zz_io_output_rsp_payload_fragment_context                                                          ), //i
    .debugCd_external_clk                     (debugCd_external_clk                                                                                ), //i
    .systemCd_logic_outputReset               (systemCd_logic_outputReset                                                                          )  //i
  );
  always @(*) begin
    debugCd_logic_inputResetTrigger = 1'b0;
    if(debugCd_logic_inputResetAdapter_stuff_syncTrigger) begin
      debugCd_logic_inputResetTrigger = 1'b1;
    end
  end

  always @(*) begin
    debugCd_logic_outputResetUnbuffered = 1'b0;
    if(when_ClockDomainGenerator_l222) begin
      debugCd_logic_outputResetUnbuffered = 1'b1;
    end
  end

  assign when_ClockDomainGenerator_l222 = (debugCd_logic_holdingLogic_resetCounter != 12'hfff);
  assign bufferCC_4_io_dataIn = (1'b0 ^ 1'b0);
  assign debugCd_logic_inputResetAdapter_stuff_syncTrigger = bufferCC_4_io_dataOut;
  always @(*) begin
    systemCd_logic_inputResetTrigger = 1'b0;
    if(systemCd_logic_inputResetAdapter_stuff_syncTrigger) begin
      systemCd_logic_inputResetTrigger = 1'b1;
    end
    if(bufferCC_6_io_dataOut) begin
      systemCd_logic_inputResetTrigger = 1'b1;
    end
  end

  always @(*) begin
    systemCd_logic_outputResetUnbuffered = 1'b0;
    if(when_ClockDomainGenerator_l222_1) begin
      systemCd_logic_outputResetUnbuffered = 1'b1;
    end
  end

  assign when_ClockDomainGenerator_l222_1 = (systemCd_logic_holdingLogic_resetCounter != 6'h3f);
  assign bufferCC_5_io_dataIn = (1'b0 ^ 1'b0);
  assign systemCd_logic_inputResetAdapter_stuff_syncTrigger = bufferCC_5_io_dataOut;
  assign customDebug_debugBridge_logic_mmMaster_cmd_valid = customDebug_debugBridge_logic_debugger_io_mem_cmd_valid;
  assign customDebug_debugBridge_logic_mmMaster_cmd_payload_last = 1'b1;
  assign customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_length = 2'b11;
  assign customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_opcode = (customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_wr ? 1'b1 : 1'b0);
  assign customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_address = {_zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_address,2'b00};
  assign customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_data = customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_data;
  always @(*) begin
    case(customDebug_debugBridge_logic_debugger_io_mem_cmd_payload_size)
      2'b00 : begin
        _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask = 4'b0011;
      end
      default : begin
        _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask = 4'b1111;
      end
    endcase
  end

  assign customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask = _zz_customDebug_debugBridge_logic_mmMaster_cmd_payload_fragment_mask_1[3:0];
  assign customDebug_debugBridge_logic_mmMaster_rsp_ready = 1'b1;
  assign debugPort_tdo = customDebug_debugBridge_logic_jtagBridge_io_ctrl_tdo;
  assign _zz_when_PlicGateway_l21 = interrupts[1];
  assign when_PlicGateway_l21 = (! _zz_when_PlicGateway_l21_1);
  assign _zz_when_PlicGateway_l21_2 = interrupts[2];
  assign when_PlicGateway_l21_1 = (! _zz_when_PlicGateway_l21_3);
  assign _zz_when_PlicGateway_l21_4 = interrupts[3];
  assign when_PlicGateway_l21_2 = (! _zz_when_PlicGateway_l21_5);
  assign _zz_when_PlicGateway_l21_6 = interrupts[4];
  assign when_PlicGateway_l21_3 = (! _zz_when_PlicGateway_l21_7);
  assign _zz_when_PlicGateway_l21_8 = interrupts[5];
  assign when_PlicGateway_l21_4 = (! _zz_when_PlicGateway_l21_9);
  assign _zz_when_PlicGateway_l21_10 = interrupts[6];
  assign when_PlicGateway_l21_5 = (! _zz_when_PlicGateway_l21_11);
  assign _zz_when_PlicGateway_l21_12 = interrupts[7];
  assign when_PlicGateway_l21_6 = (! _zz_when_PlicGateway_l21_13);
  assign _zz_when_PlicGateway_l21_14 = interrupts[8];
  assign when_PlicGateway_l21_7 = (! _zz_when_PlicGateway_l21_15);
  assign _zz_when_PlicGateway_l21_16 = interrupts[9];
  assign when_PlicGateway_l21_8 = (! _zz_when_PlicGateway_l21_17);
  assign _zz_when_PlicGateway_l21_18 = interrupts[10];
  assign when_PlicGateway_l21_9 = (! _zz_when_PlicGateway_l21_19);
  assign _zz_when_PlicGateway_l21_20 = interrupts[11];
  assign when_PlicGateway_l21_10 = (! _zz_when_PlicGateway_l21_21);
  assign _zz_when_PlicGateway_l21_22 = interrupts[12];
  assign when_PlicGateway_l21_11 = (! _zz_when_PlicGateway_l21_23);
  assign _zz_when_PlicGateway_l21_24 = interrupts[13];
  assign when_PlicGateway_l21_12 = (! _zz_when_PlicGateway_l21_25);
  assign _zz_when_PlicGateway_l21_26 = interrupts[14];
  assign when_PlicGateway_l21_13 = (! _zz_when_PlicGateway_l21_27);
  assign _zz_when_PlicGateway_l21_28 = interrupts[15];
  assign when_PlicGateway_l21_14 = (! _zz_when_PlicGateway_l21_29);
  assign _zz_when_PlicGateway_l21_30 = interrupts[16];
  assign when_PlicGateway_l21_15 = (! _zz_when_PlicGateway_l21_31);
  assign _zz_when_PlicGateway_l21_32 = interrupts[17];
  assign when_PlicGateway_l21_16 = (! _zz_when_PlicGateway_l21_33);
  assign _zz_when_PlicGateway_l21_34 = interrupts[18];
  assign when_PlicGateway_l21_17 = (! _zz_when_PlicGateway_l21_35);
  assign _zz_when_PlicGateway_l21_36 = interrupts[19];
  assign when_PlicGateway_l21_18 = (! _zz_when_PlicGateway_l21_37);
  assign _zz_when_PlicGateway_l21_38 = interrupts[20];
  assign when_PlicGateway_l21_19 = (! _zz_when_PlicGateway_l21_39);
  assign _zz_when_PlicGateway_l21_40 = interrupts[21];
  assign when_PlicGateway_l21_20 = (! _zz_when_PlicGateway_l21_41);
  assign _zz_when_PlicGateway_l21_42 = interrupts[22];
  assign when_PlicGateway_l21_21 = (! _zz_when_PlicGateway_l21_43);
  assign _zz_when_PlicGateway_l21_44 = interrupts[23];
  assign when_PlicGateway_l21_22 = (! _zz_when_PlicGateway_l21_45);
  assign _zz_when_PlicGateway_l21_46 = interrupts[24];
  assign when_PlicGateway_l21_23 = (! _zz_when_PlicGateway_l21_47);
  assign _zz_when_PlicGateway_l21_48 = interrupts[25];
  assign when_PlicGateway_l21_24 = (! _zz_when_PlicGateway_l21_49);
  assign _zz_when_PlicGateway_l21_50 = interrupts[26];
  assign when_PlicGateway_l21_25 = (! _zz_when_PlicGateway_l21_51);
  assign _zz_when_PlicGateway_l21_52 = interrupts[27];
  assign when_PlicGateway_l21_26 = (! _zz_when_PlicGateway_l21_53);
  assign _zz_when_PlicGateway_l21_54 = interrupts[28];
  assign when_PlicGateway_l21_27 = (! _zz_when_PlicGateway_l21_55);
  assign _zz_when_PlicGateway_l21_56 = interrupts[29];
  assign when_PlicGateway_l21_28 = (! _zz_when_PlicGateway_l21_57);
  assign _zz_when_PlicGateway_l21_58 = interrupts[30];
  assign when_PlicGateway_l21_29 = (! _zz_when_PlicGateway_l21_59);
  assign _zz_when_PlicGateway_l21_60 = interrupts[31];
  assign when_PlicGateway_l21_30 = (! _zz_when_PlicGateway_l21_61);
  assign cores_0_cpu_iBus_cmd_valid = cores_0_cpu_logic_cpu_iBus_cmd_valid;
  assign cores_0_cpu_iBus_cmd_payload_fragment_opcode = 1'b0;
  assign cores_0_cpu_iBus_cmd_payload_fragment_address = cores_0_cpu_logic_cpu_iBus_cmd_payload_address;
  assign cores_0_cpu_iBus_cmd_payload_fragment_length = 6'h3f;
  assign cores_0_cpu_iBus_cmd_payload_last = 1'b1;
  assign cores_0_cpu_logic_cpu_iBus_rsp_payload_error = (cores_0_cpu_iBus_rsp_payload_fragment_opcode == 1'b1);
  assign cores_0_cpu_iBus_rsp_ready = 1'b1;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_valid = cores_0_cpu_logic_cpu_dBus_cmd_valid;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_last = cores_0_cpu_logic_cpu_dBus_cmd_payload_last;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_opcode = (cores_0_cpu_logic_cpu_dBus_cmd_payload_wr ? 1'b1 : 1'b0);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_address = cores_0_cpu_logic_cpu_dBus_cmd_payload_address;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_data = cores_0_cpu_logic_cpu_dBus_cmd_payload_data;
  always @(*) begin
    _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = 6'bxxxxxx;
    case(cores_0_cpu_logic_cpu_dBus_cmd_payload_size)
      3'b000 : begin
        _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = 6'h0;
      end
      3'b001 : begin
        _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = 6'h01;
      end
      3'b010 : begin
        _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = 6'h03;
      end
      3'b011 : begin
        _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = 6'h07;
      end
      3'b100 : begin
        _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = 6'h0f;
      end
      3'b101 : begin
        _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = 6'h1f;
      end
      3'b110 : begin
        _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = 6'h3f;
      end
      default : begin
      end
    endcase
  end

  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length = _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_mask = cores_0_cpu_logic_cpu_dBus_cmd_payload_mask;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_withoutWriteBuffer_busCmdContext_isWrite = cores_0_cpu_logic_cpu_dBus_cmd_payload_wr;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_context = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_withoutWriteBuffer_busCmdContext_isWrite;
  always @(*) begin
    cores_0_cpu_logic_cpu_dBus_rsp_valid = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid;
    if(when_DataCache_l535) begin
      cores_0_cpu_logic_cpu_dBus_rsp_valid = 1'b0;
    end
  end

  assign when_DataCache_l535 = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_context[0];
  assign cores_0_cpu_logic_cpu_dBus_rsp_payload_error = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_opcode == 1'b1);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_ready = 1'b1;
  assign plic_logic_bus_readErrorFlag = 1'b0;
  assign plic_logic_bus_writeErrorFlag = 1'b0;
  always @(*) begin
    plic_logic_bus_readHaltTrigger = 1'b0;
    if(when_PlicMapper_l122) begin
      plic_logic_bus_readHaltTrigger = 1'b1;
    end
  end

  assign plic_logic_bus_writeHaltTrigger = 1'b0;
  assign _zz_plic_logic_bus_rsp_ready = (! (plic_logic_bus_readHaltTrigger || plic_logic_bus_writeHaltTrigger));
  assign plic_logic_bus_rsp_ready = (_zz_plic_logic_bus_rsp_ready_1 && _zz_plic_logic_bus_rsp_ready);
  always @(*) begin
    _zz_plic_logic_bus_rsp_ready_1 = plic_logic_bmb_rsp_ready;
    if(when_Stream_l372) begin
      _zz_plic_logic_bus_rsp_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l372 = (! _zz_plic_logic_bmb_rsp_valid);
  assign _zz_plic_logic_bmb_rsp_valid = _zz_plic_logic_bmb_rsp_valid_1;
  assign plic_logic_bmb_rsp_valid = _zz_plic_logic_bmb_rsp_valid;
  assign plic_logic_bmb_rsp_payload_last = _zz_plic_logic_bmb_rsp_payload_last;
  assign plic_logic_bmb_rsp_payload_fragment_opcode = _zz_plic_logic_bmb_rsp_payload_fragment_opcode;
  assign plic_logic_bmb_rsp_payload_fragment_data = _zz_plic_logic_bmb_rsp_payload_fragment_data;
  assign plic_logic_bus_askWrite = (plic_logic_bmb_cmd_valid && (plic_logic_bmb_cmd_payload_fragment_opcode == 1'b1));
  assign plic_logic_bus_askRead = (plic_logic_bmb_cmd_valid && (plic_logic_bmb_cmd_payload_fragment_opcode == 1'b0));
  assign plic_logic_bmb_cmd_fire = (plic_logic_bmb_cmd_valid && plic_logic_bmb_cmd_ready);
  assign plic_logic_bus_doWrite = (plic_logic_bmb_cmd_fire && (plic_logic_bmb_cmd_payload_fragment_opcode == 1'b1));
  assign plic_logic_bus_doRead = (plic_logic_bmb_cmd_fire && (plic_logic_bmb_cmd_payload_fragment_opcode == 1'b0));
  assign plic_logic_bus_rsp_valid = plic_logic_bmb_cmd_valid;
  assign plic_logic_bmb_cmd_ready = plic_logic_bus_rsp_ready;
  assign plic_logic_bus_rsp_payload_last = 1'b1;
  assign when_BmbSlaveFactory_l33 = (plic_logic_bus_doWrite && plic_logic_bus_writeErrorFlag);
  always @(*) begin
    if(when_BmbSlaveFactory_l33) begin
      plic_logic_bus_rsp_payload_fragment_opcode = 1'b1;
    end else begin
      if(when_BmbSlaveFactory_l35) begin
        plic_logic_bus_rsp_payload_fragment_opcode = 1'b1;
      end else begin
        plic_logic_bus_rsp_payload_fragment_opcode = 1'b0;
      end
    end
  end

  assign when_BmbSlaveFactory_l35 = (plic_logic_bus_doRead && plic_logic_bus_readErrorFlag);
  always @(*) begin
    plic_logic_bus_rsp_payload_fragment_data = 32'h0;
    case(plic_logic_bmb_cmd_payload_fragment_address)
      22'h000004 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data;
      end
      22'h001000 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 1] = _zz_plic_logic_bus_rsp_payload_fragment_data_1;
        plic_logic_bus_rsp_payload_fragment_data[2 : 2] = _zz_plic_logic_bus_rsp_payload_fragment_data_3;
        plic_logic_bus_rsp_payload_fragment_data[3 : 3] = _zz_plic_logic_bus_rsp_payload_fragment_data_5;
        plic_logic_bus_rsp_payload_fragment_data[4 : 4] = _zz_plic_logic_bus_rsp_payload_fragment_data_7;
        plic_logic_bus_rsp_payload_fragment_data[5 : 5] = _zz_plic_logic_bus_rsp_payload_fragment_data_9;
        plic_logic_bus_rsp_payload_fragment_data[6 : 6] = _zz_plic_logic_bus_rsp_payload_fragment_data_11;
        plic_logic_bus_rsp_payload_fragment_data[7 : 7] = _zz_plic_logic_bus_rsp_payload_fragment_data_13;
        plic_logic_bus_rsp_payload_fragment_data[8 : 8] = _zz_plic_logic_bus_rsp_payload_fragment_data_15;
        plic_logic_bus_rsp_payload_fragment_data[9 : 9] = _zz_plic_logic_bus_rsp_payload_fragment_data_17;
        plic_logic_bus_rsp_payload_fragment_data[10 : 10] = _zz_plic_logic_bus_rsp_payload_fragment_data_19;
        plic_logic_bus_rsp_payload_fragment_data[11 : 11] = _zz_plic_logic_bus_rsp_payload_fragment_data_21;
        plic_logic_bus_rsp_payload_fragment_data[12 : 12] = _zz_plic_logic_bus_rsp_payload_fragment_data_23;
        plic_logic_bus_rsp_payload_fragment_data[13 : 13] = _zz_plic_logic_bus_rsp_payload_fragment_data_25;
        plic_logic_bus_rsp_payload_fragment_data[14 : 14] = _zz_plic_logic_bus_rsp_payload_fragment_data_27;
        plic_logic_bus_rsp_payload_fragment_data[15 : 15] = _zz_plic_logic_bus_rsp_payload_fragment_data_29;
        plic_logic_bus_rsp_payload_fragment_data[16 : 16] = _zz_plic_logic_bus_rsp_payload_fragment_data_31;
        plic_logic_bus_rsp_payload_fragment_data[17 : 17] = _zz_plic_logic_bus_rsp_payload_fragment_data_33;
        plic_logic_bus_rsp_payload_fragment_data[18 : 18] = _zz_plic_logic_bus_rsp_payload_fragment_data_35;
        plic_logic_bus_rsp_payload_fragment_data[19 : 19] = _zz_plic_logic_bus_rsp_payload_fragment_data_37;
        plic_logic_bus_rsp_payload_fragment_data[20 : 20] = _zz_plic_logic_bus_rsp_payload_fragment_data_39;
        plic_logic_bus_rsp_payload_fragment_data[21 : 21] = _zz_plic_logic_bus_rsp_payload_fragment_data_41;
        plic_logic_bus_rsp_payload_fragment_data[22 : 22] = _zz_plic_logic_bus_rsp_payload_fragment_data_43;
        plic_logic_bus_rsp_payload_fragment_data[23 : 23] = _zz_plic_logic_bus_rsp_payload_fragment_data_45;
        plic_logic_bus_rsp_payload_fragment_data[24 : 24] = _zz_plic_logic_bus_rsp_payload_fragment_data_47;
        plic_logic_bus_rsp_payload_fragment_data[25 : 25] = _zz_plic_logic_bus_rsp_payload_fragment_data_49;
        plic_logic_bus_rsp_payload_fragment_data[26 : 26] = _zz_plic_logic_bus_rsp_payload_fragment_data_51;
        plic_logic_bus_rsp_payload_fragment_data[27 : 27] = _zz_plic_logic_bus_rsp_payload_fragment_data_53;
        plic_logic_bus_rsp_payload_fragment_data[28 : 28] = _zz_plic_logic_bus_rsp_payload_fragment_data_55;
        plic_logic_bus_rsp_payload_fragment_data[29 : 29] = _zz_plic_logic_bus_rsp_payload_fragment_data_57;
        plic_logic_bus_rsp_payload_fragment_data[30 : 30] = _zz_plic_logic_bus_rsp_payload_fragment_data_59;
        plic_logic_bus_rsp_payload_fragment_data[31 : 31] = _zz_plic_logic_bus_rsp_payload_fragment_data_61;
      end
      22'h000008 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_2;
      end
      22'h00000c : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_4;
      end
      22'h000010 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_6;
      end
      22'h000014 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_8;
      end
      22'h000018 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_10;
      end
      22'h00001c : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_12;
      end
      22'h000020 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_14;
      end
      22'h000024 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_16;
      end
      22'h000028 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_18;
      end
      22'h00002c : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_20;
      end
      22'h000030 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_22;
      end
      22'h000034 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_24;
      end
      22'h000038 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_26;
      end
      22'h00003c : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_28;
      end
      22'h000040 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_30;
      end
      22'h000044 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_32;
      end
      22'h000048 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_34;
      end
      22'h00004c : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_36;
      end
      22'h000050 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_38;
      end
      22'h000054 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_40;
      end
      22'h000058 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_42;
      end
      22'h00005c : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_44;
      end
      22'h000060 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_46;
      end
      22'h000064 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_48;
      end
      22'h000068 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_50;
      end
      22'h00006c : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_52;
      end
      22'h000070 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_54;
      end
      22'h000074 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_56;
      end
      22'h000078 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_58;
      end
      22'h00007c : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = _zz_plic_logic_bus_rsp_payload_fragment_data_60;
      end
      22'h200000 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = cores_0_cpu_externalInterrupt_plic_target_threshold;
      end
      22'h200004 : begin
        plic_logic_bus_rsp_payload_fragment_data[4 : 0] = cores_0_cpu_externalInterrupt_plic_target_claim;
      end
      22'h002000 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 1] = cores_0_cpu_externalInterrupt_plic_target_ie_0;
        plic_logic_bus_rsp_payload_fragment_data[2 : 2] = cores_0_cpu_externalInterrupt_plic_target_ie_1;
        plic_logic_bus_rsp_payload_fragment_data[3 : 3] = cores_0_cpu_externalInterrupt_plic_target_ie_2;
        plic_logic_bus_rsp_payload_fragment_data[4 : 4] = cores_0_cpu_externalInterrupt_plic_target_ie_3;
        plic_logic_bus_rsp_payload_fragment_data[5 : 5] = cores_0_cpu_externalInterrupt_plic_target_ie_4;
        plic_logic_bus_rsp_payload_fragment_data[6 : 6] = cores_0_cpu_externalInterrupt_plic_target_ie_5;
        plic_logic_bus_rsp_payload_fragment_data[7 : 7] = cores_0_cpu_externalInterrupt_plic_target_ie_6;
        plic_logic_bus_rsp_payload_fragment_data[8 : 8] = cores_0_cpu_externalInterrupt_plic_target_ie_7;
        plic_logic_bus_rsp_payload_fragment_data[9 : 9] = cores_0_cpu_externalInterrupt_plic_target_ie_8;
        plic_logic_bus_rsp_payload_fragment_data[10 : 10] = cores_0_cpu_externalInterrupt_plic_target_ie_9;
        plic_logic_bus_rsp_payload_fragment_data[11 : 11] = cores_0_cpu_externalInterrupt_plic_target_ie_10;
        plic_logic_bus_rsp_payload_fragment_data[12 : 12] = cores_0_cpu_externalInterrupt_plic_target_ie_11;
        plic_logic_bus_rsp_payload_fragment_data[13 : 13] = cores_0_cpu_externalInterrupt_plic_target_ie_12;
        plic_logic_bus_rsp_payload_fragment_data[14 : 14] = cores_0_cpu_externalInterrupt_plic_target_ie_13;
        plic_logic_bus_rsp_payload_fragment_data[15 : 15] = cores_0_cpu_externalInterrupt_plic_target_ie_14;
        plic_logic_bus_rsp_payload_fragment_data[16 : 16] = cores_0_cpu_externalInterrupt_plic_target_ie_15;
        plic_logic_bus_rsp_payload_fragment_data[17 : 17] = cores_0_cpu_externalInterrupt_plic_target_ie_16;
        plic_logic_bus_rsp_payload_fragment_data[18 : 18] = cores_0_cpu_externalInterrupt_plic_target_ie_17;
        plic_logic_bus_rsp_payload_fragment_data[19 : 19] = cores_0_cpu_externalInterrupt_plic_target_ie_18;
        plic_logic_bus_rsp_payload_fragment_data[20 : 20] = cores_0_cpu_externalInterrupt_plic_target_ie_19;
        plic_logic_bus_rsp_payload_fragment_data[21 : 21] = cores_0_cpu_externalInterrupt_plic_target_ie_20;
        plic_logic_bus_rsp_payload_fragment_data[22 : 22] = cores_0_cpu_externalInterrupt_plic_target_ie_21;
        plic_logic_bus_rsp_payload_fragment_data[23 : 23] = cores_0_cpu_externalInterrupt_plic_target_ie_22;
        plic_logic_bus_rsp_payload_fragment_data[24 : 24] = cores_0_cpu_externalInterrupt_plic_target_ie_23;
        plic_logic_bus_rsp_payload_fragment_data[25 : 25] = cores_0_cpu_externalInterrupt_plic_target_ie_24;
        plic_logic_bus_rsp_payload_fragment_data[26 : 26] = cores_0_cpu_externalInterrupt_plic_target_ie_25;
        plic_logic_bus_rsp_payload_fragment_data[27 : 27] = cores_0_cpu_externalInterrupt_plic_target_ie_26;
        plic_logic_bus_rsp_payload_fragment_data[28 : 28] = cores_0_cpu_externalInterrupt_plic_target_ie_27;
        plic_logic_bus_rsp_payload_fragment_data[29 : 29] = cores_0_cpu_externalInterrupt_plic_target_ie_28;
        plic_logic_bus_rsp_payload_fragment_data[30 : 30] = cores_0_cpu_externalInterrupt_plic_target_ie_29;
        plic_logic_bus_rsp_payload_fragment_data[31 : 31] = cores_0_cpu_externalInterrupt_plic_target_ie_30;
      end
      22'h201000 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 0] = cores_0_cpu_externalSupervisorInterrupt_plic_target_threshold;
      end
      22'h201004 : begin
        plic_logic_bus_rsp_payload_fragment_data[4 : 0] = cores_0_cpu_externalSupervisorInterrupt_plic_target_claim;
      end
      22'h002080 : begin
        plic_logic_bus_rsp_payload_fragment_data[1 : 1] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_0;
        plic_logic_bus_rsp_payload_fragment_data[2 : 2] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_1;
        plic_logic_bus_rsp_payload_fragment_data[3 : 3] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_2;
        plic_logic_bus_rsp_payload_fragment_data[4 : 4] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_3;
        plic_logic_bus_rsp_payload_fragment_data[5 : 5] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_4;
        plic_logic_bus_rsp_payload_fragment_data[6 : 6] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_5;
        plic_logic_bus_rsp_payload_fragment_data[7 : 7] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_6;
        plic_logic_bus_rsp_payload_fragment_data[8 : 8] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_7;
        plic_logic_bus_rsp_payload_fragment_data[9 : 9] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_8;
        plic_logic_bus_rsp_payload_fragment_data[10 : 10] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_9;
        plic_logic_bus_rsp_payload_fragment_data[11 : 11] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_10;
        plic_logic_bus_rsp_payload_fragment_data[12 : 12] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_11;
        plic_logic_bus_rsp_payload_fragment_data[13 : 13] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_12;
        plic_logic_bus_rsp_payload_fragment_data[14 : 14] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_13;
        plic_logic_bus_rsp_payload_fragment_data[15 : 15] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_14;
        plic_logic_bus_rsp_payload_fragment_data[16 : 16] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_15;
        plic_logic_bus_rsp_payload_fragment_data[17 : 17] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_16;
        plic_logic_bus_rsp_payload_fragment_data[18 : 18] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_17;
        plic_logic_bus_rsp_payload_fragment_data[19 : 19] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_18;
        plic_logic_bus_rsp_payload_fragment_data[20 : 20] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_19;
        plic_logic_bus_rsp_payload_fragment_data[21 : 21] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_20;
        plic_logic_bus_rsp_payload_fragment_data[22 : 22] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_21;
        plic_logic_bus_rsp_payload_fragment_data[23 : 23] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_22;
        plic_logic_bus_rsp_payload_fragment_data[24 : 24] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_23;
        plic_logic_bus_rsp_payload_fragment_data[25 : 25] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_24;
        plic_logic_bus_rsp_payload_fragment_data[26 : 26] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_25;
        plic_logic_bus_rsp_payload_fragment_data[27 : 27] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_26;
        plic_logic_bus_rsp_payload_fragment_data[28 : 28] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_27;
        plic_logic_bus_rsp_payload_fragment_data[29 : 29] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_28;
        plic_logic_bus_rsp_payload_fragment_data[30 : 30] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_29;
        plic_logic_bus_rsp_payload_fragment_data[31 : 31] = cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_30;
      end
      default : begin
      end
    endcase
  end

  assign cores_0_cpu_externalInterrupt_plic_target_requests_0_priority = 2'b00;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_0_id = 5'h0;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_0_valid = 1'b1;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_1_priority = _zz_plic_logic_bus_rsp_payload_fragment_data;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_1_id = 5'h01;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_1_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_1 && cores_0_cpu_externalInterrupt_plic_target_ie_0);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_2_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_2;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_2_id = 5'h02;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_2_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_3 && cores_0_cpu_externalInterrupt_plic_target_ie_1);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_3_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_4;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_3_id = 5'h03;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_3_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_5 && cores_0_cpu_externalInterrupt_plic_target_ie_2);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_4_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_6;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_4_id = 5'h04;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_4_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_7 && cores_0_cpu_externalInterrupt_plic_target_ie_3);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_5_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_8;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_5_id = 5'h05;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_5_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_9 && cores_0_cpu_externalInterrupt_plic_target_ie_4);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_6_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_10;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_6_id = 5'h06;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_6_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_11 && cores_0_cpu_externalInterrupt_plic_target_ie_5);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_7_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_12;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_7_id = 5'h07;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_7_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_13 && cores_0_cpu_externalInterrupt_plic_target_ie_6);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_8_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_14;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_8_id = 5'h08;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_8_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_15 && cores_0_cpu_externalInterrupt_plic_target_ie_7);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_9_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_16;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_9_id = 5'h09;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_9_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_17 && cores_0_cpu_externalInterrupt_plic_target_ie_8);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_10_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_18;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_10_id = 5'h0a;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_10_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_19 && cores_0_cpu_externalInterrupt_plic_target_ie_9);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_11_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_20;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_11_id = 5'h0b;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_11_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_21 && cores_0_cpu_externalInterrupt_plic_target_ie_10);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_12_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_22;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_12_id = 5'h0c;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_12_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_23 && cores_0_cpu_externalInterrupt_plic_target_ie_11);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_13_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_24;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_13_id = 5'h0d;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_13_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_25 && cores_0_cpu_externalInterrupt_plic_target_ie_12);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_14_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_26;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_14_id = 5'h0e;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_14_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_27 && cores_0_cpu_externalInterrupt_plic_target_ie_13);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_15_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_28;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_15_id = 5'h0f;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_15_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_29 && cores_0_cpu_externalInterrupt_plic_target_ie_14);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_16_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_30;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_16_id = 5'h10;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_16_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_31 && cores_0_cpu_externalInterrupt_plic_target_ie_15);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_17_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_32;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_17_id = 5'h11;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_17_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_33 && cores_0_cpu_externalInterrupt_plic_target_ie_16);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_18_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_34;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_18_id = 5'h12;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_18_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_35 && cores_0_cpu_externalInterrupt_plic_target_ie_17);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_19_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_36;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_19_id = 5'h13;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_19_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_37 && cores_0_cpu_externalInterrupt_plic_target_ie_18);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_20_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_38;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_20_id = 5'h14;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_20_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_39 && cores_0_cpu_externalInterrupt_plic_target_ie_19);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_21_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_40;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_21_id = 5'h15;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_21_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_41 && cores_0_cpu_externalInterrupt_plic_target_ie_20);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_22_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_42;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_22_id = 5'h16;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_22_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_43 && cores_0_cpu_externalInterrupt_plic_target_ie_21);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_23_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_44;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_23_id = 5'h17;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_23_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_45 && cores_0_cpu_externalInterrupt_plic_target_ie_22);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_24_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_46;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_24_id = 5'h18;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_24_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_47 && cores_0_cpu_externalInterrupt_plic_target_ie_23);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_25_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_48;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_25_id = 5'h19;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_25_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_49 && cores_0_cpu_externalInterrupt_plic_target_ie_24);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_26_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_50;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_26_id = 5'h1a;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_26_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_51 && cores_0_cpu_externalInterrupt_plic_target_ie_25);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_27_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_52;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_27_id = 5'h1b;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_27_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_53 && cores_0_cpu_externalInterrupt_plic_target_ie_26);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_28_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_54;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_28_id = 5'h1c;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_28_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_55 && cores_0_cpu_externalInterrupt_plic_target_ie_27);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_29_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_56;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_29_id = 5'h1d;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_29_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_57 && cores_0_cpu_externalInterrupt_plic_target_ie_28);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_30_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_58;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_30_id = 5'h1e;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_30_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_59 && cores_0_cpu_externalInterrupt_plic_target_ie_29);
  assign cores_0_cpu_externalInterrupt_plic_target_requests_31_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_60;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_31_id = 5'h1f;
  assign cores_0_cpu_externalInterrupt_plic_target_requests_31_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_61 && cores_0_cpu_externalInterrupt_plic_target_ie_30);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id = ((! cores_0_cpu_externalInterrupt_plic_target_requests_1_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_0_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_1_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_0_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_1 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id ? cores_0_cpu_externalInterrupt_plic_target_requests_0_priority : cores_0_cpu_externalInterrupt_plic_target_requests_1_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_2 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id ? cores_0_cpu_externalInterrupt_plic_target_requests_0_valid : cores_0_cpu_externalInterrupt_plic_target_requests_1_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_3 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_3_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_2_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_3_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_2_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_4 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_3 ? cores_0_cpu_externalInterrupt_plic_target_requests_2_priority : cores_0_cpu_externalInterrupt_plic_target_requests_3_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_5 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_3 ? cores_0_cpu_externalInterrupt_plic_target_requests_2_valid : cores_0_cpu_externalInterrupt_plic_target_requests_3_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_6 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_5_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_4_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_5_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_4_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_7 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_6 ? cores_0_cpu_externalInterrupt_plic_target_requests_4_priority : cores_0_cpu_externalInterrupt_plic_target_requests_5_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_8 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_6 ? cores_0_cpu_externalInterrupt_plic_target_requests_4_valid : cores_0_cpu_externalInterrupt_plic_target_requests_5_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_9 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_7_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_6_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_7_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_6_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_10 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_9 ? cores_0_cpu_externalInterrupt_plic_target_requests_6_priority : cores_0_cpu_externalInterrupt_plic_target_requests_7_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_11 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_9 ? cores_0_cpu_externalInterrupt_plic_target_requests_6_valid : cores_0_cpu_externalInterrupt_plic_target_requests_7_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_12 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_9_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_8_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_9_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_8_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_13 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_12 ? cores_0_cpu_externalInterrupt_plic_target_requests_8_priority : cores_0_cpu_externalInterrupt_plic_target_requests_9_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_14 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_12 ? cores_0_cpu_externalInterrupt_plic_target_requests_8_valid : cores_0_cpu_externalInterrupt_plic_target_requests_9_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_15 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_11_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_10_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_11_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_10_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_16 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_15 ? cores_0_cpu_externalInterrupt_plic_target_requests_10_priority : cores_0_cpu_externalInterrupt_plic_target_requests_11_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_17 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_15 ? cores_0_cpu_externalInterrupt_plic_target_requests_10_valid : cores_0_cpu_externalInterrupt_plic_target_requests_11_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_18 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_13_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_12_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_13_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_12_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_19 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_18 ? cores_0_cpu_externalInterrupt_plic_target_requests_12_priority : cores_0_cpu_externalInterrupt_plic_target_requests_13_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_20 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_18 ? cores_0_cpu_externalInterrupt_plic_target_requests_12_valid : cores_0_cpu_externalInterrupt_plic_target_requests_13_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_21 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_15_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_14_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_15_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_14_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_22 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_21 ? cores_0_cpu_externalInterrupt_plic_target_requests_14_priority : cores_0_cpu_externalInterrupt_plic_target_requests_15_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_23 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_21 ? cores_0_cpu_externalInterrupt_plic_target_requests_14_valid : cores_0_cpu_externalInterrupt_plic_target_requests_15_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_24 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_17_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_16_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_17_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_16_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_25 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_24 ? cores_0_cpu_externalInterrupt_plic_target_requests_16_priority : cores_0_cpu_externalInterrupt_plic_target_requests_17_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_26 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_24 ? cores_0_cpu_externalInterrupt_plic_target_requests_16_valid : cores_0_cpu_externalInterrupt_plic_target_requests_17_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_27 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_19_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_18_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_19_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_18_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_28 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_27 ? cores_0_cpu_externalInterrupt_plic_target_requests_18_priority : cores_0_cpu_externalInterrupt_plic_target_requests_19_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_29 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_27 ? cores_0_cpu_externalInterrupt_plic_target_requests_18_valid : cores_0_cpu_externalInterrupt_plic_target_requests_19_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_30 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_21_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_20_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_21_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_20_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_31 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_30 ? cores_0_cpu_externalInterrupt_plic_target_requests_20_priority : cores_0_cpu_externalInterrupt_plic_target_requests_21_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_32 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_30 ? cores_0_cpu_externalInterrupt_plic_target_requests_20_valid : cores_0_cpu_externalInterrupt_plic_target_requests_21_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_33 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_23_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_22_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_23_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_22_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_34 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_33 ? cores_0_cpu_externalInterrupt_plic_target_requests_22_priority : cores_0_cpu_externalInterrupt_plic_target_requests_23_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_35 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_33 ? cores_0_cpu_externalInterrupt_plic_target_requests_22_valid : cores_0_cpu_externalInterrupt_plic_target_requests_23_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_36 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_25_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_24_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_25_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_24_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_37 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_36 ? cores_0_cpu_externalInterrupt_plic_target_requests_24_priority : cores_0_cpu_externalInterrupt_plic_target_requests_25_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_38 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_36 ? cores_0_cpu_externalInterrupt_plic_target_requests_24_valid : cores_0_cpu_externalInterrupt_plic_target_requests_25_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_39 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_27_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_26_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_27_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_26_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_40 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_39 ? cores_0_cpu_externalInterrupt_plic_target_requests_26_priority : cores_0_cpu_externalInterrupt_plic_target_requests_27_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_41 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_39 ? cores_0_cpu_externalInterrupt_plic_target_requests_26_valid : cores_0_cpu_externalInterrupt_plic_target_requests_27_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_42 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_29_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_28_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_29_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_28_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_43 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_42 ? cores_0_cpu_externalInterrupt_plic_target_requests_28_priority : cores_0_cpu_externalInterrupt_plic_target_requests_29_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_44 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_42 ? cores_0_cpu_externalInterrupt_plic_target_requests_28_valid : cores_0_cpu_externalInterrupt_plic_target_requests_29_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_45 = ((! cores_0_cpu_externalInterrupt_plic_target_requests_31_valid) || (cores_0_cpu_externalInterrupt_plic_target_requests_30_valid && (cores_0_cpu_externalInterrupt_plic_target_requests_31_priority <= cores_0_cpu_externalInterrupt_plic_target_requests_30_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_46 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_45 ? cores_0_cpu_externalInterrupt_plic_target_requests_30_priority : cores_0_cpu_externalInterrupt_plic_target_requests_31_priority);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_47 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_45 ? cores_0_cpu_externalInterrupt_plic_target_requests_30_valid : cores_0_cpu_externalInterrupt_plic_target_requests_31_valid);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_48 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_5) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_2 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_4 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_1)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_49 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_48 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_1 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_4);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_50 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_48 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_2 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_5);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_51 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_11) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_8 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_10 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_7)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_52 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_51 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_7 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_10);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_53 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_51 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_8 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_11);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_54 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_17) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_14 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_16 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_13)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_55 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_54 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_13 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_16);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_56 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_54 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_14 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_17);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_57 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_23) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_20 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_22 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_19)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_58 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_57 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_19 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_22);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_59 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_57 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_20 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_23);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_60 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_29) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_26 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_28 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_25)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_61 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_60 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_25 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_28);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_62 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_60 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_26 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_29);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_63 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_35) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_32 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_34 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_31)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_64 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_63 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_31 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_34);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_65 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_63 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_32 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_35);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_66 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_41) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_38 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_40 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_37)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_67 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_66 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_37 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_40);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_68 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_66 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_38 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_41);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_69 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_47) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_44 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_46 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_43)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_70 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_69 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_43 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_46);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_71 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_69 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_44 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_47);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_72 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_53) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_50 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_52 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_49)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_72 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_49 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_52);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_73 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_72 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_50 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_53);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_74 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_59) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_56 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_58 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_55)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_1 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_74 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_55 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_58);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_75 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_74 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_56 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_59);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_76 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_65) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_62 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_64 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_61)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_2 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_76 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_61 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_64);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_77 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_76 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_62 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_65);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_78 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_71) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_68 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_70 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_67)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_3 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_78 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_67 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_70);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_79 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_78 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_68 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_71);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_80 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_75) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_73 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_1 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_4 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_80 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_1);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_80 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_73 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_75);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_81 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_79) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_77 && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_3 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_2)));
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_5 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_81 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_2 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_3);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid_1 = (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_81 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_77 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_79);
  assign _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_6 = ((! _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid_1) || (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid && (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_5 <= _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_4)));
  assign cores_0_cpu_externalInterrupt_plic_target_iep = (cores_0_cpu_externalInterrupt_plic_target_threshold < cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority);
  assign cores_0_cpu_externalInterrupt_plic_target_claim = (cores_0_cpu_externalInterrupt_plic_target_iep ? cores_0_cpu_externalInterrupt_plic_target_bestRequest_id : 5'h0);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_priority = 2'b00;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_id = 5'h0;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_valid = 1'b1;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_priority = _zz_plic_logic_bus_rsp_payload_fragment_data;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_id = 5'h01;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_1 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_0);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_2;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_id = 5'h02;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_3 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_1);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_4;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_id = 5'h03;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_5 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_2);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_6;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_id = 5'h04;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_7 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_3);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_8;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_id = 5'h05;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_9 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_4);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_10;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_id = 5'h06;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_11 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_5);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_12;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_id = 5'h07;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_13 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_6);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_14;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_id = 5'h08;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_15 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_7);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_16;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_id = 5'h09;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_17 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_8);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_18;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_id = 5'h0a;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_19 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_9);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_20;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_id = 5'h0b;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_21 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_10);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_22;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_id = 5'h0c;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_23 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_11);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_24;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_id = 5'h0d;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_25 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_12);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_26;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_id = 5'h0e;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_27 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_13);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_28;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_id = 5'h0f;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_29 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_14);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_30;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_id = 5'h10;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_31 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_15);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_32;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_id = 5'h11;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_33 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_16);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_34;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_id = 5'h12;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_35 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_17);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_36;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_id = 5'h13;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_37 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_18);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_38;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_id = 5'h14;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_39 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_19);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_40;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_id = 5'h15;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_41 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_20);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_42;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_id = 5'h16;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_43 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_21);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_44;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_id = 5'h17;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_45 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_22);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_46;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_id = 5'h18;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_47 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_23);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_48;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_id = 5'h19;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_49 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_24);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_50;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_id = 5'h1a;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_51 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_25);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_52;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_id = 5'h1b;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_53 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_26);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_54;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_id = 5'h1c;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_55 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_27);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_56;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_id = 5'h1d;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_57 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_28);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_58;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_id = 5'h1e;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_59 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_29);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_priority = _zz_plic_logic_bus_rsp_payload_fragment_data_60;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_id = 5'h1f;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_valid = (_zz_plic_logic_bus_rsp_payload_fragment_data_61 && cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_30);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_1 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_2 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_0_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_1_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_3 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_4 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_3 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_5 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_3 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_2_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_3_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_6 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_7 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_6 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_8 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_6 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_4_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_5_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_9 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_10 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_9 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_11 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_9 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_6_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_7_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_12 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_13 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_12 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_14 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_12 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_8_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_9_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_15 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_16 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_15 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_17 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_15 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_10_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_11_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_18 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_19 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_18 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_20 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_18 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_12_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_13_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_21 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_22 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_21 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_23 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_21 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_14_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_15_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_24 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_25 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_24 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_26 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_24 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_16_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_17_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_27 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_28 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_27 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_29 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_27 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_18_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_19_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_30 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_31 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_30 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_32 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_30 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_20_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_21_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_33 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_34 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_33 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_35 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_33 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_22_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_23_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_36 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_37 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_36 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_38 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_36 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_24_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_25_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_39 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_40 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_39 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_41 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_39 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_26_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_27_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_42 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_43 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_42 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_44 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_42 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_28_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_29_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_45 = ((! cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_valid) || (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_valid && (cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_priority <= cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_46 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_45 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_priority : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_priority);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_47 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_45 ? cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_30_valid : cores_0_cpu_externalSupervisorInterrupt_plic_target_requests_31_valid);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_48 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_5) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_2 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_4 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_1)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_49 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_48 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_1 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_4);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_50 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_48 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_2 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_5);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_51 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_11) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_8 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_10 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_7)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_52 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_51 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_7 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_10);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_53 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_51 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_8 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_11);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_54 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_17) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_14 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_16 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_13)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_55 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_54 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_13 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_16);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_56 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_54 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_14 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_17);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_57 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_23) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_20 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_22 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_19)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_58 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_57 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_19 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_22);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_59 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_57 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_20 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_23);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_60 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_29) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_26 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_28 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_25)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_61 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_60 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_25 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_28);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_62 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_60 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_26 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_29);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_63 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_35) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_32 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_34 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_31)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_64 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_63 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_31 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_34);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_65 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_63 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_32 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_35);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_66 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_41) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_38 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_40 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_37)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_67 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_66 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_37 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_40);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_68 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_66 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_38 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_41);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_69 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_47) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_44 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_46 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_43)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_70 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_69 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_43 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_46);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_71 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_69 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_44 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_47);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_72 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_53) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_50 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_52 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_49)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_72 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_49 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_52);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_73 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_72 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_50 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_53);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_74 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_59) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_56 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_58 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_55)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_1 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_74 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_55 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_58);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_75 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_74 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_56 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_59);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_76 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_65) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_62 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_64 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_61)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_2 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_76 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_61 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_64);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_77 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_76 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_62 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_65);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_78 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_71) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_68 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_70 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_67)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_3 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_78 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_67 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_70);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_79 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_78 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_68 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_71);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_80 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_75) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_73 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_1 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_4 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_80 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_1);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_80 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_73 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_75);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_81 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_79) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_77 && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_3 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_2)));
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_5 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_81 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_2 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_3);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid_1 = (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_81 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_77 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_79);
  assign _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_6 = ((! _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid_1) || (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid && (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_5 <= _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_4)));
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_iep = (cores_0_cpu_externalSupervisorInterrupt_plic_target_threshold < cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority);
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_claim = (cores_0_cpu_externalSupervisorInterrupt_plic_target_iep ? cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id : 5'h0);
  assign _zz_plic_logic_bus_rsp_payload_fragment_data = _zz_plic_logic_bus_rsp_payload_fragment_data_62;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_2 = _zz_plic_logic_bus_rsp_payload_fragment_data_63;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_4 = _zz_plic_logic_bus_rsp_payload_fragment_data_64;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_6 = _zz_plic_logic_bus_rsp_payload_fragment_data_65;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_8 = _zz_plic_logic_bus_rsp_payload_fragment_data_66;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_10 = _zz_plic_logic_bus_rsp_payload_fragment_data_67;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_12 = _zz_plic_logic_bus_rsp_payload_fragment_data_68;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_14 = _zz_plic_logic_bus_rsp_payload_fragment_data_69;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_16 = _zz_plic_logic_bus_rsp_payload_fragment_data_70;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_18 = _zz_plic_logic_bus_rsp_payload_fragment_data_71;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_20 = _zz_plic_logic_bus_rsp_payload_fragment_data_72;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_22 = _zz_plic_logic_bus_rsp_payload_fragment_data_73;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_24 = _zz_plic_logic_bus_rsp_payload_fragment_data_74;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_26 = _zz_plic_logic_bus_rsp_payload_fragment_data_75;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_28 = _zz_plic_logic_bus_rsp_payload_fragment_data_76;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_30 = _zz_plic_logic_bus_rsp_payload_fragment_data_77;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_32 = _zz_plic_logic_bus_rsp_payload_fragment_data_78;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_34 = _zz_plic_logic_bus_rsp_payload_fragment_data_79;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_36 = _zz_plic_logic_bus_rsp_payload_fragment_data_80;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_38 = _zz_plic_logic_bus_rsp_payload_fragment_data_81;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_40 = _zz_plic_logic_bus_rsp_payload_fragment_data_82;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_42 = _zz_plic_logic_bus_rsp_payload_fragment_data_83;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_44 = _zz_plic_logic_bus_rsp_payload_fragment_data_84;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_46 = _zz_plic_logic_bus_rsp_payload_fragment_data_85;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_48 = _zz_plic_logic_bus_rsp_payload_fragment_data_86;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_50 = _zz_plic_logic_bus_rsp_payload_fragment_data_87;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_52 = _zz_plic_logic_bus_rsp_payload_fragment_data_88;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_54 = _zz_plic_logic_bus_rsp_payload_fragment_data_89;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_56 = _zz_plic_logic_bus_rsp_payload_fragment_data_90;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_58 = _zz_plic_logic_bus_rsp_payload_fragment_data_91;
  assign _zz_plic_logic_bus_rsp_payload_fragment_data_60 = _zz_plic_logic_bus_rsp_payload_fragment_data_92;
  always @(*) begin
    plic_logic_bridge_claim_valid = 1'b0;
    case(plic_logic_bmb_cmd_payload_fragment_address)
      22'h200004 : begin
        if(plic_logic_bus_doRead) begin
          plic_logic_bridge_claim_valid = 1'b1;
        end
      end
      22'h201004 : begin
        if(plic_logic_bus_doRead) begin
          plic_logic_bridge_claim_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    plic_logic_bridge_claim_payload = 5'bxxxxx;
    case(plic_logic_bmb_cmd_payload_fragment_address)
      22'h200004 : begin
        if(plic_logic_bus_doRead) begin
          plic_logic_bridge_claim_payload = cores_0_cpu_externalInterrupt_plic_target_claim;
        end
      end
      22'h201004 : begin
        if(plic_logic_bus_doRead) begin
          plic_logic_bridge_claim_payload = cores_0_cpu_externalSupervisorInterrupt_plic_target_claim;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    plic_logic_bridge_completion_valid = 1'b0;
    if(plic_logic_bridge_targetMapping_0_targetCompletion_valid) begin
      plic_logic_bridge_completion_valid = 1'b1;
    end
    if(plic_logic_bridge_targetMapping_1_targetCompletion_valid) begin
      plic_logic_bridge_completion_valid = 1'b1;
    end
  end

  always @(*) begin
    plic_logic_bridge_completion_payload = 5'bxxxxx;
    if(plic_logic_bridge_targetMapping_0_targetCompletion_valid) begin
      plic_logic_bridge_completion_payload = plic_logic_bridge_targetMapping_0_targetCompletion_payload;
    end
    if(plic_logic_bridge_targetMapping_1_targetCompletion_valid) begin
      plic_logic_bridge_completion_payload = plic_logic_bridge_targetMapping_1_targetCompletion_payload;
    end
  end

  always @(*) begin
    plic_logic_bridge_coherencyStall_willIncrement = 1'b0;
    if(when_PlicMapper_l122) begin
      plic_logic_bridge_coherencyStall_willIncrement = 1'b1;
    end
    if(when_BmbSlaveFactory_l77) begin
      if(plic_logic_bus_askWrite) begin
        plic_logic_bridge_coherencyStall_willIncrement = 1'b1;
      end
      if(plic_logic_bus_askRead) begin
        plic_logic_bridge_coherencyStall_willIncrement = 1'b1;
      end
    end
  end

  assign plic_logic_bridge_coherencyStall_willClear = 1'b0;
  assign plic_logic_bridge_coherencyStall_willOverflowIfInc = (plic_logic_bridge_coherencyStall_value == 1'b1);
  assign plic_logic_bridge_coherencyStall_willOverflow = (plic_logic_bridge_coherencyStall_willOverflowIfInc && plic_logic_bridge_coherencyStall_willIncrement);
  always @(*) begin
    plic_logic_bridge_coherencyStall_valueNext = (plic_logic_bridge_coherencyStall_value + plic_logic_bridge_coherencyStall_willIncrement);
    if(plic_logic_bridge_coherencyStall_willClear) begin
      plic_logic_bridge_coherencyStall_valueNext = 1'b0;
    end
  end

  assign when_PlicMapper_l122 = (plic_logic_bridge_coherencyStall_value != 1'b0);
  assign cores_0_cpu_externalInterrupt_plic_target_threshold = _zz_cores_0_cpu_externalInterrupt_plic_target_threshold;
  always @(*) begin
    plic_logic_bridge_targetMapping_0_targetCompletion_valid = 1'b0;
    case(plic_logic_bmb_cmd_payload_fragment_address)
      22'h200004 : begin
        if(plic_logic_bus_doWrite) begin
          plic_logic_bridge_targetMapping_0_targetCompletion_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign cores_0_cpu_externalInterrupt_plic_target_ie_0 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_0;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_1 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_1;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_2 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_2;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_3 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_3;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_4 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_4;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_5 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_5;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_6 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_6;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_7 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_7;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_8 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_8;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_9 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_9;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_10 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_10;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_11 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_11;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_12 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_12;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_13 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_13;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_14 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_14;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_15 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_15;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_16 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_16;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_17 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_17;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_18 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_18;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_19 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_19;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_20 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_20;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_21 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_21;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_22 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_22;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_23 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_23;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_24 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_24;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_25 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_25;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_26 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_26;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_27 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_27;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_28 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_28;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_29 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_29;
  assign cores_0_cpu_externalInterrupt_plic_target_ie_30 = _zz_cores_0_cpu_externalInterrupt_plic_target_ie_30;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_threshold = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_threshold;
  always @(*) begin
    plic_logic_bridge_targetMapping_1_targetCompletion_valid = 1'b0;
    case(plic_logic_bmb_cmd_payload_fragment_address)
      22'h201004 : begin
        if(plic_logic_bus_doWrite) begin
          plic_logic_bridge_targetMapping_1_targetCompletion_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_0 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_0;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_1 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_1;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_2 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_2;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_3 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_3;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_4 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_4;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_5 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_5;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_6 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_6;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_7 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_7;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_8 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_8;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_9 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_9;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_10 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_10;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_11 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_11;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_12 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_12;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_13 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_13;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_14 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_14;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_15 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_15;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_16 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_16;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_17 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_17;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_18 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_18;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_19 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_19;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_20 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_20;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_21 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_21;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_22 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_22;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_23 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_23;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_24 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_24;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_25 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_25;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_26 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_26;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_27 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_27;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_28 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_28;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_29 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_29;
  assign cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_30 = _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_30;
  assign cores_0_cpu_logic_cpu_timerInterrupt = clint_logic_io_timerInterrupt[0];
  assign cores_0_cpu_logic_cpu_softwareInterrupt = clint_logic_io_softwareInterrupt[0];
  assign bufferCC_6_io_dataIn = (1'b0 ^ 1'b0);
  assign plic_logic_bmb_cmd_valid = plicWishboneBridge_logic_bridge_io_output_cmd_valid;
  assign plic_logic_bmb_rsp_ready = plicWishboneBridge_logic_bridge_io_output_rsp_ready;
  assign plic_logic_bmb_cmd_payload_last = plicWishboneBridge_logic_bridge_io_output_cmd_payload_last;
  assign plic_logic_bmb_cmd_payload_fragment_opcode = plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_opcode;
  assign plic_logic_bmb_cmd_payload_fragment_address = plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_address;
  assign plic_logic_bmb_cmd_payload_fragment_length = plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_length;
  assign plic_logic_bmb_cmd_payload_fragment_data = plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_data;
  assign plic_logic_bmb_cmd_payload_fragment_mask = plicWishboneBridge_logic_bridge_io_output_cmd_payload_fragment_mask;
  assign clintWishbone_ACK = clintWishboneBridge_logic_bridge_io_input_ACK;
  assign clintWishbone_DAT_MISO = clintWishboneBridge_logic_bridge_io_input_DAT_MISO;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_ready = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_valid = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_valid || (! toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN));
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_last = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN ? toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_last : toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_last);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_opcode = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN ? toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_opcode : toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_opcode);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_address = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN ? toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_address : toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_address);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_length = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN ? toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length : toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_length);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_data = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN ? toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_data : toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_data);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_mask = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN ? toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_mask : toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_mask);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_context = (toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN ? toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_context : toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_context);
  always @(*) begin
    toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_ready = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_ready;
    if(when_Stream_l372_1) begin
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l372_1 = (! toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_valid);
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_valid = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rValid;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_last = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_last;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_opcode;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_address = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_address;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_length = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_length;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_data = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_data;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_mask = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_mask;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_context = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_context;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_ready = cores_0_cpu_dBus_connector_decoder_cmd_ready;
  always @(*) begin
    _zz_cores_0_cpu_dBus_connector_decoder_rsp_ready = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_ready;
    if(when_Stream_l372_2) begin
      _zz_cores_0_cpu_dBus_connector_decoder_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l372_2 = (! _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid);
  assign _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid = _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid_1;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid = _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_last = _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_last;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_opcode = _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_opcode;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_data = _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_data;
  assign toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_context = _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_context;
  assign cores_0_cpu_dBus_connector_decoder_cmd_valid = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_valid;
  assign cores_0_cpu_dBus_connector_decoder_rsp_ready = _zz_cores_0_cpu_dBus_connector_decoder_rsp_ready;
  assign cores_0_cpu_dBus_connector_decoder_cmd_payload_last = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_last;
  assign cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_opcode = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  assign cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_address = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  assign cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_length = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  assign cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_data = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  assign cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_mask = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  assign cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_context = toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  assign plicWishbone_ACK = plicWishboneBridge_logic_bridge_io_input_ACK;
  assign plicWishbone_DAT_MISO = plicWishboneBridge_logic_bridge_io_input_DAT_MISO;
  assign cores_0_cpu_iBus_cmd_halfPipe_fire = (cores_0_cpu_iBus_cmd_halfPipe_valid && cores_0_cpu_iBus_cmd_halfPipe_ready);
  assign cores_0_cpu_iBus_cmd_ready = (! cores_0_cpu_iBus_cmd_rValid);
  assign cores_0_cpu_iBus_cmd_halfPipe_valid = cores_0_cpu_iBus_cmd_rValid;
  assign cores_0_cpu_iBus_cmd_halfPipe_payload_last = cores_0_cpu_iBus_cmd_rData_last;
  assign cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_opcode = cores_0_cpu_iBus_cmd_rData_fragment_opcode;
  assign cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_address = cores_0_cpu_iBus_cmd_rData_fragment_address;
  assign cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_length = cores_0_cpu_iBus_cmd_rData_fragment_length;
  assign cores_0_cpu_iBus_cmd_halfPipe_ready = cores_0_cpu_iBus_connector_decoder_cmd_ready;
  always @(*) begin
    _zz_cores_0_cpu_iBus_connector_decoder_rsp_ready = cores_0_cpu_iBus_rsp_ready;
    if(when_Stream_l372_3) begin
      _zz_cores_0_cpu_iBus_connector_decoder_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l372_3 = (! _zz_cores_0_cpu_iBus_rsp_valid);
  assign _zz_cores_0_cpu_iBus_rsp_valid = _zz_cores_0_cpu_iBus_rsp_valid_1;
  assign cores_0_cpu_iBus_rsp_valid = _zz_cores_0_cpu_iBus_rsp_valid;
  assign cores_0_cpu_iBus_rsp_payload_last = _zz_cores_0_cpu_iBus_rsp_payload_last;
  assign cores_0_cpu_iBus_rsp_payload_fragment_opcode = _zz_cores_0_cpu_iBus_rsp_payload_fragment_opcode;
  assign cores_0_cpu_iBus_rsp_payload_fragment_data = _zz_cores_0_cpu_iBus_rsp_payload_fragment_data;
  assign cores_0_cpu_iBus_connector_decoder_cmd_valid = cores_0_cpu_iBus_cmd_halfPipe_valid;
  assign cores_0_cpu_iBus_connector_decoder_rsp_ready = _zz_cores_0_cpu_iBus_connector_decoder_rsp_ready;
  assign cores_0_cpu_iBus_connector_decoder_cmd_payload_last = cores_0_cpu_iBus_cmd_halfPipe_payload_last;
  assign cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_opcode = cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_opcode;
  assign cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_address = cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_address;
  assign cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_length = cores_0_cpu_iBus_cmd_halfPipe_payload_fragment_length;
  assign customDebug_debugBridge_logic_mmMaster_cmd_ready = customDebug_debugBridge_bmb_decoder_io_input_cmd_ready;
  assign customDebug_debugBridge_logic_mmMaster_rsp_valid = customDebug_debugBridge_bmb_decoder_io_input_rsp_valid;
  assign customDebug_debugBridge_logic_mmMaster_rsp_payload_last = customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_last;
  assign customDebug_debugBridge_logic_mmMaster_rsp_payload_fragment_opcode = customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_fragment_opcode;
  assign customDebug_debugBridge_logic_mmMaster_rsp_payload_fragment_data = customDebug_debugBridge_bmb_decoder_io_input_rsp_payload_fragment_data;
  assign dBusCoherent_bmb_cmd_valid = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = dBusCoherent_bmb_cmd_ready;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = dBusCoherent_bmb_rsp_valid;
  assign dBusCoherent_bmb_rsp_ready = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign dBusCoherent_bmb_cmd_payload_last = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = dBusCoherent_bmb_rsp_payload_last;
  assign dBusCoherent_bmb_cmd_payload_fragment_opcode = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign dBusCoherent_bmb_cmd_payload_fragment_address = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign dBusCoherent_bmb_cmd_payload_fragment_length = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign dBusCoherent_bmb_cmd_payload_fragment_data = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  assign dBusCoherent_bmb_cmd_payload_fragment_mask = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  assign dBusCoherent_bmb_cmd_payload_fragment_context = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = dBusCoherent_bmb_rsp_payload_fragment_opcode;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = dBusCoherent_bmb_rsp_payload_fragment_data;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = dBusCoherent_bmb_rsp_payload_fragment_context;
  assign cores_0_cpu_debugBmb_cmd_valid = cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = cores_0_cpu_debugBmb_cmd_ready;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = cores_0_cpu_debugBmb_rsp_valid;
  assign cores_0_cpu_debugBmb_rsp_ready = cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign cores_0_cpu_debugBmb_cmd_payload_last = cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = cores_0_cpu_debugBmb_rsp_payload_last;
  assign cores_0_cpu_debugBmb_cmd_payload_fragment_opcode = cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign cores_0_cpu_debugBmb_cmd_payload_fragment_address = cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign cores_0_cpu_debugBmb_cmd_payload_fragment_length = cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign cores_0_cpu_debugBmb_cmd_payload_fragment_data = cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  assign cores_0_cpu_debugBmb_cmd_payload_fragment_mask = cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = cores_0_cpu_debugBmb_rsp_payload_fragment_opcode;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = cores_0_cpu_debugBmb_rsp_payload_fragment_data;
  assign cores_0_cpu_logic_cpu_debug_bus_cmd_payload_wr = (cores_0_cpu_debugBmb_cmd_payload_fragment_opcode == 1'b1);
  assign toplevel_cores_0_cpu_logic_cpu_debug_bus_cmd_fire = (cores_0_cpu_debugBmb_cmd_valid && cores_0_cpu_logic_cpu_debug_bus_cmd_ready);
  assign cores_0_cpu_debugBmb_cmd_ready = cores_0_cpu_logic_cpu_debug_bus_cmd_ready;
  assign cores_0_cpu_debugBmb_rsp_valid = toplevel_cores_0_cpu_logic_cpu_debug_bus_cmd_fire_regNext;
  assign cores_0_cpu_debugBmb_rsp_payload_last = 1'b1;
  assign cores_0_cpu_debugBmb_rsp_payload_fragment_opcode = 1'b0;
  assign cores_0_cpu_debugBmb_rsp_payload_fragment_data = cores_0_cpu_logic_cpu_debug_bus_rsp_data;
  assign iArbiter_bmb_cmd_valid = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = iArbiter_bmb_cmd_ready;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = iArbiter_bmb_rsp_valid;
  assign iArbiter_bmb_rsp_ready = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign iArbiter_bmb_cmd_payload_last = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = iArbiter_bmb_rsp_payload_last;
  assign iArbiter_bmb_cmd_payload_fragment_opcode = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign iArbiter_bmb_cmd_payload_fragment_address = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign iArbiter_bmb_cmd_payload_fragment_length = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = iArbiter_bmb_rsp_payload_fragment_opcode;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = iArbiter_bmb_rsp_payload_fragment_data;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = cores_0_cpu_dBus_connector_decoder_cmd_valid;
  assign cores_0_cpu_dBus_connector_decoder_cmd_ready = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  assign cores_0_cpu_dBus_connector_decoder_rsp_valid = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = cores_0_cpu_dBus_connector_decoder_rsp_ready;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = cores_0_cpu_dBus_connector_decoder_cmd_payload_last;
  assign cores_0_cpu_dBus_connector_decoder_rsp_payload_last = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_opcode;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_address;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_length;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_data;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask = cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_mask;
  assign dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = cores_0_cpu_dBus_connector_decoder_cmd_payload_fragment_context;
  assign cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_opcode = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  assign cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_data = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  assign cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_context = dBusCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_valid;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = customDebug_debugBridge_bmb_decoder_io_outputs_0_rsp_ready;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_last;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_address[7:0];
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_length;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_data;
  assign cores_0_cpu_debugBmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask = customDebug_debugBridge_bmb_decoder_io_outputs_0_cmd_payload_fragment_mask;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = cores_0_cpu_iBus_connector_decoder_cmd_valid;
  assign cores_0_cpu_iBus_connector_decoder_cmd_ready = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  assign cores_0_cpu_iBus_connector_decoder_rsp_valid = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = cores_0_cpu_iBus_connector_decoder_rsp_ready;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = cores_0_cpu_iBus_connector_decoder_cmd_payload_last;
  assign cores_0_cpu_iBus_connector_decoder_rsp_payload_last = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_opcode;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_address;
  assign iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = cores_0_cpu_iBus_connector_decoder_cmd_payload_fragment_length;
  assign cores_0_cpu_iBus_connector_decoder_rsp_payload_fragment_opcode = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  assign cores_0_cpu_iBus_connector_decoder_rsp_payload_fragment_data = iArbiter_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  assign dBusCoherent_bmb_cmd_ready = dBusCoherent_bmb_cmd_rValidN;
  assign dBusCoherent_bmb_cmd_s2mPipe_valid = (dBusCoherent_bmb_cmd_valid || (! dBusCoherent_bmb_cmd_rValidN));
  assign dBusCoherent_bmb_cmd_s2mPipe_payload_last = (dBusCoherent_bmb_cmd_rValidN ? dBusCoherent_bmb_cmd_payload_last : dBusCoherent_bmb_cmd_rData_last);
  assign dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_opcode = (dBusCoherent_bmb_cmd_rValidN ? dBusCoherent_bmb_cmd_payload_fragment_opcode : dBusCoherent_bmb_cmd_rData_fragment_opcode);
  assign dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_address = (dBusCoherent_bmb_cmd_rValidN ? dBusCoherent_bmb_cmd_payload_fragment_address : dBusCoherent_bmb_cmd_rData_fragment_address);
  assign dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_length = (dBusCoherent_bmb_cmd_rValidN ? dBusCoherent_bmb_cmd_payload_fragment_length : dBusCoherent_bmb_cmd_rData_fragment_length);
  assign dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_data = (dBusCoherent_bmb_cmd_rValidN ? dBusCoherent_bmb_cmd_payload_fragment_data : dBusCoherent_bmb_cmd_rData_fragment_data);
  assign dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_mask = (dBusCoherent_bmb_cmd_rValidN ? dBusCoherent_bmb_cmd_payload_fragment_mask : dBusCoherent_bmb_cmd_rData_fragment_mask);
  assign dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_context = (dBusCoherent_bmb_cmd_rValidN ? dBusCoherent_bmb_cmd_payload_fragment_context : dBusCoherent_bmb_cmd_rData_fragment_context);
  always @(*) begin
    dBusCoherent_bmb_cmd_s2mPipe_ready = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_ready;
    if(when_Stream_l372_4) begin
      dBusCoherent_bmb_cmd_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l372_4 = (! dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_valid);
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_valid = dBusCoherent_bmb_cmd_s2mPipe_rValid;
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_last = dBusCoherent_bmb_cmd_s2mPipe_rData_last;
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_opcode = dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_opcode;
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_address = dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_address;
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_length = dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_length;
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_data = dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_data;
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_mask = dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_mask;
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_context = dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_context;
  assign dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_ready = dBusCoherent_bmb_connector_decoder_cmd_ready;
  assign dBusCoherent_bmb_rsp_valid = dBusCoherent_bmb_connector_decoder_rsp_valid;
  assign dBusCoherent_bmb_rsp_payload_last = dBusCoherent_bmb_connector_decoder_rsp_payload_last;
  assign dBusCoherent_bmb_rsp_payload_fragment_opcode = dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_opcode;
  assign dBusCoherent_bmb_rsp_payload_fragment_data = dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_data;
  assign dBusCoherent_bmb_rsp_payload_fragment_context = dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_context;
  assign dBusCoherent_bmb_connector_decoder_cmd_valid = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_valid;
  assign dBusCoherent_bmb_connector_decoder_rsp_ready = dBusCoherent_bmb_rsp_ready;
  assign dBusCoherent_bmb_connector_decoder_cmd_payload_last = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_last;
  assign dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_opcode = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  assign dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_address = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  assign dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_length = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  assign dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_data = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  assign dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_mask = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  assign dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_context = dBusCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  assign dBusNonCoherent_bmb_cmd_valid = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready = dBusNonCoherent_bmb_cmd_ready;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid = dBusNonCoherent_bmb_rsp_valid;
  assign dBusNonCoherent_bmb_rsp_ready = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready;
  assign dBusNonCoherent_bmb_cmd_payload_last = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last = dBusNonCoherent_bmb_rsp_payload_last;
  assign dBusNonCoherent_bmb_cmd_payload_fragment_opcode = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode;
  assign dBusNonCoherent_bmb_cmd_payload_fragment_address = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address;
  assign dBusNonCoherent_bmb_cmd_payload_fragment_length = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length;
  assign dBusNonCoherent_bmb_cmd_payload_fragment_data = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data;
  assign dBusNonCoherent_bmb_cmd_payload_fragment_mask = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask;
  assign dBusNonCoherent_bmb_cmd_payload_fragment_context = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode = dBusNonCoherent_bmb_rsp_payload_fragment_opcode;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data = dBusNonCoherent_bmb_rsp_payload_fragment_data;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context = dBusNonCoherent_bmb_rsp_payload_fragment_context;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_valid = dBusCoherent_bmb_connector_decoder_cmd_valid;
  assign dBusCoherent_bmb_connector_decoder_cmd_ready = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_ready;
  assign dBusCoherent_bmb_connector_decoder_rsp_valid = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_valid;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_ready = dBusCoherent_bmb_connector_decoder_rsp_ready;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_last = dBusCoherent_bmb_connector_decoder_cmd_payload_last;
  assign dBusCoherent_bmb_connector_decoder_rsp_payload_last = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_last;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_opcode = dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_opcode;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_address = dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_address;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_length = dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_length;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_data = dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_data;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_mask = dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_mask;
  assign dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_cmd_payload_fragment_context = dBusCoherent_bmb_connector_decoder_cmd_payload_fragment_context;
  assign dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_opcode = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_opcode;
  assign dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_data = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_data;
  assign dBusCoherent_bmb_connector_decoder_rsp_payload_fragment_context = dBusNonCoherent_bmb_slaveModel_arbiterGen_oneToOne_arbiter_rsp_payload_fragment_context;
  assign iArbiter_bmb_cmd_halfPipe_fire = (iArbiter_bmb_cmd_halfPipe_valid && iArbiter_bmb_cmd_halfPipe_ready);
  assign iArbiter_bmb_cmd_ready = (! iArbiter_bmb_cmd_rValid);
  assign iArbiter_bmb_cmd_halfPipe_valid = iArbiter_bmb_cmd_rValid;
  assign iArbiter_bmb_cmd_halfPipe_payload_last = iArbiter_bmb_cmd_rData_last;
  assign iArbiter_bmb_cmd_halfPipe_payload_fragment_opcode = iArbiter_bmb_cmd_rData_fragment_opcode;
  assign iArbiter_bmb_cmd_halfPipe_payload_fragment_address = iArbiter_bmb_cmd_rData_fragment_address;
  assign iArbiter_bmb_cmd_halfPipe_payload_fragment_length = iArbiter_bmb_cmd_rData_fragment_length;
  assign iArbiter_bmb_cmd_halfPipe_ready = iArbiter_bmb_decoder_io_input_cmd_ready;
  always @(*) begin
    _zz_io_input_rsp_ready = iArbiter_bmb_rsp_ready;
    if(when_Stream_l372_5) begin
      _zz_io_input_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l372_5 = (! _zz_iArbiter_bmb_rsp_valid);
  assign _zz_iArbiter_bmb_rsp_valid = _zz_iArbiter_bmb_rsp_valid_1;
  assign iArbiter_bmb_rsp_valid = _zz_iArbiter_bmb_rsp_valid;
  assign iArbiter_bmb_rsp_payload_last = _zz_iArbiter_bmb_rsp_payload_last;
  assign iArbiter_bmb_rsp_payload_fragment_opcode = _zz_iArbiter_bmb_rsp_payload_fragment_opcode;
  assign iArbiter_bmb_rsp_payload_fragment_data = _zz_iArbiter_bmb_rsp_payload_fragment_data;
  assign dBusNonCoherent_bmb_cmd_ready = dBusNonCoherent_bmb_cmd_rValidN;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_valid = (dBusNonCoherent_bmb_cmd_valid || (! dBusNonCoherent_bmb_cmd_rValidN));
  assign dBusNonCoherent_bmb_cmd_s2mPipe_payload_last = (dBusNonCoherent_bmb_cmd_rValidN ? dBusNonCoherent_bmb_cmd_payload_last : dBusNonCoherent_bmb_cmd_rData_last);
  assign dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_opcode = (dBusNonCoherent_bmb_cmd_rValidN ? dBusNonCoherent_bmb_cmd_payload_fragment_opcode : dBusNonCoherent_bmb_cmd_rData_fragment_opcode);
  assign dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_address = (dBusNonCoherent_bmb_cmd_rValidN ? dBusNonCoherent_bmb_cmd_payload_fragment_address : dBusNonCoherent_bmb_cmd_rData_fragment_address);
  assign dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_length = (dBusNonCoherent_bmb_cmd_rValidN ? dBusNonCoherent_bmb_cmd_payload_fragment_length : dBusNonCoherent_bmb_cmd_rData_fragment_length);
  assign dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_data = (dBusNonCoherent_bmb_cmd_rValidN ? dBusNonCoherent_bmb_cmd_payload_fragment_data : dBusNonCoherent_bmb_cmd_rData_fragment_data);
  assign dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_mask = (dBusNonCoherent_bmb_cmd_rValidN ? dBusNonCoherent_bmb_cmd_payload_fragment_mask : dBusNonCoherent_bmb_cmd_rData_fragment_mask);
  assign dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_context = (dBusNonCoherent_bmb_cmd_rValidN ? dBusNonCoherent_bmb_cmd_payload_fragment_context : dBusNonCoherent_bmb_cmd_rData_fragment_context);
  always @(*) begin
    dBusNonCoherent_bmb_cmd_s2mPipe_ready = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_ready;
    if(when_Stream_l372_6) begin
      dBusNonCoherent_bmb_cmd_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l372_6 = (! dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_valid);
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_valid = dBusNonCoherent_bmb_cmd_s2mPipe_rValid;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_last = dBusNonCoherent_bmb_cmd_s2mPipe_rData_last;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_opcode = dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_opcode;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_address = dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_address;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_length = dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_length;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_data = dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_data;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_mask = dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_mask;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_context = dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_context;
  assign dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_ready = peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_ready;
  always @(*) begin
    _zz_peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready = dBusNonCoherent_bmb_rsp_ready;
    if(when_Stream_l372_7) begin
      _zz_peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l372_7 = (! _zz_dBusNonCoherent_bmb_rsp_valid);
  assign _zz_dBusNonCoherent_bmb_rsp_valid = _zz_dBusNonCoherent_bmb_rsp_valid_1;
  assign dBusNonCoherent_bmb_rsp_valid = _zz_dBusNonCoherent_bmb_rsp_valid;
  assign dBusNonCoherent_bmb_rsp_payload_last = _zz_dBusNonCoherent_bmb_rsp_payload_last;
  assign dBusNonCoherent_bmb_rsp_payload_fragment_opcode = _zz_dBusNonCoherent_bmb_rsp_payload_fragment_opcode;
  assign dBusNonCoherent_bmb_rsp_payload_fragment_data = _zz_dBusNonCoherent_bmb_rsp_payload_fragment_data;
  assign dBusNonCoherent_bmb_rsp_payload_fragment_context = _zz_dBusNonCoherent_bmb_rsp_payload_fragment_context;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_valid = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_valid;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready = _zz_peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_last = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_last;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_opcode = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_address = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_length = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_data = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_mask = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_payload_fragment_context = dBusNonCoherent_bmb_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  assign peripheral_CYC = peripheralBridge_logic_io_output_CYC;
  assign peripheral_STB = peripheralBridge_logic_io_output_STB;
  assign peripheral_WE = peripheralBridge_logic_io_output_WE;
  assign peripheral_ADR = peripheralBridge_logic_io_output_ADR;
  assign peripheral_DAT_MOSI = peripheralBridge_logic_io_output_DAT_MOSI;
  assign peripheral_SEL = peripheralBridge_logic_io_output_SEL;
  assign peripheral_CTI = peripheralBridge_logic_io_output_CTI;
  assign peripheral_BTE = peripheralBridge_logic_io_output_BTE;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_valid = (peripheralBridge_bmb_arbiter_io_output_cmd_valid || (! toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN));
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_last = (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN ? peripheralBridge_bmb_arbiter_io_output_cmd_payload_last : toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_last);
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_source = (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN ? peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_source : toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_source);
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_opcode = (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN ? peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_opcode : toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_opcode);
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_address = (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN ? peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_address : toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_address);
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_length = (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN ? peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_length : toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_length);
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_data = (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN ? peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_data : toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_data);
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_mask = (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN ? peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_mask : toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_mask);
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_context = (toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN ? peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_context : toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_context);
  always @(*) begin
    toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_ready = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_ready;
    if(when_Stream_l372_8) begin
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l372_8 = (! toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_valid);
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_valid = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rValid;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_last = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_last;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_source = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_source;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_opcode = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_opcode;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_address = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_address;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_length = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_length;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_data = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_data;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_mask = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_mask;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_payload_fragment_context = toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_context;
  assign toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_m2sPipe_ready = peripheralBridge_logic_io_input_cmd_ready;
  always @(*) begin
    _zz_io_input_rsp_ready_1 = peripheralBridge_bmb_arbiter_io_output_rsp_ready;
    if(when_Stream_l372_9) begin
      _zz_io_input_rsp_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l372_9 = (! _zz_when_Stream_l372);
  assign _zz_when_Stream_l372 = _zz_when_Stream_l372_1;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_cmd_ready = peripheralBridge_bmb_arbiter_io_inputs_0_cmd_ready;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_valid = peripheralBridge_bmb_arbiter_io_inputs_0_rsp_valid;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_last = peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_last;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_opcode = peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_data = peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data;
  assign peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_context = peripheralBridge_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context;
  assign peripheralBridge_bmb_arbiter_io_inputs_1_cmd_payload_fragment_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign peripheralBridge_bmb_arbiter_io_inputs_1_cmd_payload_fragment_mask = 4'bxxxx;
  assign plic_logic_bridge_targetMapping_0_targetCompletion_payload = plic_logic_bmb_cmd_payload_fragment_data[4 : 0];
  assign plic_logic_bridge_targetMapping_1_targetCompletion_payload = plic_logic_bmb_cmd_payload_fragment_data[4 : 0];
  assign when_BusSlaveFactory_l1041 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_1 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_2 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_3 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_4 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_5 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_6 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_7 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_8 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_9 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_10 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_11 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_12 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_13 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_14 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_15 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_16 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_17 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_18 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_19 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_20 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_21 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_22 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_23 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_24 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_25 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_26 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_27 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_28 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_29 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_30 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_31 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_32 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_33 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_34 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_35 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_36 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_37 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_38 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_39 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_40 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_41 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_42 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_43 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_44 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_45 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_46 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_47 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_48 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_49 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_50 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_51 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_52 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_53 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_54 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_55 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_56 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_57 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_58 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_59 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_60 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_61 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_62 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_63 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_64 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_65 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_66 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_67 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_68 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_69 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_70 = plic_logic_bmb_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_71 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_72 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_73 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_74 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_75 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_76 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_77 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_78 = plic_logic_bmb_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_79 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_80 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_81 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_82 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_83 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_84 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_85 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_86 = plic_logic_bmb_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_87 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_88 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_89 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_90 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_91 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_92 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_93 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BusSlaveFactory_l1041_94 = plic_logic_bmb_cmd_payload_fragment_mask[3];
  assign when_BmbSlaveFactory_l77 = 1'b1;
  assign clint_logic_io_stop = 1'b0;
  always @(posedge debugCd_external_clk) begin
    if(when_ClockDomainGenerator_l222) begin
      debugCd_logic_holdingLogic_resetCounter <= (debugCd_logic_holdingLogic_resetCounter + 12'h001);
    end
    if(debugCd_logic_inputResetTrigger) begin
      debugCd_logic_holdingLogic_resetCounter <= 12'h0;
    end
    debugCd_logic_outputReset <= debugCd_logic_outputResetUnbuffered;
    if(when_ClockDomainGenerator_l222_1) begin
      systemCd_logic_holdingLogic_resetCounter <= (systemCd_logic_holdingLogic_resetCounter + 6'h01);
    end
    if(systemCd_logic_inputResetTrigger) begin
      systemCd_logic_holdingLogic_resetCounter <= 6'h0;
    end
    systemCd_logic_outputReset <= systemCd_logic_outputResetUnbuffered;
  end

  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      _zz_plic_logic_bus_rsp_payload_fragment_data_1 <= 1'b0;
      _zz_when_PlicGateway_l21_1 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_3 <= 1'b0;
      _zz_when_PlicGateway_l21_3 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_5 <= 1'b0;
      _zz_when_PlicGateway_l21_5 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_7 <= 1'b0;
      _zz_when_PlicGateway_l21_7 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_9 <= 1'b0;
      _zz_when_PlicGateway_l21_9 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_11 <= 1'b0;
      _zz_when_PlicGateway_l21_11 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_13 <= 1'b0;
      _zz_when_PlicGateway_l21_13 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_15 <= 1'b0;
      _zz_when_PlicGateway_l21_15 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_17 <= 1'b0;
      _zz_when_PlicGateway_l21_17 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_19 <= 1'b0;
      _zz_when_PlicGateway_l21_19 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_21 <= 1'b0;
      _zz_when_PlicGateway_l21_21 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_23 <= 1'b0;
      _zz_when_PlicGateway_l21_23 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_25 <= 1'b0;
      _zz_when_PlicGateway_l21_25 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_27 <= 1'b0;
      _zz_when_PlicGateway_l21_27 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_29 <= 1'b0;
      _zz_when_PlicGateway_l21_29 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_31 <= 1'b0;
      _zz_when_PlicGateway_l21_31 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_33 <= 1'b0;
      _zz_when_PlicGateway_l21_33 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_35 <= 1'b0;
      _zz_when_PlicGateway_l21_35 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_37 <= 1'b0;
      _zz_when_PlicGateway_l21_37 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_39 <= 1'b0;
      _zz_when_PlicGateway_l21_39 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_41 <= 1'b0;
      _zz_when_PlicGateway_l21_41 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_43 <= 1'b0;
      _zz_when_PlicGateway_l21_43 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_45 <= 1'b0;
      _zz_when_PlicGateway_l21_45 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_47 <= 1'b0;
      _zz_when_PlicGateway_l21_47 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_49 <= 1'b0;
      _zz_when_PlicGateway_l21_49 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_51 <= 1'b0;
      _zz_when_PlicGateway_l21_51 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_53 <= 1'b0;
      _zz_when_PlicGateway_l21_53 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_55 <= 1'b0;
      _zz_when_PlicGateway_l21_55 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_57 <= 1'b0;
      _zz_when_PlicGateway_l21_57 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_59 <= 1'b0;
      _zz_when_PlicGateway_l21_59 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_61 <= 1'b0;
      _zz_when_PlicGateway_l21_61 <= 1'b0;
      _zz_plic_logic_bmb_rsp_valid_1 <= 1'b0;
      _zz_plic_logic_bus_rsp_payload_fragment_data_62 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_63 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_64 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_65 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_66 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_67 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_68 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_69 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_70 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_71 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_72 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_73 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_74 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_75 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_76 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_77 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_78 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_79 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_80 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_81 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_82 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_83 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_84 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_85 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_86 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_87 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_88 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_89 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_90 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_91 <= 2'b00;
      _zz_plic_logic_bus_rsp_payload_fragment_data_92 <= 2'b00;
      plic_logic_bridge_coherencyStall_value <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_threshold <= 2'b00;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_0 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_1 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_2 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_3 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_4 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_5 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_6 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_7 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_8 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_9 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_10 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_11 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_12 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_13 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_14 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_15 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_16 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_17 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_18 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_19 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_20 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_21 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_22 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_23 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_24 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_25 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_26 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_27 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_28 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_29 <= 1'b0;
      _zz_cores_0_cpu_externalInterrupt_plic_target_ie_30 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_threshold <= 2'b00;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_0 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_1 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_2 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_3 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_4 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_5 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_6 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_7 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_8 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_9 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_10 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_11 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_12 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_13 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_14 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_15 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_16 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_17 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_18 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_19 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_20 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_21 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_22 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_23 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_24 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_25 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_26 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_27 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_28 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_29 <= 1'b0;
      _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_30 <= 1'b0;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN <= 1'b1;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rValid <= 1'b0;
      _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid_1 <= 1'b0;
      cores_0_cpu_iBus_cmd_rValid <= 1'b0;
      _zz_cores_0_cpu_iBus_rsp_valid_1 <= 1'b0;
      dBusCoherent_bmb_cmd_rValidN <= 1'b1;
      dBusCoherent_bmb_cmd_s2mPipe_rValid <= 1'b0;
      iArbiter_bmb_cmd_rValid <= 1'b0;
      _zz_iArbiter_bmb_rsp_valid_1 <= 1'b0;
      dBusNonCoherent_bmb_cmd_rValidN <= 1'b1;
      dBusNonCoherent_bmb_cmd_s2mPipe_rValid <= 1'b0;
      _zz_dBusNonCoherent_bmb_rsp_valid_1 <= 1'b0;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN <= 1'b1;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rValid <= 1'b0;
      _zz_when_Stream_l372_1 <= 1'b0;
    end else begin
      if(when_PlicGateway_l21) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_1 <= _zz_when_PlicGateway_l21;
        _zz_when_PlicGateway_l21_1 <= _zz_when_PlicGateway_l21;
      end
      if(when_PlicGateway_l21_1) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_3 <= _zz_when_PlicGateway_l21_2;
        _zz_when_PlicGateway_l21_3 <= _zz_when_PlicGateway_l21_2;
      end
      if(when_PlicGateway_l21_2) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_5 <= _zz_when_PlicGateway_l21_4;
        _zz_when_PlicGateway_l21_5 <= _zz_when_PlicGateway_l21_4;
      end
      if(when_PlicGateway_l21_3) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_7 <= _zz_when_PlicGateway_l21_6;
        _zz_when_PlicGateway_l21_7 <= _zz_when_PlicGateway_l21_6;
      end
      if(when_PlicGateway_l21_4) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_9 <= _zz_when_PlicGateway_l21_8;
        _zz_when_PlicGateway_l21_9 <= _zz_when_PlicGateway_l21_8;
      end
      if(when_PlicGateway_l21_5) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_11 <= _zz_when_PlicGateway_l21_10;
        _zz_when_PlicGateway_l21_11 <= _zz_when_PlicGateway_l21_10;
      end
      if(when_PlicGateway_l21_6) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_13 <= _zz_when_PlicGateway_l21_12;
        _zz_when_PlicGateway_l21_13 <= _zz_when_PlicGateway_l21_12;
      end
      if(when_PlicGateway_l21_7) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_15 <= _zz_when_PlicGateway_l21_14;
        _zz_when_PlicGateway_l21_15 <= _zz_when_PlicGateway_l21_14;
      end
      if(when_PlicGateway_l21_8) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_17 <= _zz_when_PlicGateway_l21_16;
        _zz_when_PlicGateway_l21_17 <= _zz_when_PlicGateway_l21_16;
      end
      if(when_PlicGateway_l21_9) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_19 <= _zz_when_PlicGateway_l21_18;
        _zz_when_PlicGateway_l21_19 <= _zz_when_PlicGateway_l21_18;
      end
      if(when_PlicGateway_l21_10) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_21 <= _zz_when_PlicGateway_l21_20;
        _zz_when_PlicGateway_l21_21 <= _zz_when_PlicGateway_l21_20;
      end
      if(when_PlicGateway_l21_11) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_23 <= _zz_when_PlicGateway_l21_22;
        _zz_when_PlicGateway_l21_23 <= _zz_when_PlicGateway_l21_22;
      end
      if(when_PlicGateway_l21_12) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_25 <= _zz_when_PlicGateway_l21_24;
        _zz_when_PlicGateway_l21_25 <= _zz_when_PlicGateway_l21_24;
      end
      if(when_PlicGateway_l21_13) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_27 <= _zz_when_PlicGateway_l21_26;
        _zz_when_PlicGateway_l21_27 <= _zz_when_PlicGateway_l21_26;
      end
      if(when_PlicGateway_l21_14) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_29 <= _zz_when_PlicGateway_l21_28;
        _zz_when_PlicGateway_l21_29 <= _zz_when_PlicGateway_l21_28;
      end
      if(when_PlicGateway_l21_15) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_31 <= _zz_when_PlicGateway_l21_30;
        _zz_when_PlicGateway_l21_31 <= _zz_when_PlicGateway_l21_30;
      end
      if(when_PlicGateway_l21_16) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_33 <= _zz_when_PlicGateway_l21_32;
        _zz_when_PlicGateway_l21_33 <= _zz_when_PlicGateway_l21_32;
      end
      if(when_PlicGateway_l21_17) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_35 <= _zz_when_PlicGateway_l21_34;
        _zz_when_PlicGateway_l21_35 <= _zz_when_PlicGateway_l21_34;
      end
      if(when_PlicGateway_l21_18) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_37 <= _zz_when_PlicGateway_l21_36;
        _zz_when_PlicGateway_l21_37 <= _zz_when_PlicGateway_l21_36;
      end
      if(when_PlicGateway_l21_19) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_39 <= _zz_when_PlicGateway_l21_38;
        _zz_when_PlicGateway_l21_39 <= _zz_when_PlicGateway_l21_38;
      end
      if(when_PlicGateway_l21_20) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_41 <= _zz_when_PlicGateway_l21_40;
        _zz_when_PlicGateway_l21_41 <= _zz_when_PlicGateway_l21_40;
      end
      if(when_PlicGateway_l21_21) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_43 <= _zz_when_PlicGateway_l21_42;
        _zz_when_PlicGateway_l21_43 <= _zz_when_PlicGateway_l21_42;
      end
      if(when_PlicGateway_l21_22) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_45 <= _zz_when_PlicGateway_l21_44;
        _zz_when_PlicGateway_l21_45 <= _zz_when_PlicGateway_l21_44;
      end
      if(when_PlicGateway_l21_23) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_47 <= _zz_when_PlicGateway_l21_46;
        _zz_when_PlicGateway_l21_47 <= _zz_when_PlicGateway_l21_46;
      end
      if(when_PlicGateway_l21_24) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_49 <= _zz_when_PlicGateway_l21_48;
        _zz_when_PlicGateway_l21_49 <= _zz_when_PlicGateway_l21_48;
      end
      if(when_PlicGateway_l21_25) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_51 <= _zz_when_PlicGateway_l21_50;
        _zz_when_PlicGateway_l21_51 <= _zz_when_PlicGateway_l21_50;
      end
      if(when_PlicGateway_l21_26) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_53 <= _zz_when_PlicGateway_l21_52;
        _zz_when_PlicGateway_l21_53 <= _zz_when_PlicGateway_l21_52;
      end
      if(when_PlicGateway_l21_27) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_55 <= _zz_when_PlicGateway_l21_54;
        _zz_when_PlicGateway_l21_55 <= _zz_when_PlicGateway_l21_54;
      end
      if(when_PlicGateway_l21_28) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_57 <= _zz_when_PlicGateway_l21_56;
        _zz_when_PlicGateway_l21_57 <= _zz_when_PlicGateway_l21_56;
      end
      if(when_PlicGateway_l21_29) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_59 <= _zz_when_PlicGateway_l21_58;
        _zz_when_PlicGateway_l21_59 <= _zz_when_PlicGateway_l21_58;
      end
      if(when_PlicGateway_l21_30) begin
        _zz_plic_logic_bus_rsp_payload_fragment_data_61 <= _zz_when_PlicGateway_l21_60;
        _zz_when_PlicGateway_l21_61 <= _zz_when_PlicGateway_l21_60;
      end
      if(_zz_plic_logic_bus_rsp_ready_1) begin
        _zz_plic_logic_bmb_rsp_valid_1 <= (plic_logic_bus_rsp_valid && _zz_plic_logic_bus_rsp_ready);
      end
      if(plic_logic_bridge_claim_valid) begin
        case(plic_logic_bridge_claim_payload)
          5'h01 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_1 <= 1'b0;
          end
          5'h02 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_3 <= 1'b0;
          end
          5'h03 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_5 <= 1'b0;
          end
          5'h04 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_7 <= 1'b0;
          end
          5'h05 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_9 <= 1'b0;
          end
          5'h06 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_11 <= 1'b0;
          end
          5'h07 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_13 <= 1'b0;
          end
          5'h08 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_15 <= 1'b0;
          end
          5'h09 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_17 <= 1'b0;
          end
          5'h0a : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_19 <= 1'b0;
          end
          5'h0b : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_21 <= 1'b0;
          end
          5'h0c : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_23 <= 1'b0;
          end
          5'h0d : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_25 <= 1'b0;
          end
          5'h0e : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_27 <= 1'b0;
          end
          5'h0f : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_29 <= 1'b0;
          end
          5'h10 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_31 <= 1'b0;
          end
          5'h11 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_33 <= 1'b0;
          end
          5'h12 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_35 <= 1'b0;
          end
          5'h13 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_37 <= 1'b0;
          end
          5'h14 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_39 <= 1'b0;
          end
          5'h15 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_41 <= 1'b0;
          end
          5'h16 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_43 <= 1'b0;
          end
          5'h17 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_45 <= 1'b0;
          end
          5'h18 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_47 <= 1'b0;
          end
          5'h19 : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_49 <= 1'b0;
          end
          5'h1a : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_51 <= 1'b0;
          end
          5'h1b : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_53 <= 1'b0;
          end
          5'h1c : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_55 <= 1'b0;
          end
          5'h1d : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_57 <= 1'b0;
          end
          5'h1e : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_59 <= 1'b0;
          end
          5'h1f : begin
            _zz_plic_logic_bus_rsp_payload_fragment_data_61 <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      if(plic_logic_bridge_completion_valid) begin
        case(plic_logic_bridge_completion_payload)
          5'h01 : begin
            _zz_when_PlicGateway_l21_1 <= 1'b0;
          end
          5'h02 : begin
            _zz_when_PlicGateway_l21_3 <= 1'b0;
          end
          5'h03 : begin
            _zz_when_PlicGateway_l21_5 <= 1'b0;
          end
          5'h04 : begin
            _zz_when_PlicGateway_l21_7 <= 1'b0;
          end
          5'h05 : begin
            _zz_when_PlicGateway_l21_9 <= 1'b0;
          end
          5'h06 : begin
            _zz_when_PlicGateway_l21_11 <= 1'b0;
          end
          5'h07 : begin
            _zz_when_PlicGateway_l21_13 <= 1'b0;
          end
          5'h08 : begin
            _zz_when_PlicGateway_l21_15 <= 1'b0;
          end
          5'h09 : begin
            _zz_when_PlicGateway_l21_17 <= 1'b0;
          end
          5'h0a : begin
            _zz_when_PlicGateway_l21_19 <= 1'b0;
          end
          5'h0b : begin
            _zz_when_PlicGateway_l21_21 <= 1'b0;
          end
          5'h0c : begin
            _zz_when_PlicGateway_l21_23 <= 1'b0;
          end
          5'h0d : begin
            _zz_when_PlicGateway_l21_25 <= 1'b0;
          end
          5'h0e : begin
            _zz_when_PlicGateway_l21_27 <= 1'b0;
          end
          5'h0f : begin
            _zz_when_PlicGateway_l21_29 <= 1'b0;
          end
          5'h10 : begin
            _zz_when_PlicGateway_l21_31 <= 1'b0;
          end
          5'h11 : begin
            _zz_when_PlicGateway_l21_33 <= 1'b0;
          end
          5'h12 : begin
            _zz_when_PlicGateway_l21_35 <= 1'b0;
          end
          5'h13 : begin
            _zz_when_PlicGateway_l21_37 <= 1'b0;
          end
          5'h14 : begin
            _zz_when_PlicGateway_l21_39 <= 1'b0;
          end
          5'h15 : begin
            _zz_when_PlicGateway_l21_41 <= 1'b0;
          end
          5'h16 : begin
            _zz_when_PlicGateway_l21_43 <= 1'b0;
          end
          5'h17 : begin
            _zz_when_PlicGateway_l21_45 <= 1'b0;
          end
          5'h18 : begin
            _zz_when_PlicGateway_l21_47 <= 1'b0;
          end
          5'h19 : begin
            _zz_when_PlicGateway_l21_49 <= 1'b0;
          end
          5'h1a : begin
            _zz_when_PlicGateway_l21_51 <= 1'b0;
          end
          5'h1b : begin
            _zz_when_PlicGateway_l21_53 <= 1'b0;
          end
          5'h1c : begin
            _zz_when_PlicGateway_l21_55 <= 1'b0;
          end
          5'h1d : begin
            _zz_when_PlicGateway_l21_57 <= 1'b0;
          end
          5'h1e : begin
            _zz_when_PlicGateway_l21_59 <= 1'b0;
          end
          5'h1f : begin
            _zz_when_PlicGateway_l21_61 <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      plic_logic_bridge_coherencyStall_value <= plic_logic_bridge_coherencyStall_valueNext;
      if(toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_valid) begin
        toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN <= 1'b0;
      end
      if(toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_ready) begin
        toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rValidN <= 1'b1;
      end
      if(toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_ready) begin
        toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rValid <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_valid;
      end
      if(_zz_cores_0_cpu_dBus_connector_decoder_rsp_ready) begin
        _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_valid_1 <= cores_0_cpu_dBus_connector_decoder_rsp_valid;
      end
      if(cores_0_cpu_iBus_cmd_valid) begin
        cores_0_cpu_iBus_cmd_rValid <= 1'b1;
      end
      if(cores_0_cpu_iBus_cmd_halfPipe_fire) begin
        cores_0_cpu_iBus_cmd_rValid <= 1'b0;
      end
      if(_zz_cores_0_cpu_iBus_connector_decoder_rsp_ready) begin
        _zz_cores_0_cpu_iBus_rsp_valid_1 <= cores_0_cpu_iBus_connector_decoder_rsp_valid;
      end
      if(dBusCoherent_bmb_cmd_valid) begin
        dBusCoherent_bmb_cmd_rValidN <= 1'b0;
      end
      if(dBusCoherent_bmb_cmd_s2mPipe_ready) begin
        dBusCoherent_bmb_cmd_rValidN <= 1'b1;
      end
      if(dBusCoherent_bmb_cmd_s2mPipe_ready) begin
        dBusCoherent_bmb_cmd_s2mPipe_rValid <= dBusCoherent_bmb_cmd_s2mPipe_valid;
      end
      if(iArbiter_bmb_cmd_valid) begin
        iArbiter_bmb_cmd_rValid <= 1'b1;
      end
      if(iArbiter_bmb_cmd_halfPipe_fire) begin
        iArbiter_bmb_cmd_rValid <= 1'b0;
      end
      if(_zz_io_input_rsp_ready) begin
        _zz_iArbiter_bmb_rsp_valid_1 <= iArbiter_bmb_decoder_io_input_rsp_valid;
      end
      if(dBusNonCoherent_bmb_cmd_valid) begin
        dBusNonCoherent_bmb_cmd_rValidN <= 1'b0;
      end
      if(dBusNonCoherent_bmb_cmd_s2mPipe_ready) begin
        dBusNonCoherent_bmb_cmd_rValidN <= 1'b1;
      end
      if(dBusNonCoherent_bmb_cmd_s2mPipe_ready) begin
        dBusNonCoherent_bmb_cmd_s2mPipe_rValid <= dBusNonCoherent_bmb_cmd_s2mPipe_valid;
      end
      if(_zz_peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready) begin
        _zz_dBusNonCoherent_bmb_rsp_valid_1 <= peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_valid;
      end
      if(peripheralBridge_bmb_arbiter_io_output_cmd_valid) begin
        toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN <= 1'b0;
      end
      if(toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_ready) begin
        toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN <= 1'b1;
      end
      if(toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_ready) begin
        toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rValid <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_valid;
      end
      if(_zz_io_input_rsp_ready_1) begin
        _zz_when_Stream_l372_1 <= peripheralBridge_logic_io_input_rsp_valid;
      end
      case(plic_logic_bmb_cmd_payload_fragment_address)
        22'h000004 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_62[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000008 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_1) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_63[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h00000c : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_2) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_64[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000010 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_3) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_65[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000014 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_4) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_66[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000018 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_5) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_67[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h00001c : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_6) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_68[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000020 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_7) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_69[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000024 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_8) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_70[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000028 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_9) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_71[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h00002c : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_10) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_72[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000030 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_11) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_73[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000034 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_12) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_74[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000038 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_13) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_75[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h00003c : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_14) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_76[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000040 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_15) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_77[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000044 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_16) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_78[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000048 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_17) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_79[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h00004c : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_18) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_80[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000050 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_19) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_81[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000054 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_20) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_82[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000058 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_21) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_83[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h00005c : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_22) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_84[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000060 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_23) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_85[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000064 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_24) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_86[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000068 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_25) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_87[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h00006c : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_26) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_88[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000070 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_27) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_89[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000074 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_28) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_90[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h000078 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_29) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_91[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h00007c : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_30) begin
              _zz_plic_logic_bus_rsp_payload_fragment_data_92[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h200000 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_31) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_threshold[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h002000 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_32) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_0 <= plic_logic_bmb_cmd_payload_fragment_data[1];
            end
            if(when_BusSlaveFactory_l1041_33) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_1 <= plic_logic_bmb_cmd_payload_fragment_data[2];
            end
            if(when_BusSlaveFactory_l1041_34) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_2 <= plic_logic_bmb_cmd_payload_fragment_data[3];
            end
            if(when_BusSlaveFactory_l1041_35) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_3 <= plic_logic_bmb_cmd_payload_fragment_data[4];
            end
            if(when_BusSlaveFactory_l1041_36) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_4 <= plic_logic_bmb_cmd_payload_fragment_data[5];
            end
            if(when_BusSlaveFactory_l1041_37) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_5 <= plic_logic_bmb_cmd_payload_fragment_data[6];
            end
            if(when_BusSlaveFactory_l1041_38) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_6 <= plic_logic_bmb_cmd_payload_fragment_data[7];
            end
            if(when_BusSlaveFactory_l1041_39) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_7 <= plic_logic_bmb_cmd_payload_fragment_data[8];
            end
            if(when_BusSlaveFactory_l1041_40) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_8 <= plic_logic_bmb_cmd_payload_fragment_data[9];
            end
            if(when_BusSlaveFactory_l1041_41) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_9 <= plic_logic_bmb_cmd_payload_fragment_data[10];
            end
            if(when_BusSlaveFactory_l1041_42) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_10 <= plic_logic_bmb_cmd_payload_fragment_data[11];
            end
            if(when_BusSlaveFactory_l1041_43) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_11 <= plic_logic_bmb_cmd_payload_fragment_data[12];
            end
            if(when_BusSlaveFactory_l1041_44) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_12 <= plic_logic_bmb_cmd_payload_fragment_data[13];
            end
            if(when_BusSlaveFactory_l1041_45) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_13 <= plic_logic_bmb_cmd_payload_fragment_data[14];
            end
            if(when_BusSlaveFactory_l1041_46) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_14 <= plic_logic_bmb_cmd_payload_fragment_data[15];
            end
            if(when_BusSlaveFactory_l1041_47) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_15 <= plic_logic_bmb_cmd_payload_fragment_data[16];
            end
            if(when_BusSlaveFactory_l1041_48) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_16 <= plic_logic_bmb_cmd_payload_fragment_data[17];
            end
            if(when_BusSlaveFactory_l1041_49) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_17 <= plic_logic_bmb_cmd_payload_fragment_data[18];
            end
            if(when_BusSlaveFactory_l1041_50) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_18 <= plic_logic_bmb_cmd_payload_fragment_data[19];
            end
            if(when_BusSlaveFactory_l1041_51) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_19 <= plic_logic_bmb_cmd_payload_fragment_data[20];
            end
            if(when_BusSlaveFactory_l1041_52) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_20 <= plic_logic_bmb_cmd_payload_fragment_data[21];
            end
            if(when_BusSlaveFactory_l1041_53) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_21 <= plic_logic_bmb_cmd_payload_fragment_data[22];
            end
            if(when_BusSlaveFactory_l1041_54) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_22 <= plic_logic_bmb_cmd_payload_fragment_data[23];
            end
            if(when_BusSlaveFactory_l1041_55) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_23 <= plic_logic_bmb_cmd_payload_fragment_data[24];
            end
            if(when_BusSlaveFactory_l1041_56) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_24 <= plic_logic_bmb_cmd_payload_fragment_data[25];
            end
            if(when_BusSlaveFactory_l1041_57) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_25 <= plic_logic_bmb_cmd_payload_fragment_data[26];
            end
            if(when_BusSlaveFactory_l1041_58) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_26 <= plic_logic_bmb_cmd_payload_fragment_data[27];
            end
            if(when_BusSlaveFactory_l1041_59) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_27 <= plic_logic_bmb_cmd_payload_fragment_data[28];
            end
            if(when_BusSlaveFactory_l1041_60) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_28 <= plic_logic_bmb_cmd_payload_fragment_data[29];
            end
            if(when_BusSlaveFactory_l1041_61) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_29 <= plic_logic_bmb_cmd_payload_fragment_data[30];
            end
            if(when_BusSlaveFactory_l1041_62) begin
              _zz_cores_0_cpu_externalInterrupt_plic_target_ie_30 <= plic_logic_bmb_cmd_payload_fragment_data[31];
            end
          end
        end
        22'h201000 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_63) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_threshold[1 : 0] <= plic_logic_bmb_cmd_payload_fragment_data[1 : 0];
            end
          end
        end
        22'h002080 : begin
          if(plic_logic_bus_doWrite) begin
            if(when_BusSlaveFactory_l1041_64) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_0 <= plic_logic_bmb_cmd_payload_fragment_data[1];
            end
            if(when_BusSlaveFactory_l1041_65) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_1 <= plic_logic_bmb_cmd_payload_fragment_data[2];
            end
            if(when_BusSlaveFactory_l1041_66) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_2 <= plic_logic_bmb_cmd_payload_fragment_data[3];
            end
            if(when_BusSlaveFactory_l1041_67) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_3 <= plic_logic_bmb_cmd_payload_fragment_data[4];
            end
            if(when_BusSlaveFactory_l1041_68) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_4 <= plic_logic_bmb_cmd_payload_fragment_data[5];
            end
            if(when_BusSlaveFactory_l1041_69) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_5 <= plic_logic_bmb_cmd_payload_fragment_data[6];
            end
            if(when_BusSlaveFactory_l1041_70) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_6 <= plic_logic_bmb_cmd_payload_fragment_data[7];
            end
            if(when_BusSlaveFactory_l1041_71) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_7 <= plic_logic_bmb_cmd_payload_fragment_data[8];
            end
            if(when_BusSlaveFactory_l1041_72) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_8 <= plic_logic_bmb_cmd_payload_fragment_data[9];
            end
            if(when_BusSlaveFactory_l1041_73) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_9 <= plic_logic_bmb_cmd_payload_fragment_data[10];
            end
            if(when_BusSlaveFactory_l1041_74) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_10 <= plic_logic_bmb_cmd_payload_fragment_data[11];
            end
            if(when_BusSlaveFactory_l1041_75) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_11 <= plic_logic_bmb_cmd_payload_fragment_data[12];
            end
            if(when_BusSlaveFactory_l1041_76) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_12 <= plic_logic_bmb_cmd_payload_fragment_data[13];
            end
            if(when_BusSlaveFactory_l1041_77) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_13 <= plic_logic_bmb_cmd_payload_fragment_data[14];
            end
            if(when_BusSlaveFactory_l1041_78) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_14 <= plic_logic_bmb_cmd_payload_fragment_data[15];
            end
            if(when_BusSlaveFactory_l1041_79) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_15 <= plic_logic_bmb_cmd_payload_fragment_data[16];
            end
            if(when_BusSlaveFactory_l1041_80) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_16 <= plic_logic_bmb_cmd_payload_fragment_data[17];
            end
            if(when_BusSlaveFactory_l1041_81) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_17 <= plic_logic_bmb_cmd_payload_fragment_data[18];
            end
            if(when_BusSlaveFactory_l1041_82) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_18 <= plic_logic_bmb_cmd_payload_fragment_data[19];
            end
            if(when_BusSlaveFactory_l1041_83) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_19 <= plic_logic_bmb_cmd_payload_fragment_data[20];
            end
            if(when_BusSlaveFactory_l1041_84) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_20 <= plic_logic_bmb_cmd_payload_fragment_data[21];
            end
            if(when_BusSlaveFactory_l1041_85) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_21 <= plic_logic_bmb_cmd_payload_fragment_data[22];
            end
            if(when_BusSlaveFactory_l1041_86) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_22 <= plic_logic_bmb_cmd_payload_fragment_data[23];
            end
            if(when_BusSlaveFactory_l1041_87) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_23 <= plic_logic_bmb_cmd_payload_fragment_data[24];
            end
            if(when_BusSlaveFactory_l1041_88) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_24 <= plic_logic_bmb_cmd_payload_fragment_data[25];
            end
            if(when_BusSlaveFactory_l1041_89) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_25 <= plic_logic_bmb_cmd_payload_fragment_data[26];
            end
            if(when_BusSlaveFactory_l1041_90) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_26 <= plic_logic_bmb_cmd_payload_fragment_data[27];
            end
            if(when_BusSlaveFactory_l1041_91) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_27 <= plic_logic_bmb_cmd_payload_fragment_data[28];
            end
            if(when_BusSlaveFactory_l1041_92) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_28 <= plic_logic_bmb_cmd_payload_fragment_data[29];
            end
            if(when_BusSlaveFactory_l1041_93) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_29 <= plic_logic_bmb_cmd_payload_fragment_data[30];
            end
            if(when_BusSlaveFactory_l1041_94) begin
              _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_ie_30 <= plic_logic_bmb_cmd_payload_fragment_data[31];
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge debugCd_external_clk) begin
    cores_0_cpu_debugReset <= cores_0_cpu_logic_cpu_debug_resetOut;
  end

  always @(posedge debugCd_external_clk) begin
    if(_zz_plic_logic_bus_rsp_ready_1) begin
      _zz_plic_logic_bmb_rsp_payload_last <= plic_logic_bus_rsp_payload_last;
      _zz_plic_logic_bmb_rsp_payload_fragment_opcode <= plic_logic_bus_rsp_payload_fragment_opcode;
      _zz_plic_logic_bmb_rsp_payload_fragment_data <= plic_logic_bus_rsp_payload_fragment_data;
    end
    cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority <= (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_6 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_4 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_5);
    cores_0_cpu_externalInterrupt_plic_target_bestRequest_id <= (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_6 ? (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_80 ? (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_72 ? (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_48 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_82 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_83) : (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_51 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_84 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_85)) : (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_74 ? (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_54 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_86 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_87) : (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_57 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_88 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_89))) : (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_81 ? (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_76 ? (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_60 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_90 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_91) : (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_63 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_92 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_93)) : (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_78 ? (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_66 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_94 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_95) : (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_69 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_96 : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_id_97))));
    cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid <= (_zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_priority_6 ? _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid : _zz_cores_0_cpu_externalInterrupt_plic_target_bestRequest_valid_1);
    cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority <= (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_6 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_4 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_5);
    cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id <= (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_6 ? (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_80 ? (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_72 ? (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_48 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_82 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_83) : (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_51 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_84 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_85)) : (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_74 ? (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_54 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_86 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_87) : (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_57 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_88 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_89))) : (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_81 ? (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_76 ? (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_60 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_90 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_91) : (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_63 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_92 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_93)) : (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_78 ? (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_66 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_94 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_95) : (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_69 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_96 : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_id_97))));
    cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid <= (_zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_priority_6 ? _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid : _zz_cores_0_cpu_externalSupervisorInterrupt_plic_target_bestRequest_valid_1);
    cores_0_cpu_externalInterrupt_plic_target_iep_regNext <= cores_0_cpu_externalInterrupt_plic_target_iep;
    cores_0_cpu_externalSupervisorInterrupt_plic_target_iep_regNext <= cores_0_cpu_externalSupervisorInterrupt_plic_target_iep;
    if(toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_ready) begin
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_last <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_last;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_opcode <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_opcode;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_address <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_address;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_length <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_length;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_data <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_data;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_mask <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_mask;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_rData_fragment_context <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_payload_fragment_context;
    end
    if(toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_ready) begin
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_last <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_last;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_opcode <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_opcode;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_address <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_address;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_length <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_length;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_data <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_data;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_mask <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_mask;
      toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_rData_fragment_context <= toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_cmd_s2mPipe_payload_fragment_context;
    end
    if(_zz_cores_0_cpu_dBus_connector_decoder_rsp_ready) begin
      _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_last <= cores_0_cpu_dBus_connector_decoder_rsp_payload_last;
      _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_opcode <= cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_opcode;
      _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_data <= cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_data;
      _zz_toplevel_cores_0_cpu_logic_cpu_dBus_Bridge_bus_rsp_payload_fragment_context <= cores_0_cpu_dBus_connector_decoder_rsp_payload_fragment_context;
    end
    if(cores_0_cpu_iBus_cmd_ready) begin
      cores_0_cpu_iBus_cmd_rData_last <= cores_0_cpu_iBus_cmd_payload_last;
      cores_0_cpu_iBus_cmd_rData_fragment_opcode <= cores_0_cpu_iBus_cmd_payload_fragment_opcode;
      cores_0_cpu_iBus_cmd_rData_fragment_address <= cores_0_cpu_iBus_cmd_payload_fragment_address;
      cores_0_cpu_iBus_cmd_rData_fragment_length <= cores_0_cpu_iBus_cmd_payload_fragment_length;
    end
    if(_zz_cores_0_cpu_iBus_connector_decoder_rsp_ready) begin
      _zz_cores_0_cpu_iBus_rsp_payload_last <= cores_0_cpu_iBus_connector_decoder_rsp_payload_last;
      _zz_cores_0_cpu_iBus_rsp_payload_fragment_opcode <= cores_0_cpu_iBus_connector_decoder_rsp_payload_fragment_opcode;
      _zz_cores_0_cpu_iBus_rsp_payload_fragment_data <= cores_0_cpu_iBus_connector_decoder_rsp_payload_fragment_data;
    end
    if(dBusCoherent_bmb_cmd_ready) begin
      dBusCoherent_bmb_cmd_rData_last <= dBusCoherent_bmb_cmd_payload_last;
      dBusCoherent_bmb_cmd_rData_fragment_opcode <= dBusCoherent_bmb_cmd_payload_fragment_opcode;
      dBusCoherent_bmb_cmd_rData_fragment_address <= dBusCoherent_bmb_cmd_payload_fragment_address;
      dBusCoherent_bmb_cmd_rData_fragment_length <= dBusCoherent_bmb_cmd_payload_fragment_length;
      dBusCoherent_bmb_cmd_rData_fragment_data <= dBusCoherent_bmb_cmd_payload_fragment_data;
      dBusCoherent_bmb_cmd_rData_fragment_mask <= dBusCoherent_bmb_cmd_payload_fragment_mask;
      dBusCoherent_bmb_cmd_rData_fragment_context <= dBusCoherent_bmb_cmd_payload_fragment_context;
    end
    if(dBusCoherent_bmb_cmd_s2mPipe_ready) begin
      dBusCoherent_bmb_cmd_s2mPipe_rData_last <= dBusCoherent_bmb_cmd_s2mPipe_payload_last;
      dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_opcode <= dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_opcode;
      dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_address <= dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_address;
      dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_length <= dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_length;
      dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_data <= dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_data;
      dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_mask <= dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_mask;
      dBusCoherent_bmb_cmd_s2mPipe_rData_fragment_context <= dBusCoherent_bmb_cmd_s2mPipe_payload_fragment_context;
    end
    if(iArbiter_bmb_cmd_ready) begin
      iArbiter_bmb_cmd_rData_last <= iArbiter_bmb_cmd_payload_last;
      iArbiter_bmb_cmd_rData_fragment_opcode <= iArbiter_bmb_cmd_payload_fragment_opcode;
      iArbiter_bmb_cmd_rData_fragment_address <= iArbiter_bmb_cmd_payload_fragment_address;
      iArbiter_bmb_cmd_rData_fragment_length <= iArbiter_bmb_cmd_payload_fragment_length;
    end
    if(_zz_io_input_rsp_ready) begin
      _zz_iArbiter_bmb_rsp_payload_last <= iArbiter_bmb_decoder_io_input_rsp_payload_last;
      _zz_iArbiter_bmb_rsp_payload_fragment_opcode <= iArbiter_bmb_decoder_io_input_rsp_payload_fragment_opcode;
      _zz_iArbiter_bmb_rsp_payload_fragment_data <= iArbiter_bmb_decoder_io_input_rsp_payload_fragment_data;
    end
    if(dBusNonCoherent_bmb_cmd_ready) begin
      dBusNonCoherent_bmb_cmd_rData_last <= dBusNonCoherent_bmb_cmd_payload_last;
      dBusNonCoherent_bmb_cmd_rData_fragment_opcode <= dBusNonCoherent_bmb_cmd_payload_fragment_opcode;
      dBusNonCoherent_bmb_cmd_rData_fragment_address <= dBusNonCoherent_bmb_cmd_payload_fragment_address;
      dBusNonCoherent_bmb_cmd_rData_fragment_length <= dBusNonCoherent_bmb_cmd_payload_fragment_length;
      dBusNonCoherent_bmb_cmd_rData_fragment_data <= dBusNonCoherent_bmb_cmd_payload_fragment_data;
      dBusNonCoherent_bmb_cmd_rData_fragment_mask <= dBusNonCoherent_bmb_cmd_payload_fragment_mask;
      dBusNonCoherent_bmb_cmd_rData_fragment_context <= dBusNonCoherent_bmb_cmd_payload_fragment_context;
    end
    if(dBusNonCoherent_bmb_cmd_s2mPipe_ready) begin
      dBusNonCoherent_bmb_cmd_s2mPipe_rData_last <= dBusNonCoherent_bmb_cmd_s2mPipe_payload_last;
      dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_opcode <= dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_opcode;
      dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_address <= dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_address;
      dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_length <= dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_length;
      dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_data <= dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_data;
      dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_mask <= dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_mask;
      dBusNonCoherent_bmb_cmd_s2mPipe_rData_fragment_context <= dBusNonCoherent_bmb_cmd_s2mPipe_payload_fragment_context;
    end
    if(_zz_peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_ready) begin
      _zz_dBusNonCoherent_bmb_rsp_payload_last <= peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_last;
      _zz_dBusNonCoherent_bmb_rsp_payload_fragment_opcode <= peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_opcode;
      _zz_dBusNonCoherent_bmb_rsp_payload_fragment_data <= peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_data;
      _zz_dBusNonCoherent_bmb_rsp_payload_fragment_context <= peripheralBridge_bmb_slaveModel_arbiterGen_logic_sorted_0_decoder_rsp_payload_fragment_context;
    end
    if(toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rValidN) begin
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_last <= peripheralBridge_bmb_arbiter_io_output_cmd_payload_last;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_source <= peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_source;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_opcode <= peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_opcode;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_address <= peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_address;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_length <= peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_length;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_data <= peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_data;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_mask <= peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_mask;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_rData_fragment_context <= peripheralBridge_bmb_arbiter_io_output_cmd_payload_fragment_context;
    end
    if(toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_ready) begin
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_last <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_last;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_source <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_source;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_opcode <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_opcode;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_address <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_address;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_length <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_length;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_data <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_data;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_mask <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_mask;
      toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_rData_fragment_context <= toplevel_peripheralBridge_bmb_arbiter_io_output_cmd_s2mPipe_payload_fragment_context;
    end
    if(_zz_io_input_rsp_ready_1) begin
      _zz_io_output_rsp_payload_last <= peripheralBridge_logic_io_input_rsp_payload_last;
      _zz_io_output_rsp_payload_fragment_source <= peripheralBridge_logic_io_input_rsp_payload_fragment_source;
      _zz_io_output_rsp_payload_fragment_opcode <= peripheralBridge_logic_io_input_rsp_payload_fragment_opcode;
      _zz_io_output_rsp_payload_fragment_data <= peripheralBridge_logic_io_input_rsp_payload_fragment_data;
      _zz_io_output_rsp_payload_fragment_context <= peripheralBridge_logic_io_input_rsp_payload_fragment_context;
    end
  end

  always @(posedge debugCd_external_clk or posedge debugCd_logic_outputReset) begin
    if(debugCd_logic_outputReset) begin
      toplevel_cores_0_cpu_logic_cpu_debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      toplevel_cores_0_cpu_logic_cpu_debug_bus_cmd_fire_regNext <= toplevel_cores_0_cpu_logic_cpu_debug_bus_cmd_fire;
    end
  end


endmodule

module BmbArbiter (
  input  wire          io_inputs_0_cmd_valid,
  output wire          io_inputs_0_cmd_ready,
  input  wire          io_inputs_0_cmd_payload_last,
  input  wire [0:0]    io_inputs_0_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_inputs_0_cmd_payload_fragment_address,
  input  wire [5:0]    io_inputs_0_cmd_payload_fragment_length,
  input  wire [31:0]   io_inputs_0_cmd_payload_fragment_data,
  input  wire [3:0]    io_inputs_0_cmd_payload_fragment_mask,
  input  wire [0:0]    io_inputs_0_cmd_payload_fragment_context,
  output wire          io_inputs_0_rsp_valid,
  input  wire          io_inputs_0_rsp_ready,
  output wire          io_inputs_0_rsp_payload_last,
  output wire [0:0]    io_inputs_0_rsp_payload_fragment_opcode,
  output wire [31:0]   io_inputs_0_rsp_payload_fragment_data,
  output wire [0:0]    io_inputs_0_rsp_payload_fragment_context,
  input  wire          io_inputs_1_cmd_valid,
  output wire          io_inputs_1_cmd_ready,
  input  wire          io_inputs_1_cmd_payload_last,
  input  wire [0:0]    io_inputs_1_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_inputs_1_cmd_payload_fragment_address,
  input  wire [5:0]    io_inputs_1_cmd_payload_fragment_length,
  input  wire [31:0]   io_inputs_1_cmd_payload_fragment_data,
  input  wire [3:0]    io_inputs_1_cmd_payload_fragment_mask,
  output wire          io_inputs_1_rsp_valid,
  input  wire          io_inputs_1_rsp_ready,
  output wire          io_inputs_1_rsp_payload_last,
  output wire [0:0]    io_inputs_1_rsp_payload_fragment_opcode,
  output wire [31:0]   io_inputs_1_rsp_payload_fragment_data,
  output wire          io_output_cmd_valid,
  input  wire          io_output_cmd_ready,
  output wire          io_output_cmd_payload_last,
  output wire [0:0]    io_output_cmd_payload_fragment_source,
  output wire [0:0]    io_output_cmd_payload_fragment_opcode,
  output wire [31:0]   io_output_cmd_payload_fragment_address,
  output wire [5:0]    io_output_cmd_payload_fragment_length,
  output wire [31:0]   io_output_cmd_payload_fragment_data,
  output wire [3:0]    io_output_cmd_payload_fragment_mask,
  output wire [0:0]    io_output_cmd_payload_fragment_context,
  input  wire          io_output_rsp_valid,
  output wire          io_output_rsp_ready,
  input  wire          io_output_rsp_payload_last,
  input  wire [0:0]    io_output_rsp_payload_fragment_source,
  input  wire [0:0]    io_output_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_output_rsp_payload_fragment_data,
  input  wire [0:0]    io_output_rsp_payload_fragment_context,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset
);

  wire       [0:0]    memory_arbiter_io_inputs_0_payload_fragment_source;
  wire       [0:0]    memory_arbiter_io_inputs_1_payload_fragment_source;
  wire       [0:0]    memory_arbiter_io_inputs_1_payload_fragment_context;
  wire                memory_arbiter_io_inputs_0_ready;
  wire                memory_arbiter_io_inputs_1_ready;
  wire                memory_arbiter_io_output_valid;
  wire                memory_arbiter_io_output_payload_last;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_source;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_opcode;
  wire       [31:0]   memory_arbiter_io_output_payload_fragment_address;
  wire       [5:0]    memory_arbiter_io_output_payload_fragment_length;
  wire       [31:0]   memory_arbiter_io_output_payload_fragment_data;
  wire       [3:0]    memory_arbiter_io_output_payload_fragment_mask;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_context;
  wire       [0:0]    memory_arbiter_io_chosen;
  wire       [1:0]    memory_arbiter_io_chosenOH;
  wire       [1:0]    _zz_io_output_cmd_payload_fragment_source;
  reg                 _zz_io_output_rsp_ready;
  wire       [0:0]    memory_rspSel;

  assign _zz_io_output_cmd_payload_fragment_source = {memory_arbiter_io_output_payload_fragment_source,memory_arbiter_io_chosen};
  StreamArbiter memory_arbiter (
    .io_inputs_0_valid                    (io_inputs_0_cmd_valid                                  ), //i
    .io_inputs_0_ready                    (memory_arbiter_io_inputs_0_ready                       ), //o
    .io_inputs_0_payload_last             (io_inputs_0_cmd_payload_last                           ), //i
    .io_inputs_0_payload_fragment_source  (memory_arbiter_io_inputs_0_payload_fragment_source     ), //i
    .io_inputs_0_payload_fragment_opcode  (io_inputs_0_cmd_payload_fragment_opcode                ), //i
    .io_inputs_0_payload_fragment_address (io_inputs_0_cmd_payload_fragment_address[31:0]         ), //i
    .io_inputs_0_payload_fragment_length  (io_inputs_0_cmd_payload_fragment_length[5:0]           ), //i
    .io_inputs_0_payload_fragment_data    (io_inputs_0_cmd_payload_fragment_data[31:0]            ), //i
    .io_inputs_0_payload_fragment_mask    (io_inputs_0_cmd_payload_fragment_mask[3:0]             ), //i
    .io_inputs_0_payload_fragment_context (io_inputs_0_cmd_payload_fragment_context               ), //i
    .io_inputs_1_valid                    (io_inputs_1_cmd_valid                                  ), //i
    .io_inputs_1_ready                    (memory_arbiter_io_inputs_1_ready                       ), //o
    .io_inputs_1_payload_last             (io_inputs_1_cmd_payload_last                           ), //i
    .io_inputs_1_payload_fragment_source  (memory_arbiter_io_inputs_1_payload_fragment_source     ), //i
    .io_inputs_1_payload_fragment_opcode  (io_inputs_1_cmd_payload_fragment_opcode                ), //i
    .io_inputs_1_payload_fragment_address (io_inputs_1_cmd_payload_fragment_address[31:0]         ), //i
    .io_inputs_1_payload_fragment_length  (io_inputs_1_cmd_payload_fragment_length[5:0]           ), //i
    .io_inputs_1_payload_fragment_data    (io_inputs_1_cmd_payload_fragment_data[31:0]            ), //i
    .io_inputs_1_payload_fragment_mask    (io_inputs_1_cmd_payload_fragment_mask[3:0]             ), //i
    .io_inputs_1_payload_fragment_context (memory_arbiter_io_inputs_1_payload_fragment_context    ), //i
    .io_output_valid                      (memory_arbiter_io_output_valid                         ), //o
    .io_output_ready                      (io_output_cmd_ready                                    ), //i
    .io_output_payload_last               (memory_arbiter_io_output_payload_last                  ), //o
    .io_output_payload_fragment_source    (memory_arbiter_io_output_payload_fragment_source       ), //o
    .io_output_payload_fragment_opcode    (memory_arbiter_io_output_payload_fragment_opcode       ), //o
    .io_output_payload_fragment_address   (memory_arbiter_io_output_payload_fragment_address[31:0]), //o
    .io_output_payload_fragment_length    (memory_arbiter_io_output_payload_fragment_length[5:0]  ), //o
    .io_output_payload_fragment_data      (memory_arbiter_io_output_payload_fragment_data[31:0]   ), //o
    .io_output_payload_fragment_mask      (memory_arbiter_io_output_payload_fragment_mask[3:0]    ), //o
    .io_output_payload_fragment_context   (memory_arbiter_io_output_payload_fragment_context      ), //o
    .io_chosen                            (memory_arbiter_io_chosen                               ), //o
    .io_chosenOH                          (memory_arbiter_io_chosenOH[1:0]                        ), //o
    .debugCd_external_clk                 (debugCd_external_clk                                   ), //i
    .systemCd_logic_outputReset           (systemCd_logic_outputReset                             )  //i
  );
  always @(*) begin
    case(memory_rspSel)
      1'b0 : _zz_io_output_rsp_ready = io_inputs_0_rsp_ready;
      default : _zz_io_output_rsp_ready = io_inputs_1_rsp_ready;
    endcase
  end

  assign io_inputs_0_cmd_ready = memory_arbiter_io_inputs_0_ready;
  assign memory_arbiter_io_inputs_0_payload_fragment_source = 1'b0;
  assign io_inputs_1_cmd_ready = memory_arbiter_io_inputs_1_ready;
  assign memory_arbiter_io_inputs_1_payload_fragment_source = 1'b0;
  assign memory_arbiter_io_inputs_1_payload_fragment_context = 1'b0;
  assign io_output_cmd_valid = memory_arbiter_io_output_valid;
  assign io_output_cmd_payload_last = memory_arbiter_io_output_payload_last;
  assign io_output_cmd_payload_fragment_opcode = memory_arbiter_io_output_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = memory_arbiter_io_output_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = memory_arbiter_io_output_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = memory_arbiter_io_output_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = memory_arbiter_io_output_payload_fragment_mask;
  assign io_output_cmd_payload_fragment_context = memory_arbiter_io_output_payload_fragment_context;
  assign io_output_cmd_payload_fragment_source = _zz_io_output_cmd_payload_fragment_source[0:0];
  assign memory_rspSel = io_output_rsp_payload_fragment_source[0 : 0];
  assign io_inputs_0_rsp_valid = (io_output_rsp_valid && (memory_rspSel == 1'b0));
  assign io_inputs_0_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_0_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_0_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_inputs_0_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context;
  assign io_inputs_1_rsp_valid = (io_output_rsp_valid && (memory_rspSel == 1'b1));
  assign io_inputs_1_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_1_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_1_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_output_rsp_ready = _zz_io_output_rsp_ready;

endmodule

module BmbToWishbone (
  input  wire          io_input_cmd_valid,
  output wire          io_input_cmd_ready,
  input  wire          io_input_cmd_payload_last,
  input  wire [0:0]    io_input_cmd_payload_fragment_source,
  input  wire [0:0]    io_input_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_input_cmd_payload_fragment_address,
  input  wire [5:0]    io_input_cmd_payload_fragment_length,
  input  wire [31:0]   io_input_cmd_payload_fragment_data,
  input  wire [3:0]    io_input_cmd_payload_fragment_mask,
  input  wire [0:0]    io_input_cmd_payload_fragment_context,
  output wire          io_input_rsp_valid,
  input  wire          io_input_rsp_ready,
  output wire          io_input_rsp_payload_last,
  output wire [0:0]    io_input_rsp_payload_fragment_source,
  output wire [0:0]    io_input_rsp_payload_fragment_opcode,
  output wire [31:0]   io_input_rsp_payload_fragment_data,
  output wire [0:0]    io_input_rsp_payload_fragment_context,
  output wire          io_output_CYC,
  output wire          io_output_STB,
  input  wire          io_output_ACK,
  output wire          io_output_WE,
  output wire [29:0]   io_output_ADR,
  input  wire [31:0]   io_output_DAT_MISO,
  output wire [31:0]   io_output_DAT_MOSI,
  output wire [3:0]    io_output_SEL,
  input  wire          io_output_ERR,
  output wire [2:0]    io_output_CTI,
  output wire [1:0]    io_output_BTE,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset
);

  wire       [11:0]   _zz_io_output_ADR;
  wire       [11:0]   _zz_io_output_ADR_1;
  wire       [5:0]    _zz_io_output_ADR_2;
  wire                inputCmd_valid;
  wire                inputCmd_ready;
  wire                inputCmd_payload_last;
  wire       [0:0]    inputCmd_payload_fragment_source;
  wire       [0:0]    inputCmd_payload_fragment_opcode;
  wire       [31:0]   inputCmd_payload_fragment_address;
  wire       [5:0]    inputCmd_payload_fragment_length;
  wire       [31:0]   inputCmd_payload_fragment_data;
  wire       [3:0]    inputCmd_payload_fragment_mask;
  wire       [0:0]    inputCmd_payload_fragment_context;
  reg                 io_input_cmd_rValid;
  wire                inputCmd_fire;
  reg                 io_input_cmd_rData_last;
  reg        [0:0]    io_input_cmd_rData_fragment_source;
  reg        [0:0]    io_input_cmd_rData_fragment_opcode;
  reg        [31:0]   io_input_cmd_rData_fragment_address;
  reg        [5:0]    io_input_cmd_rData_fragment_length;
  reg        [31:0]   io_input_cmd_rData_fragment_data;
  reg        [3:0]    io_input_cmd_rData_fragment_mask;
  reg        [0:0]    io_input_cmd_rData_fragment_context;
  wire                halt;
  reg        [3:0]    beatCounter;
  wire       [3:0]    beatCount;
  wire                beatLast;
  wire                when_BmbToWishbone_l29;
  wire                when_BmbToWishbone_l31;
  wire                rsp_valid;
  wire                rsp_ready;
  wire                rsp_payload_last;
  wire       [0:0]    rsp_payload_fragment_source;
  wire       [0:0]    rsp_payload_fragment_opcode;
  wire       [31:0]   rsp_payload_fragment_data;
  wire       [0:0]    rsp_payload_fragment_context;
  wire                rsp_s2mPipe_valid;
  reg                 rsp_s2mPipe_ready;
  wire                rsp_s2mPipe_payload_last;
  wire       [0:0]    rsp_s2mPipe_payload_fragment_source;
  wire       [0:0]    rsp_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   rsp_s2mPipe_payload_fragment_data;
  wire       [0:0]    rsp_s2mPipe_payload_fragment_context;
  reg                 rsp_rValidN;
  reg                 rsp_rData_last;
  reg        [0:0]    rsp_rData_fragment_source;
  reg        [0:0]    rsp_rData_fragment_opcode;
  reg        [31:0]   rsp_rData_fragment_data;
  reg        [0:0]    rsp_rData_fragment_context;
  wire                rsp_s2mPipe_m2sPipe_valid;
  wire                rsp_s2mPipe_m2sPipe_ready;
  wire                rsp_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    rsp_s2mPipe_m2sPipe_payload_fragment_source;
  wire       [0:0]    rsp_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   rsp_s2mPipe_m2sPipe_payload_fragment_data;
  wire       [0:0]    rsp_s2mPipe_m2sPipe_payload_fragment_context;
  reg                 rsp_s2mPipe_rValid;
  reg                 rsp_s2mPipe_rData_last;
  reg        [0:0]    rsp_s2mPipe_rData_fragment_source;
  reg        [0:0]    rsp_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   rsp_s2mPipe_rData_fragment_data;
  reg        [0:0]    rsp_s2mPipe_rData_fragment_context;
  wire                when_Stream_l372;

  assign _zz_io_output_ADR = (inputCmd_payload_fragment_address[11 : 0] + _zz_io_output_ADR_1);
  assign _zz_io_output_ADR_2 = ({2'd0,beatCounter} <<< 2'd2);
  assign _zz_io_output_ADR_1 = {6'd0, _zz_io_output_ADR_2};
  assign inputCmd_fire = (inputCmd_valid && inputCmd_ready);
  assign io_input_cmd_ready = (! io_input_cmd_rValid);
  assign inputCmd_valid = io_input_cmd_rValid;
  assign inputCmd_payload_last = io_input_cmd_rData_last;
  assign inputCmd_payload_fragment_source = io_input_cmd_rData_fragment_source;
  assign inputCmd_payload_fragment_opcode = io_input_cmd_rData_fragment_opcode;
  assign inputCmd_payload_fragment_address = io_input_cmd_rData_fragment_address;
  assign inputCmd_payload_fragment_length = io_input_cmd_rData_fragment_length;
  assign inputCmd_payload_fragment_data = io_input_cmd_rData_fragment_data;
  assign inputCmd_payload_fragment_mask = io_input_cmd_rData_fragment_mask;
  assign inputCmd_payload_fragment_context = io_input_cmd_rData_fragment_context;
  assign beatCount = inputCmd_payload_fragment_length[5 : 2];
  assign beatLast = (beatCounter == beatCount);
  assign when_BmbToWishbone_l29 = ((inputCmd_valid && io_output_ACK) && (! halt));
  assign when_BmbToWishbone_l31 = (inputCmd_ready && inputCmd_payload_last);
  assign io_output_ADR = ({inputCmd_payload_fragment_address[31 : 12],_zz_io_output_ADR} >>> 2'd2);
  assign io_output_CTI = (beatLast ? ((beatCount == 4'b0000) ? 3'b000 : 3'b111) : 3'b010);
  assign io_output_BTE = 2'b00;
  assign io_output_SEL = ((inputCmd_payload_fragment_opcode == 1'b1) ? inputCmd_payload_fragment_mask : 4'b1111);
  assign io_output_WE = (inputCmd_payload_fragment_opcode == 1'b1);
  assign io_output_DAT_MOSI = inputCmd_payload_fragment_data;
  assign inputCmd_ready = (io_output_ACK && ((inputCmd_payload_fragment_opcode == 1'b1) || beatLast));
  assign io_output_CYC = inputCmd_valid;
  assign io_output_STB = (inputCmd_valid && (! halt));
  assign rsp_valid = (((inputCmd_valid && io_output_ACK) && ((inputCmd_payload_fragment_opcode == 1'b0) || beatLast)) && (! halt));
  assign rsp_payload_fragment_data = io_output_DAT_MISO;
  assign rsp_payload_fragment_source = inputCmd_payload_fragment_source;
  assign rsp_payload_fragment_context = inputCmd_payload_fragment_context;
  assign rsp_payload_last = beatLast;
  assign rsp_payload_fragment_opcode = 1'b0;
  assign halt = (! rsp_ready);
  assign rsp_ready = rsp_rValidN;
  assign rsp_s2mPipe_valid = (rsp_valid || (! rsp_rValidN));
  assign rsp_s2mPipe_payload_last = (rsp_rValidN ? rsp_payload_last : rsp_rData_last);
  assign rsp_s2mPipe_payload_fragment_source = (rsp_rValidN ? rsp_payload_fragment_source : rsp_rData_fragment_source);
  assign rsp_s2mPipe_payload_fragment_opcode = (rsp_rValidN ? rsp_payload_fragment_opcode : rsp_rData_fragment_opcode);
  assign rsp_s2mPipe_payload_fragment_data = (rsp_rValidN ? rsp_payload_fragment_data : rsp_rData_fragment_data);
  assign rsp_s2mPipe_payload_fragment_context = (rsp_rValidN ? rsp_payload_fragment_context : rsp_rData_fragment_context);
  always @(*) begin
    rsp_s2mPipe_ready = rsp_s2mPipe_m2sPipe_ready;
    if(when_Stream_l372) begin
      rsp_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l372 = (! rsp_s2mPipe_m2sPipe_valid);
  assign rsp_s2mPipe_m2sPipe_valid = rsp_s2mPipe_rValid;
  assign rsp_s2mPipe_m2sPipe_payload_last = rsp_s2mPipe_rData_last;
  assign rsp_s2mPipe_m2sPipe_payload_fragment_source = rsp_s2mPipe_rData_fragment_source;
  assign rsp_s2mPipe_m2sPipe_payload_fragment_opcode = rsp_s2mPipe_rData_fragment_opcode;
  assign rsp_s2mPipe_m2sPipe_payload_fragment_data = rsp_s2mPipe_rData_fragment_data;
  assign rsp_s2mPipe_m2sPipe_payload_fragment_context = rsp_s2mPipe_rData_fragment_context;
  assign io_input_rsp_valid = rsp_s2mPipe_m2sPipe_valid;
  assign rsp_s2mPipe_m2sPipe_ready = io_input_rsp_ready;
  assign io_input_rsp_payload_last = rsp_s2mPipe_m2sPipe_payload_last;
  assign io_input_rsp_payload_fragment_source = rsp_s2mPipe_m2sPipe_payload_fragment_source;
  assign io_input_rsp_payload_fragment_opcode = rsp_s2mPipe_m2sPipe_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = rsp_s2mPipe_m2sPipe_payload_fragment_data;
  assign io_input_rsp_payload_fragment_context = rsp_s2mPipe_m2sPipe_payload_fragment_context;
  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      io_input_cmd_rValid <= 1'b0;
      beatCounter <= 4'b0000;
      rsp_rValidN <= 1'b1;
      rsp_s2mPipe_rValid <= 1'b0;
    end else begin
      if(io_input_cmd_valid) begin
        io_input_cmd_rValid <= 1'b1;
      end
      if(inputCmd_fire) begin
        io_input_cmd_rValid <= 1'b0;
      end
      if(when_BmbToWishbone_l29) begin
        beatCounter <= (beatCounter + 4'b0001);
        if(when_BmbToWishbone_l31) begin
          beatCounter <= 4'b0000;
        end
      end
      if(rsp_valid) begin
        rsp_rValidN <= 1'b0;
      end
      if(rsp_s2mPipe_ready) begin
        rsp_rValidN <= 1'b1;
      end
      if(rsp_s2mPipe_ready) begin
        rsp_s2mPipe_rValid <= rsp_s2mPipe_valid;
      end
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(io_input_cmd_ready) begin
      io_input_cmd_rData_last <= io_input_cmd_payload_last;
      io_input_cmd_rData_fragment_source <= io_input_cmd_payload_fragment_source;
      io_input_cmd_rData_fragment_opcode <= io_input_cmd_payload_fragment_opcode;
      io_input_cmd_rData_fragment_address <= io_input_cmd_payload_fragment_address;
      io_input_cmd_rData_fragment_length <= io_input_cmd_payload_fragment_length;
      io_input_cmd_rData_fragment_data <= io_input_cmd_payload_fragment_data;
      io_input_cmd_rData_fragment_mask <= io_input_cmd_payload_fragment_mask;
      io_input_cmd_rData_fragment_context <= io_input_cmd_payload_fragment_context;
    end
    if(rsp_ready) begin
      rsp_rData_last <= rsp_payload_last;
      rsp_rData_fragment_source <= rsp_payload_fragment_source;
      rsp_rData_fragment_opcode <= rsp_payload_fragment_opcode;
      rsp_rData_fragment_data <= rsp_payload_fragment_data;
      rsp_rData_fragment_context <= rsp_payload_fragment_context;
    end
    if(rsp_s2mPipe_ready) begin
      rsp_s2mPipe_rData_last <= rsp_s2mPipe_payload_last;
      rsp_s2mPipe_rData_fragment_source <= rsp_s2mPipe_payload_fragment_source;
      rsp_s2mPipe_rData_fragment_opcode <= rsp_s2mPipe_payload_fragment_opcode;
      rsp_s2mPipe_rData_fragment_data <= rsp_s2mPipe_payload_fragment_data;
      rsp_s2mPipe_rData_fragment_context <= rsp_s2mPipe_payload_fragment_context;
    end
  end


endmodule

module BmbDecoder_1 (
  input  wire          io_input_cmd_valid,
  output wire          io_input_cmd_ready,
  input  wire          io_input_cmd_payload_last,
  input  wire [0:0]    io_input_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_input_cmd_payload_fragment_address,
  input  wire [5:0]    io_input_cmd_payload_fragment_length,
  output wire          io_input_rsp_valid,
  input  wire          io_input_rsp_ready,
  output wire          io_input_rsp_payload_last,
  output wire [0:0]    io_input_rsp_payload_fragment_opcode,
  output wire [31:0]   io_input_rsp_payload_fragment_data,
  output wire          io_outputs_0_cmd_valid,
  input  wire          io_outputs_0_cmd_ready,
  output wire          io_outputs_0_cmd_payload_last,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_opcode,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_address,
  output wire [5:0]    io_outputs_0_cmd_payload_fragment_length,
  input  wire          io_outputs_0_rsp_valid,
  output wire          io_outputs_0_rsp_ready,
  input  wire          io_outputs_0_rsp_payload_last,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_0_rsp_payload_fragment_data
);


  assign io_outputs_0_cmd_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = io_outputs_0_cmd_ready;
  assign io_input_rsp_valid = io_outputs_0_rsp_valid;
  assign io_outputs_0_rsp_ready = io_input_rsp_ready;
  assign io_outputs_0_cmd_payload_last = io_input_cmd_payload_last;
  assign io_input_rsp_payload_last = io_outputs_0_rsp_payload_last;
  assign io_outputs_0_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_outputs_0_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_outputs_0_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign io_input_rsp_payload_fragment_opcode = io_outputs_0_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = io_outputs_0_rsp_payload_fragment_data;

endmodule

module BmbDecoder (
  input  wire          io_input_cmd_valid,
  output wire          io_input_cmd_ready,
  input  wire          io_input_cmd_payload_last,
  input  wire [0:0]    io_input_cmd_payload_fragment_opcode,
  input  wire [31:0]   io_input_cmd_payload_fragment_address,
  input  wire [1:0]    io_input_cmd_payload_fragment_length,
  input  wire [31:0]   io_input_cmd_payload_fragment_data,
  input  wire [3:0]    io_input_cmd_payload_fragment_mask,
  output reg           io_input_rsp_valid,
  input  wire          io_input_rsp_ready,
  output reg           io_input_rsp_payload_last,
  output reg  [0:0]    io_input_rsp_payload_fragment_opcode,
  output wire [31:0]   io_input_rsp_payload_fragment_data,
  output reg           io_outputs_0_cmd_valid,
  input  wire          io_outputs_0_cmd_ready,
  output wire          io_outputs_0_cmd_payload_last,
  output wire [0:0]    io_outputs_0_cmd_payload_fragment_opcode,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_address,
  output wire [1:0]    io_outputs_0_cmd_payload_fragment_length,
  output wire [31:0]   io_outputs_0_cmd_payload_fragment_data,
  output wire [3:0]    io_outputs_0_cmd_payload_fragment_mask,
  input  wire          io_outputs_0_rsp_valid,
  output wire          io_outputs_0_rsp_ready,
  input  wire          io_outputs_0_rsp_payload_last,
  input  wire [0:0]    io_outputs_0_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_outputs_0_rsp_payload_fragment_data,
  input  wire          debugCd_external_clk,
  input  wire          debugCd_logic_outputReset
);

  wire       [6:0]    _zz_logic_rspPendingCounter;
  wire       [6:0]    _zz_logic_rspPendingCounter_1;
  wire       [0:0]    _zz_logic_rspPendingCounter_2;
  wire       [6:0]    _zz_logic_rspPendingCounter_3;
  wire       [0:0]    _zz_logic_rspPendingCounter_4;
  wire                logic_input_valid;
  reg                 logic_input_ready;
  wire                logic_input_payload_last;
  wire       [0:0]    logic_input_payload_fragment_opcode;
  wire       [31:0]   logic_input_payload_fragment_address;
  wire       [1:0]    logic_input_payload_fragment_length;
  wire       [31:0]   logic_input_payload_fragment_data;
  wire       [3:0]    logic_input_payload_fragment_mask;
  wire                logic_hitsS0_0;
  wire                logic_noHitS0;
  wire                _zz_io_outputs_0_cmd_payload_last;
  reg        [6:0]    logic_rspPendingCounter;
  wire                logic_input_fire;
  wire                io_input_rsp_fire;
  wire                logic_cmdWait;
  wire                when_BmbDecoder_l56;
  reg                 logic_rspHits_0;
  wire                logic_rspPending;
  wire                logic_rspNoHitValid;
  reg                 logic_rspNoHit_doIt;
  wire                when_BmbDecoder_l60;
  wire                when_BmbDecoder_l60_1;
  reg                 logic_rspNoHit_singleBeatRsp;

  assign _zz_logic_rspPendingCounter = (logic_rspPendingCounter + _zz_logic_rspPendingCounter_1);
  assign _zz_logic_rspPendingCounter_2 = (logic_input_fire && logic_input_payload_last);
  assign _zz_logic_rspPendingCounter_1 = {6'd0, _zz_logic_rspPendingCounter_2};
  assign _zz_logic_rspPendingCounter_4 = (io_input_rsp_fire && io_input_rsp_payload_last);
  assign _zz_logic_rspPendingCounter_3 = {6'd0, _zz_logic_rspPendingCounter_4};
  assign logic_input_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = logic_input_ready;
  assign logic_input_payload_last = io_input_cmd_payload_last;
  assign logic_input_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign logic_input_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign logic_input_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign logic_input_payload_fragment_data = io_input_cmd_payload_fragment_data;
  assign logic_input_payload_fragment_mask = io_input_cmd_payload_fragment_mask;
  assign logic_noHitS0 = (! (|logic_hitsS0_0));
  assign logic_hitsS0_0 = ((io_input_cmd_payload_fragment_address & (~ 32'h00000fff)) == 32'h0);
  always @(*) begin
    io_outputs_0_cmd_valid = (logic_input_valid && logic_hitsS0_0);
    if(logic_cmdWait) begin
      io_outputs_0_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_0_cmd_payload_last = logic_input_payload_last;
  assign io_outputs_0_cmd_payload_last = _zz_io_outputs_0_cmd_payload_last;
  assign io_outputs_0_cmd_payload_fragment_opcode = logic_input_payload_fragment_opcode;
  assign io_outputs_0_cmd_payload_fragment_address = logic_input_payload_fragment_address;
  assign io_outputs_0_cmd_payload_fragment_length = logic_input_payload_fragment_length;
  assign io_outputs_0_cmd_payload_fragment_data = logic_input_payload_fragment_data;
  assign io_outputs_0_cmd_payload_fragment_mask = logic_input_payload_fragment_mask;
  always @(*) begin
    logic_input_ready = ((|(logic_hitsS0_0 && io_outputs_0_cmd_ready)) || logic_noHitS0);
    if(logic_cmdWait) begin
      logic_input_ready = 1'b0;
    end
  end

  assign logic_input_fire = (logic_input_valid && logic_input_ready);
  assign io_input_rsp_fire = (io_input_rsp_valid && io_input_rsp_ready);
  assign when_BmbDecoder_l56 = (logic_input_valid && (! logic_cmdWait));
  assign logic_rspPending = (logic_rspPendingCounter != 7'h0);
  assign logic_rspNoHitValid = (! (|logic_rspHits_0));
  assign when_BmbDecoder_l60 = (io_input_rsp_fire && io_input_rsp_payload_last);
  assign when_BmbDecoder_l60_1 = ((logic_input_fire && logic_noHitS0) && logic_input_payload_last);
  always @(*) begin
    io_input_rsp_valid = ((|io_outputs_0_rsp_valid) || (logic_rspPending && logic_rspNoHitValid));
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_valid = 1'b1;
    end
  end

  always @(*) begin
    io_input_rsp_payload_last = io_outputs_0_rsp_payload_last;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_last = 1'b1;
    end
  end

  always @(*) begin
    io_input_rsp_payload_fragment_opcode = io_outputs_0_rsp_payload_fragment_opcode;
    if(logic_rspNoHit_doIt) begin
      io_input_rsp_payload_fragment_opcode = 1'b1;
    end
  end

  assign io_input_rsp_payload_fragment_data = io_outputs_0_rsp_payload_fragment_data;
  assign io_outputs_0_rsp_ready = io_input_rsp_ready;
  assign logic_cmdWait = ((logic_rspPending && ((logic_hitsS0_0 != logic_rspHits_0) || logic_rspNoHitValid)) || (logic_rspPendingCounter == 7'h40));
  always @(posedge debugCd_external_clk or posedge debugCd_logic_outputReset) begin
    if(debugCd_logic_outputReset) begin
      logic_rspPendingCounter <= 7'h0;
      logic_rspNoHit_doIt <= 1'b0;
    end else begin
      logic_rspPendingCounter <= (_zz_logic_rspPendingCounter - _zz_logic_rspPendingCounter_3);
      if(when_BmbDecoder_l60) begin
        logic_rspNoHit_doIt <= 1'b0;
      end
      if(when_BmbDecoder_l60_1) begin
        logic_rspNoHit_doIt <= 1'b1;
      end
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(when_BmbDecoder_l56) begin
      logic_rspHits_0 <= logic_hitsS0_0;
    end
    if(logic_input_fire) begin
      logic_rspNoHit_singleBeatRsp <= (logic_input_payload_fragment_opcode == 1'b1);
    end
  end


endmodule

module WishboneToBmb_1 (
  input  wire          io_input_CYC,
  input  wire          io_input_STB,
  output wire          io_input_ACK,
  input  wire          io_input_WE,
  input  wire [19:0]   io_input_ADR,
  output wire [31:0]   io_input_DAT_MISO,
  input  wire [31:0]   io_input_DAT_MOSI,
  output wire          io_output_cmd_valid,
  input  wire          io_output_cmd_ready,
  output wire          io_output_cmd_payload_last,
  output wire [0:0]    io_output_cmd_payload_fragment_opcode,
  output wire [21:0]   io_output_cmd_payload_fragment_address,
  output wire [1:0]    io_output_cmd_payload_fragment_length,
  output wire [31:0]   io_output_cmd_payload_fragment_data,
  output wire [3:0]    io_output_cmd_payload_fragment_mask,
  input  wire          io_output_rsp_valid,
  output wire          io_output_rsp_ready,
  input  wire          io_output_rsp_payload_last,
  input  wire [0:0]    io_output_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_output_rsp_payload_fragment_data,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset
);

  reg                 _zz_io_output_cmd_valid;
  wire                io_output_cmd_fire;
  wire                io_output_rsp_fire;

  assign io_output_cmd_payload_fragment_address = ({2'd0,io_input_ADR} <<< 2'd2);
  assign io_output_cmd_payload_fragment_opcode = (io_input_WE ? 1'b1 : 1'b0);
  assign io_output_cmd_payload_fragment_data = io_input_DAT_MOSI;
  assign io_output_cmd_payload_fragment_mask = 4'b1111;
  assign io_output_cmd_payload_fragment_length = 2'b11;
  assign io_output_cmd_payload_last = 1'b1;
  assign io_output_cmd_fire = (io_output_cmd_valid && io_output_cmd_ready);
  assign io_output_rsp_fire = (io_output_rsp_valid && io_output_rsp_ready);
  assign io_output_cmd_valid = ((io_input_CYC && io_input_STB) && (! _zz_io_output_cmd_valid));
  assign io_input_ACK = io_output_rsp_fire;
  assign io_input_DAT_MISO = io_output_rsp_payload_fragment_data;
  assign io_output_rsp_ready = 1'b1;
  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      _zz_io_output_cmd_valid <= 1'b0;
    end else begin
      if(io_output_cmd_fire) begin
        _zz_io_output_cmd_valid <= 1'b1;
      end
      if(io_output_rsp_fire) begin
        _zz_io_output_cmd_valid <= 1'b0;
      end
    end
  end


endmodule

module WishboneToBmb (
  input  wire          io_input_CYC,
  input  wire          io_input_STB,
  output wire          io_input_ACK,
  input  wire          io_input_WE,
  input  wire [13:0]   io_input_ADR,
  output wire [31:0]   io_input_DAT_MISO,
  input  wire [31:0]   io_input_DAT_MOSI,
  output wire          io_output_cmd_valid,
  input  wire          io_output_cmd_ready,
  output wire          io_output_cmd_payload_last,
  output wire [0:0]    io_output_cmd_payload_fragment_opcode,
  output wire [15:0]   io_output_cmd_payload_fragment_address,
  output wire [1:0]    io_output_cmd_payload_fragment_length,
  output wire [31:0]   io_output_cmd_payload_fragment_data,
  output wire [3:0]    io_output_cmd_payload_fragment_mask,
  input  wire          io_output_rsp_valid,
  output wire          io_output_rsp_ready,
  input  wire          io_output_rsp_payload_last,
  input  wire [0:0]    io_output_rsp_payload_fragment_opcode,
  input  wire [31:0]   io_output_rsp_payload_fragment_data,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset
);

  reg                 _zz_io_output_cmd_valid;
  wire                io_output_cmd_fire;
  wire                io_output_rsp_fire;

  assign io_output_cmd_payload_fragment_address = ({2'd0,io_input_ADR} <<< 2'd2);
  assign io_output_cmd_payload_fragment_opcode = (io_input_WE ? 1'b1 : 1'b0);
  assign io_output_cmd_payload_fragment_data = io_input_DAT_MOSI;
  assign io_output_cmd_payload_fragment_mask = 4'b1111;
  assign io_output_cmd_payload_fragment_length = 2'b11;
  assign io_output_cmd_payload_last = 1'b1;
  assign io_output_cmd_fire = (io_output_cmd_valid && io_output_cmd_ready);
  assign io_output_rsp_fire = (io_output_rsp_valid && io_output_rsp_ready);
  assign io_output_cmd_valid = ((io_input_CYC && io_input_STB) && (! _zz_io_output_cmd_valid));
  assign io_input_ACK = io_output_rsp_fire;
  assign io_input_DAT_MISO = io_output_rsp_payload_fragment_data;
  assign io_output_rsp_ready = 1'b1;
  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      _zz_io_output_cmd_valid <= 1'b0;
    end else begin
      if(io_output_cmd_fire) begin
        _zz_io_output_cmd_valid <= 1'b1;
      end
      if(io_output_rsp_fire) begin
        _zz_io_output_cmd_valid <= 1'b0;
      end
    end
  end


endmodule

module BufferCC_2 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          debugCd_external_clk,
  input  wire          cores_0_cpu_debugReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge debugCd_external_clk or posedge cores_0_cpu_debugReset) begin
    if(cores_0_cpu_debugReset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module VexRiscv (
  output wire          dBus_cmd_valid,
  input  wire          dBus_cmd_ready,
  output wire          dBus_cmd_payload_wr,
  output wire          dBus_cmd_payload_uncached,
  output wire [31:0]   dBus_cmd_payload_address,
  output wire [31:0]   dBus_cmd_payload_data,
  output wire [3:0]    dBus_cmd_payload_mask,
  output wire [2:0]    dBus_cmd_payload_size,
  output wire          dBus_cmd_payload_last,
  input  wire          dBus_rsp_valid,
  input  wire          dBus_rsp_payload_last,
  input  wire [31:0]   dBus_rsp_payload_data,
  input  wire          dBus_rsp_payload_error,
  input  wire          timerInterrupt,
  input  wire          externalInterrupt,
  input  wire          softwareInterrupt,
  input  wire          externalInterruptS,
  input  wire [63:0]   utime,
  input  wire          debug_bus_cmd_valid,
  output reg           debug_bus_cmd_ready,
  input  wire          debug_bus_cmd_payload_wr,
  input  wire [7:0]    debug_bus_cmd_payload_address,
  input  wire [31:0]   debug_bus_cmd_payload_data,
  output reg  [31:0]   debug_bus_rsp_data,
  output wire          debug_resetOut,
  output wire          iBus_cmd_valid,
  input  wire          iBus_cmd_ready,
  output reg  [31:0]   iBus_cmd_payload_address,
  output wire [2:0]    iBus_cmd_payload_size,
  input  wire          iBus_rsp_valid,
  input  wire [31:0]   iBus_rsp_payload_data,
  input  wire          iBus_rsp_payload_error,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset,
  input  wire          debugCd_logic_outputReset
);
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam EnvCtrlEnum_NONE = 3'd0;
  localparam EnvCtrlEnum_XRET = 3'd1;
  localparam EnvCtrlEnum_WFI = 3'd2;
  localparam EnvCtrlEnum_ECALL = 3'd3;
  localparam EnvCtrlEnum_EBREAK = 3'd4;
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;
  localparam MmuPlugin_shared_State_IDLE = 3'd0;
  localparam MmuPlugin_shared_State_L1_CMD = 3'd1;
  localparam MmuPlugin_shared_State_L1_RSP = 3'd2;
  localparam MmuPlugin_shared_State_L0_CMD = 3'd3;
  localparam MmuPlugin_shared_State_L0_RSP = 3'd4;

  wire                IBusCachedPlugin_cache_io_flush;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isRemoved;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isUser;
  reg                 IBusCachedPlugin_cache_io_cpu_fill_valid;
  reg                 dataCache_1_io_cpu_execute_isValid;
  reg        [31:0]   dataCache_1_io_cpu_execute_address;
  reg                 dataCache_1_io_cpu_execute_args_wr;
  reg        [1:0]    dataCache_1_io_cpu_execute_args_size;
  reg                 dataCache_1_io_cpu_execute_args_isLrsc;
  wire                dataCache_1_io_cpu_execute_args_amoCtrl_swap;
  wire       [2:0]    dataCache_1_io_cpu_execute_args_amoCtrl_alu;
  reg                 dataCache_1_io_cpu_memory_isValid;
  reg                 dataCache_1_io_cpu_memory_mmuRsp_isIoAccess;
  reg                 dataCache_1_io_cpu_writeBack_isValid;
  wire                dataCache_1_io_cpu_writeBack_isUser;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_storeData;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_address;
  wire                dataCache_1_io_cpu_writeBack_fence_SW;
  wire                dataCache_1_io_cpu_writeBack_fence_SR;
  wire                dataCache_1_io_cpu_writeBack_fence_SO;
  wire                dataCache_1_io_cpu_writeBack_fence_SI;
  wire                dataCache_1_io_cpu_writeBack_fence_PW;
  wire                dataCache_1_io_cpu_writeBack_fence_PR;
  wire                dataCache_1_io_cpu_writeBack_fence_PO;
  wire                dataCache_1_io_cpu_writeBack_fence_PI;
  wire       [3:0]    dataCache_1_io_cpu_writeBack_fence_FM;
  wire                dataCache_1_io_cpu_flush_valid;
  wire                dataCache_1_io_cpu_flush_payload_singleLine;
  wire       [5:0]    dataCache_1_io_cpu_flush_payload_lineId;
  wire       [31:0]   RegFilePlugin_regFile_spinal_port0;
  wire       [31:0]   RegFilePlugin_regFile_spinal_port1;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1_io_cpu_execute_haltIt;
  wire                dataCache_1_io_cpu_execute_refilling;
  wire                dataCache_1_io_cpu_memory_isWrite;
  wire                dataCache_1_io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_data;
  wire                dataCache_1_io_cpu_writeBack_mmuException;
  wire                dataCache_1_io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1_io_cpu_writeBack_accessError;
  wire                dataCache_1_io_cpu_writeBack_isWrite;
  wire                dataCache_1_io_cpu_writeBack_keepMemRspData;
  wire                dataCache_1_io_cpu_writeBack_exclusiveOk;
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_cpu_writesPending;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire                dataCache_1_io_mem_cmd_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_size;
  wire                dataCache_1_io_mem_cmd_payload_last;
  wire       [51:0]   _zz_memory_MUL_LOW;
  wire       [51:0]   _zz_memory_MUL_LOW_1;
  wire       [51:0]   _zz_memory_MUL_LOW_2;
  wire       [32:0]   _zz_memory_MUL_LOW_3;
  wire       [51:0]   _zz_memory_MUL_LOW_4;
  wire       [49:0]   _zz_memory_MUL_LOW_5;
  wire       [51:0]   _zz_memory_MUL_LOW_6;
  wire       [49:0]   _zz_memory_MUL_LOW_7;
  wire       [30:0]   _zz_decode_DO_EBREAK;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [17:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [11:0]   _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [5:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_18;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_19;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_20;
  wire                _zz_decode_LEGAL_INSTRUCTION_21;
  wire                _zz_decode_LEGAL_INSTRUCTION_22;
  wire       [9:0]    _zz_MmuPlugin_ports_0_cacheHitsCalc;
  wire       [9:0]    _zz_MmuPlugin_ports_0_cacheHitsCalc_1;
  wire                _zz_MmuPlugin_ports_0_cacheHitsCalc_2;
  wire                _zz_MmuPlugin_ports_0_cacheHitsCalc_3;
  wire                _zz_MmuPlugin_ports_0_cacheHitsCalc_4;
  wire                _zz_MmuPlugin_ports_0_cacheHitsCalc_5;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_valid_4;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_exception;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_superPage;
  reg        [9:0]    _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0;
  reg        [9:0]    _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1;
  reg        [9:0]    _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0;
  reg        [9:0]    _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_allowRead;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_allowWrite;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_allowExecute;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_allowUser;
  wire       [1:0]    _zz_MmuPlugin_ports_0_entryToReplace_valueNext;
  wire       [0:0]    _zz_MmuPlugin_ports_0_entryToReplace_valueNext_1;
  wire       [9:0]    _zz_MmuPlugin_ports_1_cacheHitsCalc;
  wire       [9:0]    _zz_MmuPlugin_ports_1_cacheHitsCalc_1;
  wire                _zz_MmuPlugin_ports_1_cacheHitsCalc_2;
  wire                _zz_MmuPlugin_ports_1_cacheHitsCalc_3;
  wire                _zz_MmuPlugin_ports_1_cacheHitsCalc_4;
  wire                _zz_MmuPlugin_ports_1_cacheHitsCalc_5;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_valid_4;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_exception;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_superPage;
  reg        [9:0]    _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0;
  reg        [9:0]    _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1;
  reg        [9:0]    _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0;
  reg        [9:0]    _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_allowRead;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_allowWrite;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_allowExecute;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_allowUser;
  wire       [1:0]    _zz_MmuPlugin_ports_1_entryToReplace_valueNext;
  wire       [0:0]    _zz_MmuPlugin_ports_1_entryToReplace_valueNext_1;
  wire       [1:0]    _zz__zz_MmuPlugin_shared_refills_2;
  wire       [3:0]    _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  reg        [31:0]   _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  wire       [1:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_6;
  wire       [31:0]   _zz_IBusCachedPlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusCachedPlugin_fetchPc_pc_1;
  wire       [25:0]   _zz_io_cpu_flush_payload_lineId;
  wire       [25:0]   _zz_io_cpu_flush_payload_lineId_1;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted;
  wire       [1:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_2;
  wire       [0:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_3;
  wire       [0:0]    _zz_writeBack_DBusCachedPlugin_rspRf;
  wire       [31:0]   _zz__zz_decode_IS_CSR;
  wire       [31:0]   _zz__zz_decode_IS_CSR_1;
  wire       [31:0]   _zz__zz_decode_IS_CSR_2;
  wire       [31:0]   _zz__zz_decode_IS_CSR_3;
  wire       [0:0]    _zz__zz_decode_IS_CSR_4;
  wire                _zz__zz_decode_IS_CSR_5;
  wire       [31:0]   _zz__zz_decode_IS_CSR_6;
  wire       [31:0]   _zz__zz_decode_IS_CSR_7;
  wire       [0:0]    _zz__zz_decode_IS_CSR_8;
  wire       [31:0]   _zz__zz_decode_IS_CSR_9;
  wire       [31:0]   _zz__zz_decode_IS_CSR_10;
  wire                _zz__zz_decode_IS_CSR_11;
  wire                _zz__zz_decode_IS_CSR_12;
  wire       [0:0]    _zz__zz_decode_IS_CSR_13;
  wire                _zz__zz_decode_IS_CSR_14;
  wire       [0:0]    _zz__zz_decode_IS_CSR_15;
  wire       [31:0]   _zz__zz_decode_IS_CSR_16;
  wire       [26:0]   _zz__zz_decode_IS_CSR_17;
  wire       [31:0]   _zz__zz_decode_IS_CSR_18;
  wire       [31:0]   _zz__zz_decode_IS_CSR_19;
  wire       [0:0]    _zz__zz_decode_IS_CSR_20;
  wire       [0:0]    _zz__zz_decode_IS_CSR_21;
  wire       [0:0]    _zz__zz_decode_IS_CSR_22;
  wire                _zz__zz_decode_IS_CSR_23;
  wire       [31:0]   _zz__zz_decode_IS_CSR_24;
  wire       [0:0]    _zz__zz_decode_IS_CSR_25;
  wire                _zz__zz_decode_IS_CSR_26;
  wire       [21:0]   _zz__zz_decode_IS_CSR_27;
  wire                _zz__zz_decode_IS_CSR_28;
  wire       [0:0]    _zz__zz_decode_IS_CSR_29;
  wire                _zz__zz_decode_IS_CSR_30;
  wire       [31:0]   _zz__zz_decode_IS_CSR_31;
  wire       [31:0]   _zz__zz_decode_IS_CSR_32;
  wire                _zz__zz_decode_IS_CSR_33;
  wire       [0:0]    _zz__zz_decode_IS_CSR_34;
  wire       [31:0]   _zz__zz_decode_IS_CSR_35;
  wire       [0:0]    _zz__zz_decode_IS_CSR_36;
  wire       [31:0]   _zz__zz_decode_IS_CSR_37;
  wire       [0:0]    _zz__zz_decode_IS_CSR_38;
  wire       [31:0]   _zz__zz_decode_IS_CSR_39;
  wire       [31:0]   _zz__zz_decode_IS_CSR_40;
  wire       [17:0]   _zz__zz_decode_IS_CSR_41;
  wire                _zz__zz_decode_IS_CSR_42;
  wire       [5:0]    _zz__zz_decode_IS_CSR_43;
  wire       [31:0]   _zz__zz_decode_IS_CSR_44;
  wire       [31:0]   _zz__zz_decode_IS_CSR_45;
  wire                _zz__zz_decode_IS_CSR_46;
  wire       [31:0]   _zz__zz_decode_IS_CSR_47;
  wire       [0:0]    _zz__zz_decode_IS_CSR_48;
  wire       [31:0]   _zz__zz_decode_IS_CSR_49;
  wire       [31:0]   _zz__zz_decode_IS_CSR_50;
  wire       [2:0]    _zz__zz_decode_IS_CSR_51;
  wire       [0:0]    _zz__zz_decode_IS_CSR_52;
  wire       [0:0]    _zz__zz_decode_IS_CSR_53;
  wire       [31:0]   _zz__zz_decode_IS_CSR_54;
  wire       [31:0]   _zz__zz_decode_IS_CSR_55;
  wire                _zz__zz_decode_IS_CSR_56;
  wire                _zz__zz_decode_IS_CSR_57;
  wire       [31:0]   _zz__zz_decode_IS_CSR_58;
  wire       [0:0]    _zz__zz_decode_IS_CSR_59;
  wire       [31:0]   _zz__zz_decode_IS_CSR_60;
  wire       [31:0]   _zz__zz_decode_IS_CSR_61;
  wire       [0:0]    _zz__zz_decode_IS_CSR_62;
  wire       [31:0]   _zz__zz_decode_IS_CSR_63;
  wire       [31:0]   _zz__zz_decode_IS_CSR_64;
  wire       [0:0]    _zz__zz_decode_IS_CSR_65;
  wire       [0:0]    _zz__zz_decode_IS_CSR_66;
  wire       [31:0]   _zz__zz_decode_IS_CSR_67;
  wire       [31:0]   _zz__zz_decode_IS_CSR_68;
  wire       [3:0]    _zz__zz_decode_IS_CSR_69;
  wire                _zz__zz_decode_IS_CSR_70;
  wire       [31:0]   _zz__zz_decode_IS_CSR_71;
  wire       [0:0]    _zz__zz_decode_IS_CSR_72;
  wire       [1:0]    _zz__zz_decode_IS_CSR_73;
  wire                _zz__zz_decode_IS_CSR_74;
  wire       [31:0]   _zz__zz_decode_IS_CSR_75;
  wire       [13:0]   _zz__zz_decode_IS_CSR_76;
  wire       [2:0]    _zz__zz_decode_IS_CSR_77;
  wire       [0:0]    _zz__zz_decode_IS_CSR_78;
  wire       [0:0]    _zz__zz_decode_IS_CSR_79;
  wire       [31:0]   _zz__zz_decode_IS_CSR_80;
  wire       [31:0]   _zz__zz_decode_IS_CSR_81;
  wire                _zz__zz_decode_IS_CSR_82;
  wire       [0:0]    _zz__zz_decode_IS_CSR_83;
  wire       [5:0]    _zz__zz_decode_IS_CSR_84;
  wire                _zz__zz_decode_IS_CSR_85;
  wire       [31:0]   _zz__zz_decode_IS_CSR_86;
  wire       [0:0]    _zz__zz_decode_IS_CSR_87;
  wire       [31:0]   _zz__zz_decode_IS_CSR_88;
  wire       [31:0]   _zz__zz_decode_IS_CSR_89;
  wire       [3:0]    _zz__zz_decode_IS_CSR_90;
  wire                _zz__zz_decode_IS_CSR_91;
  wire       [0:0]    _zz__zz_decode_IS_CSR_92;
  wire       [31:0]   _zz__zz_decode_IS_CSR_93;
  wire       [1:0]    _zz__zz_decode_IS_CSR_94;
  wire       [31:0]   _zz__zz_decode_IS_CSR_95;
  wire       [31:0]   _zz__zz_decode_IS_CSR_96;
  wire       [0:0]    _zz__zz_decode_IS_CSR_97;
  wire       [1:0]    _zz__zz_decode_IS_CSR_98;
  wire                _zz__zz_decode_IS_CSR_99;
  wire       [31:0]   _zz__zz_decode_IS_CSR_100;
  wire       [10:0]   _zz__zz_decode_IS_CSR_101;
  wire                _zz__zz_decode_IS_CSR_102;
  wire       [0:0]    _zz__zz_decode_IS_CSR_103;
  wire       [0:0]    _zz__zz_decode_IS_CSR_104;
  wire       [31:0]   _zz__zz_decode_IS_CSR_105;
  wire       [31:0]   _zz__zz_decode_IS_CSR_106;
  wire       [0:0]    _zz__zz_decode_IS_CSR_107;
  wire       [0:0]    _zz__zz_decode_IS_CSR_108;
  wire       [31:0]   _zz__zz_decode_IS_CSR_109;
  wire       [31:0]   _zz__zz_decode_IS_CSR_110;
  wire       [8:0]    _zz__zz_decode_IS_CSR_111;
  wire                _zz__zz_decode_IS_CSR_112;
  wire                _zz__zz_decode_IS_CSR_113;
  wire       [0:0]    _zz__zz_decode_IS_CSR_114;
  wire       [5:0]    _zz__zz_decode_IS_CSR_115;
  wire       [31:0]   _zz__zz_decode_IS_CSR_116;
  wire       [31:0]   _zz__zz_decode_IS_CSR_117;
  wire       [0:0]    _zz__zz_decode_IS_CSR_118;
  wire       [31:0]   _zz__zz_decode_IS_CSR_119;
  wire       [31:0]   _zz__zz_decode_IS_CSR_120;
  wire       [2:0]    _zz__zz_decode_IS_CSR_121;
  wire                _zz__zz_decode_IS_CSR_122;
  wire       [0:0]    _zz__zz_decode_IS_CSR_123;
  wire       [31:0]   _zz__zz_decode_IS_CSR_124;
  wire       [0:0]    _zz__zz_decode_IS_CSR_125;
  wire       [6:0]    _zz__zz_decode_IS_CSR_126;
  wire                _zz__zz_decode_IS_CSR_127;
  wire                _zz__zz_decode_IS_CSR_128;
  wire       [31:0]   _zz__zz_decode_IS_CSR_129;
  wire       [0:0]    _zz__zz_decode_IS_CSR_130;
  wire       [0:0]    _zz__zz_decode_IS_CSR_131;
  wire       [31:0]   _zz__zz_decode_IS_CSR_132;
  wire       [31:0]   _zz__zz_decode_IS_CSR_133;
  wire       [1:0]    _zz__zz_decode_IS_CSR_134;
  wire                _zz__zz_decode_IS_CSR_135;
  wire                _zz__zz_decode_IS_CSR_136;
  wire       [4:0]    _zz__zz_decode_IS_CSR_137;
  wire       [2:0]    _zz__zz_decode_IS_CSR_138;
  wire       [0:0]    _zz__zz_decode_IS_CSR_139;
  wire       [0:0]    _zz__zz_decode_IS_CSR_140;
  wire       [31:0]   _zz__zz_decode_IS_CSR_141;
  wire                _zz__zz_decode_IS_CSR_142;
  wire       [0:0]    _zz__zz_decode_IS_CSR_143;
  wire       [0:0]    _zz__zz_decode_IS_CSR_144;
  wire       [31:0]   _zz__zz_decode_IS_CSR_145;
  wire       [0:0]    _zz__zz_decode_IS_CSR_146;
  wire       [0:0]    _zz__zz_decode_IS_CSR_147;
  wire       [1:0]    _zz__zz_decode_IS_CSR_148;
  wire                _zz__zz_decode_IS_CSR_149;
  wire                _zz__zz_decode_IS_CSR_150;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_decode_SRC1;
  wire       [4:0]    _zz__zz_decode_SRC1_1;
  wire       [11:0]   _zz__zz_decode_SRC2_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [65:0]   _zz_writeBack_MulPlugin_result;
  wire       [65:0]   _zz_writeBack_MulPlugin_result_1;
  wire       [31:0]   _zz__zz_decode_RS2_2;
  wire       [31:0]   _zz__zz_decode_RS2_2_1;
  wire       [5:0]    _zz_memory_MulDivIterativePlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_2;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_3;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_4;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_div_result_5;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_rs1_2;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_rs1_3;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_rs2_1;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_rs2_2;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3_1;
  wire                _zz_when;
  wire                _zz_when_1;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire       [63:0]   _zz_CounterPlugin_cycle;
  wire       [0:0]    _zz_CounterPlugin_cycle_1;
  wire       [63:0]   _zz_CounterPlugin_instret;
  wire       [0:0]    _zz_CounterPlugin_instret_1;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_23;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_24;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_25;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_26;
  wire       [51:0]   memory_MUL_LOW;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_MEMORY_VIRTUAL_ADDRESS;
  wire       [31:0]   execute_MEMORY_STORE_DATA_RF;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire       [2:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [2:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [2:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [2:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [2:0]    decode_ENV_CTRL;
  wire       [2:0]    _zz_decode_ENV_CTRL;
  wire       [2:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [2:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_LRSC;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire                decode_RESCHEDULE_NEXT;
  wire                decode_IS_SFENCE_VMA2;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [2:0]    memory_ENV_CTRL;
  wire       [2:0]    _zz_memory_ENV_CTRL;
  wire       [2:0]    execute_ENV_CTRL;
  wire       [2:0]    _zz_execute_ENV_CTRL;
  wire       [2:0]    writeBack_ENV_CTRL;
  wire       [2:0]    _zz_writeBack_ENV_CTRL;
  wire                execute_RESCHEDULE_NEXT;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  reg        [31:0]   _zz_decode_RS2;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   execute_SHIFT_RIGHT;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_decode_to_execute_PC;
  wire       [31:0]   _zz_decode_to_execute_RS2;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [31:0]   _zz_decode_to_execute_RS1;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  wire       [2:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  wire                writeBack_IS_DBUS_SHARING;
  wire                execute_IS_DBUS_SHARING;
  wire                memory_IS_DBUS_SHARING;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_LRSC;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_MEMORY_STORE_DATA_RF;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_PC;
  wire       [31:0]   memory_MEMORY_STORE_DATA_RF;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_MEMORY_WR;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   memory_MEMORY_VIRTUAL_ADDRESS;
  reg                 execute_MEMORY_AMO;
  reg                 execute_MEMORY_LRSC;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_AMO;
  wire                decode_MEMORY_LRSC;
  reg                 _zz_decode_MEMORY_FORCE_CONSTISTENCY;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_execute_to_memory_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire                execute_IS_SFENCE_VMA2;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 MmuPlugin_dBusAccess_cmd_valid;
  reg                 MmuPlugin_dBusAccess_cmd_ready;
  reg        [31:0]   MmuPlugin_dBusAccess_cmd_payload_address;
  wire       [1:0]    MmuPlugin_dBusAccess_cmd_payload_size;
  wire                MmuPlugin_dBusAccess_cmd_payload_write;
  wire       [31:0]   MmuPlugin_dBusAccess_cmd_payload_data;
  wire       [3:0]    MmuPlugin_dBusAccess_cmd_payload_writeMask;
  wire                MmuPlugin_dBusAccess_rsp_valid;
  wire       [31:0]   MmuPlugin_dBusAccess_rsp_payload_data;
  wire                MmuPlugin_dBusAccess_rsp_payload_error;
  wire                MmuPlugin_dBusAccess_rsp_payload_redo;
  reg                 IBusCachedPlugin_fetcherHalt;
  wire                IBusCachedPlugin_forceNoDecodeCond;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_cmd_1_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_1_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_1_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_1_bypassTranslation;
  reg        [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  reg                 IBusCachedPlugin_mmuBus_rsp_isPaging;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg                 IBusCachedPlugin_mmuBus_rsp_exception;
  reg                 IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_0_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_0_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_1_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_1_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_2_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_2_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_3_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_3_physical;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                DBusCachedPlugin_trigger_valid;
  wire                DBusCachedPlugin_trigger_load;
  wire                DBusCachedPlugin_trigger_store;
  wire       [31:0]   DBusCachedPlugin_trigger_virtual;
  wire       [31:0]   DBusCachedPlugin_trigger_writeData;
  wire       [31:0]   DBusCachedPlugin_trigger_readData;
  wire                DBusCachedPlugin_trigger_readDataValid;
  wire       [1:0]    DBusCachedPlugin_trigger_size;
  wire       [31:0]   DBusCachedPlugin_trigger_dpc;
  wire                DBusCachedPlugin_trigger_hit;
  wire                DBusCachedPlugin_trigger_hitBefore;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  reg                 DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire                DBusCachedPlugin_mmuBus_cmd_1_isValid;
  wire                DBusCachedPlugin_mmuBus_cmd_1_isStuck;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_1_virtualAddress;
  reg                 DBusCachedPlugin_mmuBus_cmd_1_bypassTranslation;
  reg        [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  reg                 DBusCachedPlugin_mmuBus_rsp_isPaging;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg                 DBusCachedPlugin_mmuBus_rsp_exception;
  reg                 DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_0_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_0_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_1_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_1_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_2_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_2_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_3_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_3_physical;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg                 _zz_when_DBusCachedPlugin_l476;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  reg                 CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  reg                 CsrPlugin_csrMapping_doForceFailCsr;
  reg                 CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  reg                 CsrPlugin_redoInterface_valid;
  wire       [31:0]   CsrPlugin_redoInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  reg                 CsrPlugin_xretAwayFromMachine;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  reg                 BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  reg                 BranchPlugin_inDebugNoFetchFlag;
  reg                 DebugPlugin_injectionPort_valid;
  reg                 DebugPlugin_injectionPort_ready;
  wire       [31:0]   DebugPlugin_injectionPort_payload;
  reg                 MmuPlugin_status_sum;
  reg                 MmuPlugin_status_mxr;
  reg                 MmuPlugin_status_mprv;
  reg                 MmuPlugin_satp_mode;
  reg        [8:0]    MmuPlugin_satp_asid;
  reg        [21:0]   MmuPlugin_satp_ppn;
  reg                 MmuPlugin_ports_0_cache_0_valid;
  reg                 MmuPlugin_ports_0_cache_0_exception;
  reg                 MmuPlugin_ports_0_cache_0_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_0_allowRead;
  reg                 MmuPlugin_ports_0_cache_0_allowWrite;
  reg                 MmuPlugin_ports_0_cache_0_allowExecute;
  reg                 MmuPlugin_ports_0_cache_0_allowUser;
  reg                 MmuPlugin_ports_0_cache_1_valid;
  reg                 MmuPlugin_ports_0_cache_1_exception;
  reg                 MmuPlugin_ports_0_cache_1_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_1_allowRead;
  reg                 MmuPlugin_ports_0_cache_1_allowWrite;
  reg                 MmuPlugin_ports_0_cache_1_allowExecute;
  reg                 MmuPlugin_ports_0_cache_1_allowUser;
  reg                 MmuPlugin_ports_0_cache_2_valid;
  reg                 MmuPlugin_ports_0_cache_2_exception;
  reg                 MmuPlugin_ports_0_cache_2_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_2_allowRead;
  reg                 MmuPlugin_ports_0_cache_2_allowWrite;
  reg                 MmuPlugin_ports_0_cache_2_allowExecute;
  reg                 MmuPlugin_ports_0_cache_2_allowUser;
  reg                 MmuPlugin_ports_0_cache_3_valid;
  reg                 MmuPlugin_ports_0_cache_3_exception;
  reg                 MmuPlugin_ports_0_cache_3_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_3_allowRead;
  reg                 MmuPlugin_ports_0_cache_3_allowWrite;
  reg                 MmuPlugin_ports_0_cache_3_allowExecute;
  reg                 MmuPlugin_ports_0_cache_3_allowUser;
  reg                 MmuPlugin_ports_0_dirty;
  wire                when_MmuPlugin_l117;
  reg                 MmuPlugin_ports_0_requireMmuLockupCalc;
  wire                when_MmuPlugin_l131;
  wire                when_MmuPlugin_l132;
  wire       [3:0]    MmuPlugin_ports_0_cacheHitsCalc;
  wire                when_MmuPlugin_l124;
  reg                 MmuPlugin_ports_0_requireMmuLockup;
  wire                when_MmuPlugin_l124_1;
  reg        [3:0]    MmuPlugin_ports_0_cacheHits;
  wire                MmuPlugin_ports_0_cacheHit;
  wire                _zz_MmuPlugin_ports_0_cacheLine_valid;
  wire                _zz_MmuPlugin_ports_0_cacheLine_valid_1;
  wire                _zz_MmuPlugin_ports_0_cacheLine_valid_2;
  wire       [1:0]    _zz_MmuPlugin_ports_0_cacheLine_valid_3;
  wire                MmuPlugin_ports_0_cacheLine_valid;
  wire                MmuPlugin_ports_0_cacheLine_exception;
  wire                MmuPlugin_ports_0_cacheLine_superPage;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_virtualAddress_0;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_virtualAddress_1;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_physicalAddress_0;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_physicalAddress_1;
  wire                MmuPlugin_ports_0_cacheLine_allowRead;
  wire                MmuPlugin_ports_0_cacheLine_allowWrite;
  wire                MmuPlugin_ports_0_cacheLine_allowExecute;
  wire                MmuPlugin_ports_0_cacheLine_allowUser;
  reg                 MmuPlugin_ports_0_entryToReplace_willIncrement;
  wire                MmuPlugin_ports_0_entryToReplace_willClear;
  reg        [1:0]    MmuPlugin_ports_0_entryToReplace_valueNext;
  reg        [1:0]    MmuPlugin_ports_0_entryToReplace_value;
  wire                MmuPlugin_ports_0_entryToReplace_willOverflowIfInc;
  wire                MmuPlugin_ports_0_entryToReplace_willOverflow;
  reg                 MmuPlugin_ports_1_cache_0_valid;
  reg                 MmuPlugin_ports_1_cache_0_exception;
  reg                 MmuPlugin_ports_1_cache_0_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_0_allowRead;
  reg                 MmuPlugin_ports_1_cache_0_allowWrite;
  reg                 MmuPlugin_ports_1_cache_0_allowExecute;
  reg                 MmuPlugin_ports_1_cache_0_allowUser;
  reg                 MmuPlugin_ports_1_cache_1_valid;
  reg                 MmuPlugin_ports_1_cache_1_exception;
  reg                 MmuPlugin_ports_1_cache_1_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_1_allowRead;
  reg                 MmuPlugin_ports_1_cache_1_allowWrite;
  reg                 MmuPlugin_ports_1_cache_1_allowExecute;
  reg                 MmuPlugin_ports_1_cache_1_allowUser;
  reg                 MmuPlugin_ports_1_cache_2_valid;
  reg                 MmuPlugin_ports_1_cache_2_exception;
  reg                 MmuPlugin_ports_1_cache_2_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_2_allowRead;
  reg                 MmuPlugin_ports_1_cache_2_allowWrite;
  reg                 MmuPlugin_ports_1_cache_2_allowExecute;
  reg                 MmuPlugin_ports_1_cache_2_allowUser;
  reg                 MmuPlugin_ports_1_cache_3_valid;
  reg                 MmuPlugin_ports_1_cache_3_exception;
  reg                 MmuPlugin_ports_1_cache_3_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_3_allowRead;
  reg                 MmuPlugin_ports_1_cache_3_allowWrite;
  reg                 MmuPlugin_ports_1_cache_3_allowExecute;
  reg                 MmuPlugin_ports_1_cache_3_allowUser;
  reg                 MmuPlugin_ports_1_dirty;
  wire                when_MmuPlugin_l117_1;
  reg                 MmuPlugin_ports_1_requireMmuLockupCalc;
  wire                when_MmuPlugin_l131_1;
  wire                when_MmuPlugin_l132_1;
  wire                when_MmuPlugin_l134;
  wire       [3:0]    MmuPlugin_ports_1_cacheHitsCalc;
  wire                when_MmuPlugin_l124_2;
  reg                 MmuPlugin_ports_1_requireMmuLockup;
  wire                when_MmuPlugin_l124_3;
  reg        [3:0]    MmuPlugin_ports_1_cacheHits;
  wire                MmuPlugin_ports_1_cacheHit;
  wire                _zz_MmuPlugin_ports_1_cacheLine_valid;
  wire                _zz_MmuPlugin_ports_1_cacheLine_valid_1;
  wire                _zz_MmuPlugin_ports_1_cacheLine_valid_2;
  wire       [1:0]    _zz_MmuPlugin_ports_1_cacheLine_valid_3;
  wire                MmuPlugin_ports_1_cacheLine_valid;
  wire                MmuPlugin_ports_1_cacheLine_exception;
  wire                MmuPlugin_ports_1_cacheLine_superPage;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_virtualAddress_0;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_virtualAddress_1;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_physicalAddress_0;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_physicalAddress_1;
  wire                MmuPlugin_ports_1_cacheLine_allowRead;
  wire                MmuPlugin_ports_1_cacheLine_allowWrite;
  wire                MmuPlugin_ports_1_cacheLine_allowExecute;
  wire                MmuPlugin_ports_1_cacheLine_allowUser;
  reg                 MmuPlugin_ports_1_entryToReplace_willIncrement;
  wire                MmuPlugin_ports_1_entryToReplace_willClear;
  reg        [1:0]    MmuPlugin_ports_1_entryToReplace_valueNext;
  reg        [1:0]    MmuPlugin_ports_1_entryToReplace_value;
  wire                MmuPlugin_ports_1_entryToReplace_willOverflowIfInc;
  wire                MmuPlugin_ports_1_entryToReplace_willOverflow;
  reg        [2:0]    MmuPlugin_shared_state_1;
  reg        [9:0]    MmuPlugin_shared_vpn_0;
  reg        [9:0]    MmuPlugin_shared_vpn_1;
  reg        [1:0]    MmuPlugin_shared_portSortedOh;
  reg                 MmuPlugin_shared_dBusRspStaged_valid;
  reg        [31:0]   MmuPlugin_shared_dBusRspStaged_payload_data;
  reg                 MmuPlugin_shared_dBusRspStaged_payload_error;
  reg                 MmuPlugin_shared_dBusRspStaged_payload_redo;
  wire                MmuPlugin_shared_dBusRsp_pte_V;
  wire                MmuPlugin_shared_dBusRsp_pte_R;
  wire                MmuPlugin_shared_dBusRsp_pte_W;
  wire                MmuPlugin_shared_dBusRsp_pte_X;
  wire                MmuPlugin_shared_dBusRsp_pte_U;
  wire                MmuPlugin_shared_dBusRsp_pte_G;
  wire                MmuPlugin_shared_dBusRsp_pte_A;
  wire                MmuPlugin_shared_dBusRsp_pte_D;
  wire       [1:0]    MmuPlugin_shared_dBusRsp_pte_RSW;
  wire       [9:0]    MmuPlugin_shared_dBusRsp_pte_PPN0;
  wire       [11:0]   MmuPlugin_shared_dBusRsp_pte_PPN1;
  wire                MmuPlugin_shared_dBusRsp_exception;
  wire                MmuPlugin_shared_dBusRsp_leaf;
  wire                when_MmuPlugin_l211;
  reg                 MmuPlugin_shared_pteBuffer_V;
  reg                 MmuPlugin_shared_pteBuffer_R;
  reg                 MmuPlugin_shared_pteBuffer_W;
  reg                 MmuPlugin_shared_pteBuffer_X;
  reg                 MmuPlugin_shared_pteBuffer_U;
  reg                 MmuPlugin_shared_pteBuffer_G;
  reg                 MmuPlugin_shared_pteBuffer_A;
  reg                 MmuPlugin_shared_pteBuffer_D;
  reg        [1:0]    MmuPlugin_shared_pteBuffer_RSW;
  reg        [9:0]    MmuPlugin_shared_pteBuffer_PPN0;
  reg        [11:0]   MmuPlugin_shared_pteBuffer_PPN1;
  wire       [1:0]    _zz_MmuPlugin_shared_refills;
  reg        [1:0]    _zz_MmuPlugin_shared_refills_1;
  wire       [1:0]    MmuPlugin_shared_refills;
  wire       [1:0]    _zz_MmuPlugin_shared_refills_2;
  reg        [1:0]    _zz_MmuPlugin_shared_refills_3;
  wire                when_MmuPlugin_l223;
  wire       [31:0]   _zz_MmuPlugin_shared_vpn_0;
  wire                when_MmuPlugin_l250;
  wire                when_MmuPlugin_l279;
  wire                when_MmuPlugin_l281;
  wire                when_MmuPlugin_l287;
  wire                when_MmuPlugin_l287_1;
  wire                when_MmuPlugin_l287_2;
  wire                when_MmuPlugin_l287_3;
  wire                when_MmuPlugin_l281_1;
  wire                when_MmuPlugin_l287_4;
  wire                when_MmuPlugin_l287_5;
  wire                when_MmuPlugin_l287_6;
  wire                when_MmuPlugin_l287_7;
  wire                when_MmuPlugin_l311;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_2;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_3;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_4;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_output_fire;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  wire                when_Fetcher_l133;
  wire                when_Fetcher_l133_1;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  wire                when_Fetcher_l160;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_3_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_3_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_3_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_3_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_3_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_3_halt;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_3_input_ready;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid_1;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_payload;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_payload;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l242;
  wire                when_Fetcher_l322;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l331;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l331_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l331_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l331_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  wire                when_Fetcher_l331_4;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_5;
  wire                when_Fetcher_l331_5;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                when_IBusCachedPlugin_l245;
  wire                when_IBusCachedPlugin_l250;
  wire                when_IBusCachedPlugin_l256;
  wire                when_IBusCachedPlugin_l262;
  wire                when_IBusCachedPlugin_l273;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_valid;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_ready;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_wr;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_uncached;
  wire       [31:0]   cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_address;
  wire       [31:0]   cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_data;
  wire       [3:0]    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_mask;
  wire       [2:0]    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_size;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_last;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_wr;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_uncached;
  reg        [31:0]   cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_address;
  reg        [31:0]   cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_data;
  reg        [3:0]    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_mask;
  reg        [2:0]    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_size;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_last;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached;
  wire       [31:0]   cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  wire       [31:0]   cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  wire       [2:0]    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_size;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rValid;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_wr;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_uncached;
  reg        [31:0]   cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_address;
  reg        [31:0]   cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_data;
  reg        [3:0]    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_mask;
  reg        [2:0]    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_size;
  reg                 cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_last;
  wire                when_Stream_l372;
  reg                 dBus_rsp_regNext_valid;
  reg                 dBus_rsp_regNext_payload_last;
  reg        [31:0]   dBus_rsp_regNext_payload_data;
  reg                 dBus_rsp_regNext_payload_error;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire                when_DBusCachedPlugin_l356;
  wire                when_DBusCachedPlugin_l364;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_execute_MEMORY_STORE_DATA_RF;
  wire                cores_0_cpu_logic_cpu_dataCache_1_io_cpu_flush_isStall;
  wire                when_DBusCachedPlugin_l398;
  wire                when_DBusCachedPlugin_l414;
  wire                when_DBusCachedPlugin_l476;
  wire                when_DBusCachedPlugin_l552;
  wire                when_DBusCachedPlugin_l572;
  wire       [31:0]   writeBack_DBusCachedPlugin_rspData;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_0;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_1;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_2;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspRf;
  wire                when_DBusCachedPlugin_l589;
  wire       [1:0]    switch_Misc_l241;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_1;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  wire                when_DBusCachedPlugin_l599;
  reg                 DBusCachedPlugin_forceDatapath;
  wire                when_DBusCachedPlugin_l623;
  wire                when_DBusCachedPlugin_l624;
  wire                MmuPlugin_dBusAccess_cmd_fire;
  wire       [37:0]   _zz_decode_IS_CSR;
  wire                _zz_decode_IS_CSR_1;
  wire                _zz_decode_IS_CSR_2;
  wire                _zz_decode_IS_CSR_3;
  wire                _zz_decode_IS_CSR_4;
  wire                _zz_decode_IS_CSR_5;
  wire                _zz_decode_IS_CSR_6;
  wire                _zz_decode_IS_CSR_7;
  wire                _zz_decode_IS_CSR_8;
  wire                _zz_decode_IS_CSR_9;
  wire                _zz_decode_IS_CSR_10;
  wire                _zz_decode_IS_CSR_11;
  wire                _zz_decode_IS_CSR_12;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [2:0]    _zz_decode_ENV_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_5;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_decode_SRC1;
  wire                _zz_decode_SRC2;
  reg        [19:0]   _zz_decode_SRC2_1;
  wire                _zz_decode_SRC2_2;
  reg        [19:0]   _zz_decode_SRC2_3;
  reg        [31:0]   _zz_decode_SRC2_4;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [1:0]    switch_MulPlugin_l87;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  wire                when_MulPlugin_l147;
  wire       [1:0]    switch_MulPlugin_l148;
  reg        [32:0]   memory_MulDivIterativePlugin_rs1;
  reg        [31:0]   memory_MulDivIterativePlugin_rs2;
  reg        [64:0]   memory_MulDivIterativePlugin_accumulator;
  wire                memory_MulDivIterativePlugin_frontendOk;
  reg                 memory_MulDivIterativePlugin_div_needRevert;
  reg                 memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_div_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_value;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg                 memory_MulDivIterativePlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_MulDivIterativePlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_MulDivIterativePlugin_rs2;
  wire                _zz_memory_MulDivIterativePlugin_rs1;
  reg        [32:0]   _zz_memory_MulDivIterativePlugin_rs1_1;
  reg        [1:0]    _zz_CsrPlugin_privilege;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg        [31:0]   CsrPlugin_mscratch;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg                 CsrPlugin_medeleg_IAM;
  reg                 CsrPlugin_medeleg_IAF;
  reg                 CsrPlugin_medeleg_II;
  reg                 CsrPlugin_medeleg_BP;
  reg                 CsrPlugin_medeleg_LAM;
  reg                 CsrPlugin_medeleg_LAF;
  reg                 CsrPlugin_medeleg_SAM;
  reg                 CsrPlugin_medeleg_SAF;
  reg                 CsrPlugin_medeleg_EU;
  reg                 CsrPlugin_medeleg_ES;
  reg                 CsrPlugin_medeleg_IPF;
  reg                 CsrPlugin_medeleg_LPF;
  reg                 CsrPlugin_medeleg_SPF;
  reg                 CsrPlugin_mideleg_ST;
  reg                 CsrPlugin_mideleg_SE;
  reg                 CsrPlugin_mideleg_SS;
  reg                 CsrPlugin_sstatus_SIE;
  reg                 CsrPlugin_sstatus_SPIE;
  reg        [0:0]    CsrPlugin_sstatus_SPP;
  reg                 CsrPlugin_sip_SEIP_SOFT;
  reg                 CsrPlugin_sip_SEIP_INPUT;
  wire                CsrPlugin_sip_SEIP_OR;
  reg                 CsrPlugin_sip_STIP;
  reg                 CsrPlugin_sip_SSIP;
  reg                 CsrPlugin_sie_SEIE;
  reg                 CsrPlugin_sie_STIE;
  reg                 CsrPlugin_sie_SSIE;
  reg        [1:0]    CsrPlugin_stvec_mode;
  reg        [29:0]   CsrPlugin_stvec_base;
  reg        [31:0]   CsrPlugin_sscratch;
  reg                 CsrPlugin_scause_interrupt;
  reg        [3:0]    CsrPlugin_scause_exceptionCode;
  reg        [31:0]   CsrPlugin_stval;
  reg        [31:0]   CsrPlugin_sepc;
  reg        [21:0]   CsrPlugin_satp_PPN;
  reg        [8:0]    CsrPlugin_satp_ASID;
  reg        [0:0]    CsrPlugin_satp_MODE;
  reg                 CsrPlugin_rescheduleLogic_rescheduleNext;
  wire                when_CsrPlugin_l1304;
  wire                _zz_when_CsrPlugin_l1446;
  wire                _zz_when_CsrPlugin_l1446_1;
  wire                _zz_when_CsrPlugin_l1446_2;
  wire                _zz_when_CsrPlugin_l1446_3;
  wire                _zz_when_CsrPlugin_l1446_4;
  wire                _zz_when_CsrPlugin_l1446_5;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  reg        [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire                when_CsrPlugin_l1360;
  wire                when_CsrPlugin_l1360_1;
  wire                when_CsrPlugin_l1360_2;
  wire                when_CsrPlugin_l1360_3;
  wire                when_CsrPlugin_l1360_4;
  wire                when_CsrPlugin_l1360_5;
  wire                when_CsrPlugin_l1360_6;
  wire                when_CsrPlugin_l1360_7;
  wire                when_CsrPlugin_l1360_8;
  wire                when_CsrPlugin_l1360_9;
  wire                when_CsrPlugin_l1360_10;
  wire                when_CsrPlugin_l1360_11;
  wire                when_CsrPlugin_l1360_12;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_2;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3;
  wire                when_CsrPlugin_l1403;
  wire                when_CsrPlugin_l1403_1;
  wire                when_CsrPlugin_l1403_2;
  wire                when_CsrPlugin_l1403_3;
  wire                when_CsrPlugin_l1416;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l1440;
  wire                when_CsrPlugin_l1440_1;
  wire                when_CsrPlugin_l1446;
  wire                when_CsrPlugin_l1446_1;
  wire                when_CsrPlugin_l1446_2;
  wire                when_CsrPlugin_l1446_3;
  wire                when_CsrPlugin_l1446_4;
  wire                when_CsrPlugin_l1446_5;
  wire                when_CsrPlugin_l1446_6;
  wire                when_CsrPlugin_l1446_7;
  wire                when_CsrPlugin_l1446_8;
  wire                CsrPlugin_exception;
  reg                 CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l1479;
  wire                when_CsrPlugin_l1479_1;
  wire                when_CsrPlugin_l1479_2;
  wire                when_CsrPlugin_l1484;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l1490;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  wire                CsrPlugin_trapCauseEbreakDebug;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                CsrPlugin_trapEnterDebug;
  wire                when_CsrPlugin_l1534;
  wire                when_CsrPlugin_l1542;
  wire                when_CsrPlugin_l1600;
  wire       [1:0]    switch_CsrPlugin_l1604;
  wire                when_CsrPlugin_l1612;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1663;
  wire                when_CsrPlugin_l1665;
  wire                when_CsrPlugin_l1671;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1684;
  wire                when_CsrPlugin_l1691;
  wire                when_CsrPlugin_l1692;
  wire                when_CsrPlugin_l1699;
  wire                when_CsrPlugin_l1709;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  reg        [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l241_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1731;
  wire                when_CsrPlugin_l1735;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l241_2;
  reg                 _zz_execute_BRANCH_DO;
  reg                 _zz_execute_BRANCH_DO_1;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  reg        [31:0]   _zz_execute_BranchPlugin_branch_src2_6;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire                when_BranchPlugin_l223;
  wire                CounterPlugin_dbgCtrEn;
  wire       [2:0]    CounterPlugin_menable;
  wire       [2:0]    CounterPlugin_senable;
  reg                 CounterPlugin_inhibitCY;
  reg                 CounterPlugin_inhibitIR;
  reg        [63:0]   CounterPlugin_cycle;
  reg        [63:0]   CounterPlugin_instret;
  wire                _zz_when_CounterPlugin_l90;
  wire                _zz_when_CounterPlugin_l90_1;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l238;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg                 DebugPlugin_hardwareBreakpoints_0_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_0_pc;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l257;
  wire                when_DebugPlugin_l257;
  wire       [5:0]    switch_DebugPlugin_l280;
  wire                when_DebugPlugin_l284;
  wire                when_DebugPlugin_l284_1;
  wire                when_DebugPlugin_l285;
  wire                when_DebugPlugin_l285_1;
  wire                when_DebugPlugin_l286;
  wire                when_DebugPlugin_l287;
  wire                when_DebugPlugin_l288;
  wire                when_DebugPlugin_l288_1;
  wire                when_DebugPlugin_l308;
  wire                when_DebugPlugin_l311;
  wire                when_DebugPlugin_l324;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l344;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg                 decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  wire                when_Pipeline_l124_10;
  reg                 decode_to_execute_IS_SFENCE_VMA2;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_RESCHEDULE_NEXT;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_13;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_15;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_16;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_17;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_19;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_20;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_22;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_23;
  reg                 decode_to_execute_MEMORY_WR;
  wire                when_Pipeline_l124_24;
  reg                 execute_to_memory_MEMORY_WR;
  wire                when_Pipeline_l124_25;
  reg                 memory_to_writeBack_MEMORY_WR;
  wire                when_Pipeline_l124_26;
  reg                 decode_to_execute_MEMORY_LRSC;
  wire                when_Pipeline_l124_27;
  reg                 execute_to_memory_MEMORY_LRSC;
  wire                when_Pipeline_l124_28;
  reg                 memory_to_writeBack_MEMORY_LRSC;
  wire                when_Pipeline_l124_29;
  reg                 decode_to_execute_MEMORY_AMO;
  wire                when_Pipeline_l124_30;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  wire                when_Pipeline_l124_31;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_32;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_33;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_34;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_35;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_36;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_37;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_38;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_39;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_40;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_41;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_42;
  reg        [2:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_43;
  reg        [2:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_44;
  reg        [2:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_45;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_46;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_47;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_48;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_49;
  reg        [31:0]   decode_to_execute_SRC1;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   decode_to_execute_SRC2;
  wire                when_Pipeline_l124_51;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_52;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_53;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_54;
  reg        [31:0]   execute_to_memory_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_55;
  reg        [31:0]   memory_to_writeBack_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_56;
  (* keep , syn_keep *) reg        [31:0]   execute_to_memory_MEMORY_VIRTUAL_ADDRESS /* synthesis syn_keep = 1 */ ;
  wire                when_Pipeline_l124_57;
  reg                 execute_to_memory_IS_DBUS_SHARING;
  wire                when_Pipeline_l124_58;
  reg                 memory_to_writeBack_IS_DBUS_SHARING;
  wire                when_Pipeline_l124_59;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_60;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_61;
  reg        [31:0]   execute_to_memory_MUL_LL;
  wire                when_Pipeline_l124_62;
  reg        [33:0]   execute_to_memory_MUL_LH;
  wire                when_Pipeline_l124_63;
  reg        [33:0]   execute_to_memory_MUL_HL;
  wire                when_Pipeline_l124_64;
  reg        [33:0]   execute_to_memory_MUL_HH;
  wire                when_Pipeline_l124_65;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  wire                when_Pipeline_l124_66;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    IBusCachedPlugin_injector_port_state;
  wire                when_Fetcher_l391;
  wire                when_CsrPlugin_l1813;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1813_1;
  reg                 execute_CsrPlugin_csr_256;
  wire                when_CsrPlugin_l1813_2;
  reg                 execute_CsrPlugin_csr_384;
  wire                when_CsrPlugin_l1813_3;
  reg                 execute_CsrPlugin_csr_3857;
  wire                when_CsrPlugin_l1813_4;
  reg                 execute_CsrPlugin_csr_3858;
  wire                when_CsrPlugin_l1813_5;
  reg                 execute_CsrPlugin_csr_3859;
  wire                when_CsrPlugin_l1813_6;
  reg                 execute_CsrPlugin_csr_3860;
  wire                when_CsrPlugin_l1813_7;
  reg                 execute_CsrPlugin_csr_769;
  wire                when_CsrPlugin_l1813_8;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1813_9;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1813_10;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1813_11;
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1813_12;
  reg                 execute_CsrPlugin_csr_832;
  wire                when_CsrPlugin_l1813_13;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1813_14;
  reg                 execute_CsrPlugin_csr_835;
  wire                when_CsrPlugin_l1813_15;
  reg                 execute_CsrPlugin_csr_770;
  wire                when_CsrPlugin_l1813_16;
  reg                 execute_CsrPlugin_csr_771;
  wire                when_CsrPlugin_l1813_17;
  reg                 execute_CsrPlugin_csr_324;
  wire                when_CsrPlugin_l1813_18;
  reg                 execute_CsrPlugin_csr_260;
  wire                when_CsrPlugin_l1813_19;
  reg                 execute_CsrPlugin_csr_261;
  wire                when_CsrPlugin_l1813_20;
  reg                 execute_CsrPlugin_csr_321;
  wire                when_CsrPlugin_l1813_21;
  reg                 execute_CsrPlugin_csr_320;
  wire                when_CsrPlugin_l1813_22;
  reg                 execute_CsrPlugin_csr_322;
  wire                when_CsrPlugin_l1813_23;
  reg                 execute_CsrPlugin_csr_323;
  wire                when_CsrPlugin_l1813_24;
  reg                 execute_CsrPlugin_csr_800;
  wire                when_CsrPlugin_l1813_25;
  reg                 execute_CsrPlugin_csr_3073;
  wire                when_CsrPlugin_l1813_26;
  reg                 execute_CsrPlugin_csr_3201;
  wire       [1:0]    switch_CsrPlugin_l1167;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_6;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_7;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_8;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_9;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_10;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_11;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_12;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_13;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_14;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_15;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_16;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_17;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_18;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_19;
  wire                when_CounterPlugin_l161;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_20;
  wire                when_CounterPlugin_l90;
  wire                when_CounterPlugin_l92;
  wire                when_CounterPlugin_l92_1;
  wire                when_CounterPlugin_l92_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_21;
  wire                when_CounterPlugin_l90_1;
  wire                when_CounterPlugin_l92_3;
  wire                when_CounterPlugin_l92_4;
  wire                when_CounterPlugin_l92_5;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_22;
  wire                when_CsrPlugin_l1846;
  wire       [11:0]   _zz_when_CsrPlugin_l1853;
  wire                when_CsrPlugin_l1853;
  reg                 when_CsrPlugin_l1863;
  wire                when_CsrPlugin_l1861;
  wire                when_CsrPlugin_l1869;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [47:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [47:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [47:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [47:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_decode_ENV_CTRL_string;
  reg [47:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [47:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_memory_ENV_CTRL_string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_execute_ENV_CTRL_string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_writeBack_ENV_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [47:0] _zz_decode_ENV_CTRL_1_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [47:0] MmuPlugin_shared_state_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [47:0] _zz_decode_ENV_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_when = (|{decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid});
  assign _zz_when_1 = (|{BranchPlugin_branchExceptionPort_valid,CsrPlugin_selfException_valid});
  assign _zz_memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW_1) + $signed(_zz_memory_MUL_LOW_4));
  assign _zz_memory_MUL_LOW_1 = ($signed(52'h0) + $signed(_zz_memory_MUL_LOW_2));
  assign _zz_memory_MUL_LOW_3 = {1'b0,memory_MUL_LL};
  assign _zz_memory_MUL_LOW_2 = {{19{_zz_memory_MUL_LOW_3[32]}}, _zz_memory_MUL_LOW_3};
  assign _zz_memory_MUL_LOW_5 = ({16'd0,memory_MUL_LH} <<< 5'd16);
  assign _zz_memory_MUL_LOW_4 = {{2{_zz_memory_MUL_LOW_5[49]}}, _zz_memory_MUL_LOW_5};
  assign _zz_memory_MUL_LOW_7 = ({16'd0,memory_MUL_HL} <<< 5'd16);
  assign _zz_memory_MUL_LOW_6 = {{2{_zz_memory_MUL_LOW_7[49]}}, _zz_memory_MUL_LOW_7};
  assign _zz_decode_DO_EBREAK = (decode_PC >>> 1'd1);
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_MmuPlugin_ports_0_entryToReplace_valueNext_1 = MmuPlugin_ports_0_entryToReplace_willIncrement;
  assign _zz_MmuPlugin_ports_0_entryToReplace_valueNext = {1'd0, _zz_MmuPlugin_ports_0_entryToReplace_valueNext_1};
  assign _zz_MmuPlugin_ports_1_entryToReplace_valueNext_1 = MmuPlugin_ports_1_entryToReplace_willIncrement;
  assign _zz_MmuPlugin_ports_1_entryToReplace_valueNext = {1'd0, _zz_MmuPlugin_ports_1_entryToReplace_valueNext_1};
  assign _zz__zz_MmuPlugin_shared_refills_2 = (_zz_MmuPlugin_shared_refills_1 - 2'b01);
  assign _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload - 4'b0001);
  assign _zz_IBusCachedPlugin_fetchPc_pc_1 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_IBusCachedPlugin_fetchPc_pc = {29'd0, _zz_IBusCachedPlugin_fetchPc_pc_1};
  assign _zz_io_cpu_flush_payload_lineId = _zz_io_cpu_flush_payload_lineId_1;
  assign _zz_io_cpu_flush_payload_lineId_1 = (execute_RS1 >>> 3'd6);
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code_1 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz_writeBack_DBusCachedPlugin_rspRf = (! dataCache_1_io_cpu_writeBack_exclusiveOk);
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_decode_SRC1 = 3'b100;
  assign _zz__zz_decode_SRC1_1 = decode_INSTRUCTION[19 : 15];
  assign _zz__zz_decode_SRC2_2 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? 32'h00000001 : 32'h0);
  assign _zz_writeBack_MulPlugin_result = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_writeBack_MulPlugin_result_1 = ({32'd0,writeBack_MUL_HH} <<< 6'd32);
  assign _zz__zz_decode_RS2_2 = writeBack_MUL_LOW[31 : 0];
  assign _zz__zz_decode_RS2_2_1 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1 = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_memory_MulDivIterativePlugin_div_counter_valueNext = {5'd0, _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1};
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1 = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator = {_zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_MulDivIterativePlugin_div_result_1 = _zz_memory_MulDivIterativePlugin_div_result_2;
  assign _zz_memory_MulDivIterativePlugin_div_result_2 = _zz_memory_MulDivIterativePlugin_div_result_3;
  assign _zz_memory_MulDivIterativePlugin_div_result_3 = ({memory_MulDivIterativePlugin_div_needRevert,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_memory_MulDivIterativePlugin_div_result) : _zz_memory_MulDivIterativePlugin_div_result)} + _zz_memory_MulDivIterativePlugin_div_result_4);
  assign _zz_memory_MulDivIterativePlugin_div_result_5 = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_memory_MulDivIterativePlugin_div_result_4 = {32'd0, _zz_memory_MulDivIterativePlugin_div_result_5};
  assign _zz_memory_MulDivIterativePlugin_rs1_3 = _zz_memory_MulDivIterativePlugin_rs1;
  assign _zz_memory_MulDivIterativePlugin_rs1_2 = {32'd0, _zz_memory_MulDivIterativePlugin_rs1_3};
  assign _zz_memory_MulDivIterativePlugin_rs2_2 = _zz_memory_MulDivIterativePlugin_rs2;
  assign _zz_memory_MulDivIterativePlugin_rs2_1 = {31'd0, _zz_memory_MulDivIterativePlugin_rs2_2};
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code - 2'b01);
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_2 & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_2 - 2'b01);
  assign _zz__zz_execute_BranchPlugin_branch_src2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_CounterPlugin_cycle_1 = (CounterPlugin_dbgCtrEn && (! CounterPlugin_inhibitCY));
  assign _zz_CounterPlugin_cycle = {63'd0, _zz_CounterPlugin_cycle_1};
  assign _zz_CounterPlugin_instret_1 = (CounterPlugin_dbgCtrEn && (! CounterPlugin_inhibitIR));
  assign _zz_CounterPlugin_instret = {63'd0, _zz_CounterPlugin_instret_1};
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = {_zz_IBusCachedPlugin_jump_pcLoad_payload_4,_zz_IBusCachedPlugin_jump_pcLoad_payload_3};
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_1 = dataCache_1_io_cpu_writeBack_address[1 : 0];
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_3 = dataCache_1_io_cpu_writeBack_address[1 : 1];
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000107f) == 32'h00000013),{((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000207f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000505f);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000003;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000707b) == 32'h00000063);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'h1800707f) == 32'h0000202f),{((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h0800202f),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'he800707f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'h01f0707f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h0000500f;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hbe00705f) == 32'h00005013);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hfe00305f) == 32'h00001013);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = {((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033),{((decode_INSTRUCTION & 32'hf9f0707f) == 32'h1000202f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_18) == 32'h12000073),{(_zz_decode_LEGAL_INSTRUCTION_19 == _zz_decode_LEGAL_INSTRUCTION_20),{_zz_decode_LEGAL_INSTRUCTION_21,_zz_decode_LEGAL_INSTRUCTION_22}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_18 = 32'hfe007fff;
  assign _zz_decode_LEGAL_INSTRUCTION_19 = (decode_INSTRUCTION & 32'hdfffffff);
  assign _zz_decode_LEGAL_INSTRUCTION_20 = 32'h10200073;
  assign _zz_decode_LEGAL_INSTRUCTION_21 = ((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073);
  assign _zz_decode_LEGAL_INSTRUCTION_22 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073);
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22];
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_1 = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12];
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_2 = (MmuPlugin_ports_0_cache_1_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22]);
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_3 = (MmuPlugin_ports_0_cache_1_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]);
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_4 = (MmuPlugin_ports_0_cache_0_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22]);
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_5 = (MmuPlugin_ports_0_cache_0_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]);
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22];
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_1 = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12];
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_2 = (MmuPlugin_ports_1_cache_1_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22]);
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_3 = (MmuPlugin_ports_1_cache_1_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]);
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_4 = (MmuPlugin_ports_1_cache_0_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22]);
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_5 = (MmuPlugin_ports_1_cache_0_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]);
  assign _zz__zz_decode_IS_CSR = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz__zz_decode_IS_CSR_1 = 32'h00000004;
  assign _zz__zz_decode_IS_CSR_2 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_CSR_3 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_4 = _zz_decode_IS_CSR_12;
  assign _zz__zz_decode_IS_CSR_5 = (|{((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_6) == 32'h00000050),((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_7) == 32'h10000050)});
  assign _zz__zz_decode_IS_CSR_8 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_9) == 32'h00000050));
  assign _zz__zz_decode_IS_CSR_10 = {(|{_zz__zz_decode_IS_CSR_11,_zz__zz_decode_IS_CSR_12}),{(|_zz_decode_IS_CSR_11),{(|_zz__zz_decode_IS_CSR_13),{_zz__zz_decode_IS_CSR_14,{_zz__zz_decode_IS_CSR_15,_zz__zz_decode_IS_CSR_17}}}}};
  assign _zz__zz_decode_IS_CSR_6 = 32'h10103050;
  assign _zz__zz_decode_IS_CSR_7 = 32'h12203050;
  assign _zz__zz_decode_IS_CSR_9 = 32'h02103050;
  assign _zz__zz_decode_IS_CSR_11 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz__zz_decode_IS_CSR_12 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz__zz_decode_IS_CSR_13 = _zz_decode_IS_CSR_11;
  assign _zz__zz_decode_IS_CSR_14 = (|((decode_INSTRUCTION & 32'h02004064) == 32'h02004020));
  assign _zz__zz_decode_IS_CSR_15 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_16) == 32'h02000030));
  assign _zz__zz_decode_IS_CSR_17 = {(|(_zz__zz_decode_IS_CSR_18 == _zz__zz_decode_IS_CSR_19)),{(|{_zz__zz_decode_IS_CSR_20,_zz__zz_decode_IS_CSR_21}),{(|_zz__zz_decode_IS_CSR_22),{_zz__zz_decode_IS_CSR_23,{_zz__zz_decode_IS_CSR_25,_zz__zz_decode_IS_CSR_27}}}}};
  assign _zz__zz_decode_IS_CSR_16 = 32'h02004074;
  assign _zz__zz_decode_IS_CSR_18 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz__zz_decode_IS_CSR_19 = 32'h00005010;
  assign _zz__zz_decode_IS_CSR_20 = ((decode_INSTRUCTION & 32'h40003054) == 32'h40001010);
  assign _zz__zz_decode_IS_CSR_21 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz__zz_decode_IS_CSR_22 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_23 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_24) == 32'h00002000));
  assign _zz__zz_decode_IS_CSR_25 = (|{_zz_decode_IS_CSR_10,_zz__zz_decode_IS_CSR_26});
  assign _zz__zz_decode_IS_CSR_27 = {(|_zz__zz_decode_IS_CSR_28),{(|_zz__zz_decode_IS_CSR_29),{_zz__zz_decode_IS_CSR_30,{_zz__zz_decode_IS_CSR_38,_zz__zz_decode_IS_CSR_41}}}};
  assign _zz__zz_decode_IS_CSR_24 = 32'h00003000;
  assign _zz__zz_decode_IS_CSR_26 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_28 = ((decode_INSTRUCTION & 32'h00004048) == 32'h00004008);
  assign _zz__zz_decode_IS_CSR_29 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz__zz_decode_IS_CSR_30 = (|{(_zz__zz_decode_IS_CSR_31 == _zz__zz_decode_IS_CSR_32),{_zz__zz_decode_IS_CSR_33,{_zz__zz_decode_IS_CSR_34,_zz__zz_decode_IS_CSR_36}}});
  assign _zz__zz_decode_IS_CSR_38 = (|(_zz__zz_decode_IS_CSR_39 == _zz__zz_decode_IS_CSR_40));
  assign _zz__zz_decode_IS_CSR_41 = {(|_zz__zz_decode_IS_CSR_42),{(|_zz__zz_decode_IS_CSR_43),{_zz__zz_decode_IS_CSR_56,{_zz__zz_decode_IS_CSR_65,_zz__zz_decode_IS_CSR_76}}}};
  assign _zz__zz_decode_IS_CSR_31 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz__zz_decode_IS_CSR_32 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_33 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_34 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_35) == 32'h08000020);
  assign _zz__zz_decode_IS_CSR_36 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_37) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_39 = (decode_INSTRUCTION & 32'h10000008);
  assign _zz__zz_decode_IS_CSR_40 = 32'h00000008;
  assign _zz__zz_decode_IS_CSR_42 = ((decode_INSTRUCTION & 32'h10000008) == 32'h10000008);
  assign _zz__zz_decode_IS_CSR_43 = {(_zz__zz_decode_IS_CSR_44 == _zz__zz_decode_IS_CSR_45),{_zz__zz_decode_IS_CSR_46,{_zz__zz_decode_IS_CSR_48,_zz__zz_decode_IS_CSR_51}}};
  assign _zz__zz_decode_IS_CSR_56 = (|{_zz__zz_decode_IS_CSR_57,{_zz__zz_decode_IS_CSR_59,_zz__zz_decode_IS_CSR_62}});
  assign _zz__zz_decode_IS_CSR_65 = (|{_zz__zz_decode_IS_CSR_66,_zz__zz_decode_IS_CSR_69});
  assign _zz__zz_decode_IS_CSR_76 = {(|_zz__zz_decode_IS_CSR_77),{_zz__zz_decode_IS_CSR_82,{_zz__zz_decode_IS_CSR_97,_zz__zz_decode_IS_CSR_101}}};
  assign _zz__zz_decode_IS_CSR_35 = 32'h08000070;
  assign _zz__zz_decode_IS_CSR_37 = 32'h10000070;
  assign _zz__zz_decode_IS_CSR_44 = (decode_INSTRUCTION & 32'h00002040);
  assign _zz__zz_decode_IS_CSR_45 = 32'h00002040;
  assign _zz__zz_decode_IS_CSR_46 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_47) == 32'h00001040);
  assign _zz__zz_decode_IS_CSR_48 = (_zz__zz_decode_IS_CSR_49 == _zz__zz_decode_IS_CSR_50);
  assign _zz__zz_decode_IS_CSR_51 = {_zz_decode_IS_CSR_10,{_zz__zz_decode_IS_CSR_52,_zz__zz_decode_IS_CSR_53}};
  assign _zz__zz_decode_IS_CSR_57 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_58) == 32'h08000020);
  assign _zz__zz_decode_IS_CSR_59 = (_zz__zz_decode_IS_CSR_60 == _zz__zz_decode_IS_CSR_61);
  assign _zz__zz_decode_IS_CSR_62 = (_zz__zz_decode_IS_CSR_63 == _zz__zz_decode_IS_CSR_64);
  assign _zz__zz_decode_IS_CSR_66 = (_zz__zz_decode_IS_CSR_67 == _zz__zz_decode_IS_CSR_68);
  assign _zz__zz_decode_IS_CSR_69 = {_zz__zz_decode_IS_CSR_70,{_zz__zz_decode_IS_CSR_72,_zz__zz_decode_IS_CSR_73}};
  assign _zz__zz_decode_IS_CSR_77 = {_zz_decode_IS_CSR_9,{_zz__zz_decode_IS_CSR_78,_zz__zz_decode_IS_CSR_79}};
  assign _zz__zz_decode_IS_CSR_82 = (|{_zz__zz_decode_IS_CSR_83,_zz__zz_decode_IS_CSR_84});
  assign _zz__zz_decode_IS_CSR_97 = (|_zz__zz_decode_IS_CSR_98);
  assign _zz__zz_decode_IS_CSR_101 = {_zz__zz_decode_IS_CSR_102,{_zz__zz_decode_IS_CSR_107,_zz__zz_decode_IS_CSR_111}};
  assign _zz__zz_decode_IS_CSR_47 = 32'h00001040;
  assign _zz__zz_decode_IS_CSR_49 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz__zz_decode_IS_CSR_50 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_52 = _zz_decode_IS_CSR_6;
  assign _zz__zz_decode_IS_CSR_53 = (_zz__zz_decode_IS_CSR_54 == _zz__zz_decode_IS_CSR_55);
  assign _zz__zz_decode_IS_CSR_58 = 32'h08000020;
  assign _zz__zz_decode_IS_CSR_60 = (decode_INSTRUCTION & 32'h10000020);
  assign _zz__zz_decode_IS_CSR_61 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_63 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz__zz_decode_IS_CSR_64 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_67 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz__zz_decode_IS_CSR_68 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_70 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_71) == 32'h00004020);
  assign _zz__zz_decode_IS_CSR_72 = _zz_decode_IS_CSR_9;
  assign _zz__zz_decode_IS_CSR_73 = {_zz__zz_decode_IS_CSR_74,_zz_decode_IS_CSR_8};
  assign _zz__zz_decode_IS_CSR_78 = _zz_decode_IS_CSR_8;
  assign _zz__zz_decode_IS_CSR_79 = (_zz__zz_decode_IS_CSR_80 == _zz__zz_decode_IS_CSR_81);
  assign _zz__zz_decode_IS_CSR_83 = _zz_decode_IS_CSR_4;
  assign _zz__zz_decode_IS_CSR_84 = {_zz__zz_decode_IS_CSR_85,{_zz__zz_decode_IS_CSR_87,_zz__zz_decode_IS_CSR_90}};
  assign _zz__zz_decode_IS_CSR_98 = {_zz_decode_IS_CSR_7,_zz__zz_decode_IS_CSR_99};
  assign _zz__zz_decode_IS_CSR_102 = (|{_zz__zz_decode_IS_CSR_103,_zz__zz_decode_IS_CSR_104});
  assign _zz__zz_decode_IS_CSR_107 = (|_zz__zz_decode_IS_CSR_108);
  assign _zz__zz_decode_IS_CSR_111 = {_zz__zz_decode_IS_CSR_112,{_zz__zz_decode_IS_CSR_114,_zz__zz_decode_IS_CSR_126}};
  assign _zz__zz_decode_IS_CSR_54 = (decode_INSTRUCTION & 32'h02400040);
  assign _zz__zz_decode_IS_CSR_55 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_71 = 32'h00004020;
  assign _zz__zz_decode_IS_CSR_74 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_75) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_80 = (decode_INSTRUCTION & 32'h02000050);
  assign _zz__zz_decode_IS_CSR_81 = 32'h00000010;
  assign _zz__zz_decode_IS_CSR_85 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_86) == 32'h00001010);
  assign _zz__zz_decode_IS_CSR_87 = (_zz__zz_decode_IS_CSR_88 == _zz__zz_decode_IS_CSR_89);
  assign _zz__zz_decode_IS_CSR_90 = {_zz__zz_decode_IS_CSR_91,{_zz__zz_decode_IS_CSR_92,_zz__zz_decode_IS_CSR_94}};
  assign _zz__zz_decode_IS_CSR_99 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_100) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_103 = _zz_decode_IS_CSR_7;
  assign _zz__zz_decode_IS_CSR_104 = (_zz__zz_decode_IS_CSR_105 == _zz__zz_decode_IS_CSR_106);
  assign _zz__zz_decode_IS_CSR_108 = (_zz__zz_decode_IS_CSR_109 == _zz__zz_decode_IS_CSR_110);
  assign _zz__zz_decode_IS_CSR_112 = (|_zz__zz_decode_IS_CSR_113);
  assign _zz__zz_decode_IS_CSR_114 = (|_zz__zz_decode_IS_CSR_115);
  assign _zz__zz_decode_IS_CSR_126 = {_zz__zz_decode_IS_CSR_127,{_zz__zz_decode_IS_CSR_130,_zz__zz_decode_IS_CSR_137}};
  assign _zz__zz_decode_IS_CSR_75 = 32'h02000010;
  assign _zz__zz_decode_IS_CSR_86 = 32'h00001010;
  assign _zz__zz_decode_IS_CSR_88 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_IS_CSR_89 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_91 = ((decode_INSTRUCTION & 32'h00002008) == 32'h00002008);
  assign _zz__zz_decode_IS_CSR_92 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_93) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_94 = {_zz_decode_IS_CSR_8,(_zz__zz_decode_IS_CSR_95 == _zz__zz_decode_IS_CSR_96)};
  assign _zz__zz_decode_IS_CSR_100 = 32'h00000070;
  assign _zz__zz_decode_IS_CSR_105 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_IS_CSR_106 = 32'h0;
  assign _zz__zz_decode_IS_CSR_109 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz__zz_decode_IS_CSR_110 = 32'h00004010;
  assign _zz__zz_decode_IS_CSR_113 = ((decode_INSTRUCTION & 32'h00006014) == 32'h00002010);
  assign _zz__zz_decode_IS_CSR_115 = {(_zz__zz_decode_IS_CSR_116 == _zz__zz_decode_IS_CSR_117),{_zz_decode_IS_CSR_6,{_zz__zz_decode_IS_CSR_118,_zz__zz_decode_IS_CSR_121}}};
  assign _zz__zz_decode_IS_CSR_127 = (|{_zz_decode_IS_CSR_5,_zz__zz_decode_IS_CSR_128});
  assign _zz__zz_decode_IS_CSR_130 = (|{_zz__zz_decode_IS_CSR_131,_zz__zz_decode_IS_CSR_134});
  assign _zz__zz_decode_IS_CSR_137 = {(|_zz__zz_decode_IS_CSR_138),{_zz__zz_decode_IS_CSR_142,{_zz__zz_decode_IS_CSR_146,_zz__zz_decode_IS_CSR_148}}};
  assign _zz__zz_decode_IS_CSR_93 = 32'h00000050;
  assign _zz__zz_decode_IS_CSR_95 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz__zz_decode_IS_CSR_96 = 32'h0;
  assign _zz__zz_decode_IS_CSR_116 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_CSR_117 = 32'h0;
  assign _zz__zz_decode_IS_CSR_118 = (_zz__zz_decode_IS_CSR_119 == _zz__zz_decode_IS_CSR_120);
  assign _zz__zz_decode_IS_CSR_121 = {_zz__zz_decode_IS_CSR_122,{_zz__zz_decode_IS_CSR_123,_zz__zz_decode_IS_CSR_125}};
  assign _zz__zz_decode_IS_CSR_128 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_129) == 32'h0);
  assign _zz__zz_decode_IS_CSR_131 = (_zz__zz_decode_IS_CSR_132 == _zz__zz_decode_IS_CSR_133);
  assign _zz__zz_decode_IS_CSR_134 = {_zz__zz_decode_IS_CSR_135,_zz__zz_decode_IS_CSR_136};
  assign _zz__zz_decode_IS_CSR_138 = {_zz_decode_IS_CSR_4,{_zz__zz_decode_IS_CSR_139,_zz__zz_decode_IS_CSR_140}};
  assign _zz__zz_decode_IS_CSR_142 = (|{_zz__zz_decode_IS_CSR_143,_zz__zz_decode_IS_CSR_144});
  assign _zz__zz_decode_IS_CSR_146 = (|_zz__zz_decode_IS_CSR_147);
  assign _zz__zz_decode_IS_CSR_148 = {_zz__zz_decode_IS_CSR_149,_zz__zz_decode_IS_CSR_150};
  assign _zz__zz_decode_IS_CSR_119 = (decode_INSTRUCTION & 32'h00006004);
  assign _zz__zz_decode_IS_CSR_120 = 32'h00002000;
  assign _zz__zz_decode_IS_CSR_122 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_123 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_124) == 32'h00004000);
  assign _zz__zz_decode_IS_CSR_125 = _zz_decode_IS_CSR_5;
  assign _zz__zz_decode_IS_CSR_129 = 32'h00000058;
  assign _zz__zz_decode_IS_CSR_132 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_CSR_133 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_135 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz__zz_decode_IS_CSR_136 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz__zz_decode_IS_CSR_139 = _zz_decode_IS_CSR_3;
  assign _zz__zz_decode_IS_CSR_140 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_141) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_143 = _zz_decode_IS_CSR_3;
  assign _zz__zz_decode_IS_CSR_144 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_145) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_147 = _zz_decode_IS_CSR_2;
  assign _zz__zz_decode_IS_CSR_149 = (|{_zz_decode_IS_CSR_2,_zz_decode_IS_CSR_1});
  assign _zz__zz_decode_IS_CSR_150 = (|_zz_decode_IS_CSR_1);
  assign _zz__zz_decode_IS_CSR_124 = 32'h00004050;
  assign _zz__zz_decode_IS_CSR_141 = 32'h00002014;
  assign _zz__zz_decode_IS_CSR_145 = 32'h0000004c;
  assign _zz_CsrPlugin_csrMapping_readDataInit_23 = 32'h0;
  assign _zz_CsrPlugin_csrMapping_readDataInit_24 = 32'h0;
  assign _zz_CsrPlugin_csrMapping_readDataInit_25 = 32'h0;
  assign _zz_CsrPlugin_csrMapping_readDataInit_26 = 32'h0;
  assign RegFilePlugin_regFile_spinal_port0 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
  assign RegFilePlugin_regFile_spinal_port1 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
  always @(posedge debugCd_external_clk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                              (IBusCachedPlugin_cache_io_flush                           ), //i
    .io_cpu_prefetch_isValid               (IBusCachedPlugin_cache_io_cpu_prefetch_isValid            ), //i
    .io_cpu_prefetch_haltIt                (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt             ), //o
    .io_cpu_prefetch_pc                    (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]     ), //i
    .io_cpu_fetch_isValid                  (IBusCachedPlugin_cache_io_cpu_fetch_isValid               ), //i
    .io_cpu_fetch_isStuck                  (IBusCachedPlugin_cache_io_cpu_fetch_isStuck               ), //i
    .io_cpu_fetch_isRemoved                (IBusCachedPlugin_cache_io_cpu_fetch_isRemoved             ), //i
    .io_cpu_fetch_pc                       (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]     ), //i
    .io_cpu_fetch_data                     (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]            ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress   (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]         ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess        (IBusCachedPlugin_mmuBus_rsp_isIoAccess                    ), //i
    .io_cpu_fetch_mmuRsp_isPaging          (IBusCachedPlugin_mmuBus_rsp_isPaging                      ), //i
    .io_cpu_fetch_mmuRsp_allowRead         (IBusCachedPlugin_mmuBus_rsp_allowRead                     ), //i
    .io_cpu_fetch_mmuRsp_allowWrite        (IBusCachedPlugin_mmuBus_rsp_allowWrite                    ), //i
    .io_cpu_fetch_mmuRsp_allowExecute      (IBusCachedPlugin_mmuBus_rsp_allowExecute                  ), //i
    .io_cpu_fetch_mmuRsp_exception         (IBusCachedPlugin_mmuBus_rsp_exception                     ), //i
    .io_cpu_fetch_mmuRsp_refilling         (IBusCachedPlugin_mmuBus_rsp_refilling                     ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation (IBusCachedPlugin_mmuBus_rsp_bypassTranslation             ), //i
    .io_cpu_fetch_mmuRsp_ways_0_sel        (IBusCachedPlugin_mmuBus_rsp_ways_0_sel                    ), //i
    .io_cpu_fetch_mmuRsp_ways_0_physical   (IBusCachedPlugin_mmuBus_rsp_ways_0_physical[31:0]         ), //i
    .io_cpu_fetch_mmuRsp_ways_1_sel        (IBusCachedPlugin_mmuBus_rsp_ways_1_sel                    ), //i
    .io_cpu_fetch_mmuRsp_ways_1_physical   (IBusCachedPlugin_mmuBus_rsp_ways_1_physical[31:0]         ), //i
    .io_cpu_fetch_mmuRsp_ways_2_sel        (IBusCachedPlugin_mmuBus_rsp_ways_2_sel                    ), //i
    .io_cpu_fetch_mmuRsp_ways_2_physical   (IBusCachedPlugin_mmuBus_rsp_ways_2_physical[31:0]         ), //i
    .io_cpu_fetch_mmuRsp_ways_3_sel        (IBusCachedPlugin_mmuBus_rsp_ways_3_sel                    ), //i
    .io_cpu_fetch_mmuRsp_ways_3_physical   (IBusCachedPlugin_mmuBus_rsp_ways_3_physical[31:0]         ), //i
    .io_cpu_fetch_physicalAddress          (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0] ), //o
    .io_cpu_decode_isValid                 (IBusCachedPlugin_cache_io_cpu_decode_isValid              ), //i
    .io_cpu_decode_isStuck                 (IBusCachedPlugin_cache_io_cpu_decode_isStuck              ), //i
    .io_cpu_decode_pc                      (IBusCachedPlugin_iBusRsp_stages_3_input_payload[31:0]     ), //i
    .io_cpu_decode_physicalAddress         (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]), //o
    .io_cpu_decode_data                    (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]           ), //o
    .io_cpu_decode_cacheMiss               (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss            ), //o
    .io_cpu_decode_error                   (IBusCachedPlugin_cache_io_cpu_decode_error                ), //o
    .io_cpu_decode_mmuRefilling            (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling         ), //o
    .io_cpu_decode_mmuException            (IBusCachedPlugin_cache_io_cpu_decode_mmuException         ), //o
    .io_cpu_decode_isUser                  (IBusCachedPlugin_cache_io_cpu_decode_isUser               ), //i
    .io_cpu_fill_valid                     (IBusCachedPlugin_cache_io_cpu_fill_valid                  ), //i
    .io_cpu_fill_payload                   (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]), //i
    .io_mem_cmd_valid                      (IBusCachedPlugin_cache_io_mem_cmd_valid                   ), //o
    .io_mem_cmd_ready                      (iBus_cmd_ready                                            ), //i
    .io_mem_cmd_payload_address            (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]   ), //o
    .io_mem_cmd_payload_size               (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]       ), //o
    .io_mem_rsp_valid                      (iBus_rsp_valid                                            ), //i
    .io_mem_rsp_payload_data               (iBus_rsp_payload_data[31:0]                               ), //i
    .io_mem_rsp_payload_error              (iBus_rsp_payload_error                                    ), //i
    ._zz_when_Fetcher_l411                 (IBusCachedPlugin_injector_port_state[2:0]                 ), //i
    ._zz_io_cpu_fetch_data_regNextWhen     (DebugPlugin_injectionPort_payload[31:0]                   ), //i
    .debugCd_external_clk                  (debugCd_external_clk                                      ), //i
    .systemCd_logic_outputReset            (systemCd_logic_outputReset                                )  //i
  );
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                 (dataCache_1_io_cpu_execute_isValid                  ), //i
    .io_cpu_execute_address                 (dataCache_1_io_cpu_execute_address[31:0]            ), //i
    .io_cpu_execute_haltIt                  (dataCache_1_io_cpu_execute_haltIt                   ), //o
    .io_cpu_execute_args_wr                 (dataCache_1_io_cpu_execute_args_wr                  ), //i
    .io_cpu_execute_args_size               (dataCache_1_io_cpu_execute_args_size[1:0]           ), //i
    .io_cpu_execute_args_isLrsc             (dataCache_1_io_cpu_execute_args_isLrsc              ), //i
    .io_cpu_execute_args_isAmo              (execute_MEMORY_AMO                                  ), //i
    .io_cpu_execute_args_amoCtrl_swap       (dataCache_1_io_cpu_execute_args_amoCtrl_swap        ), //i
    .io_cpu_execute_args_amoCtrl_alu        (dataCache_1_io_cpu_execute_args_amoCtrl_alu[2:0]    ), //i
    .io_cpu_execute_args_totalyConsistent   (execute_MEMORY_FORCE_CONSTISTENCY                   ), //i
    .io_cpu_execute_refilling               (dataCache_1_io_cpu_execute_refilling                ), //o
    .io_cpu_memory_isValid                  (dataCache_1_io_cpu_memory_isValid                   ), //i
    .io_cpu_memory_isStuck                  (memory_arbitration_isStuck                          ), //i
    .io_cpu_memory_isWrite                  (dataCache_1_io_cpu_memory_isWrite                   ), //o
    .io_cpu_memory_address                  (memory_MEMORY_VIRTUAL_ADDRESS[31:0]                 ), //i
    .io_cpu_memory_mmuRsp_physicalAddress   (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]   ), //i
    .io_cpu_memory_mmuRsp_isIoAccess        (dataCache_1_io_cpu_memory_mmuRsp_isIoAccess         ), //i
    .io_cpu_memory_mmuRsp_isPaging          (DBusCachedPlugin_mmuBus_rsp_isPaging                ), //i
    .io_cpu_memory_mmuRsp_allowRead         (DBusCachedPlugin_mmuBus_rsp_allowRead               ), //i
    .io_cpu_memory_mmuRsp_allowWrite        (DBusCachedPlugin_mmuBus_rsp_allowWrite              ), //i
    .io_cpu_memory_mmuRsp_allowExecute      (DBusCachedPlugin_mmuBus_rsp_allowExecute            ), //i
    .io_cpu_memory_mmuRsp_exception         (DBusCachedPlugin_mmuBus_rsp_exception               ), //i
    .io_cpu_memory_mmuRsp_refilling         (DBusCachedPlugin_mmuBus_rsp_refilling               ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation (DBusCachedPlugin_mmuBus_rsp_bypassTranslation       ), //i
    .io_cpu_memory_mmuRsp_ways_0_sel        (DBusCachedPlugin_mmuBus_rsp_ways_0_sel              ), //i
    .io_cpu_memory_mmuRsp_ways_0_physical   (DBusCachedPlugin_mmuBus_rsp_ways_0_physical[31:0]   ), //i
    .io_cpu_memory_mmuRsp_ways_1_sel        (DBusCachedPlugin_mmuBus_rsp_ways_1_sel              ), //i
    .io_cpu_memory_mmuRsp_ways_1_physical   (DBusCachedPlugin_mmuBus_rsp_ways_1_physical[31:0]   ), //i
    .io_cpu_memory_mmuRsp_ways_2_sel        (DBusCachedPlugin_mmuBus_rsp_ways_2_sel              ), //i
    .io_cpu_memory_mmuRsp_ways_2_physical   (DBusCachedPlugin_mmuBus_rsp_ways_2_physical[31:0]   ), //i
    .io_cpu_memory_mmuRsp_ways_3_sel        (DBusCachedPlugin_mmuBus_rsp_ways_3_sel              ), //i
    .io_cpu_memory_mmuRsp_ways_3_physical   (DBusCachedPlugin_mmuBus_rsp_ways_3_physical[31:0]   ), //i
    .io_cpu_writeBack_isValid               (dataCache_1_io_cpu_writeBack_isValid                ), //i
    .io_cpu_writeBack_isStuck               (writeBack_arbitration_isStuck                       ), //i
    .io_cpu_writeBack_isFiring              (writeBack_arbitration_isFiring                      ), //i
    .io_cpu_writeBack_isUser                (dataCache_1_io_cpu_writeBack_isUser                 ), //i
    .io_cpu_writeBack_haltIt                (dataCache_1_io_cpu_writeBack_haltIt                 ), //o
    .io_cpu_writeBack_isWrite               (dataCache_1_io_cpu_writeBack_isWrite                ), //o
    .io_cpu_writeBack_storeData             (dataCache_1_io_cpu_writeBack_storeData[31:0]        ), //i
    .io_cpu_writeBack_data                  (dataCache_1_io_cpu_writeBack_data[31:0]             ), //o
    .io_cpu_writeBack_address               (dataCache_1_io_cpu_writeBack_address[31:0]          ), //i
    .io_cpu_writeBack_mmuException          (dataCache_1_io_cpu_writeBack_mmuException           ), //o
    .io_cpu_writeBack_unalignedAccess       (dataCache_1_io_cpu_writeBack_unalignedAccess        ), //o
    .io_cpu_writeBack_accessError           (dataCache_1_io_cpu_writeBack_accessError            ), //o
    .io_cpu_writeBack_keepMemRspData        (dataCache_1_io_cpu_writeBack_keepMemRspData         ), //o
    .io_cpu_writeBack_fence_SW              (dataCache_1_io_cpu_writeBack_fence_SW               ), //i
    .io_cpu_writeBack_fence_SR              (dataCache_1_io_cpu_writeBack_fence_SR               ), //i
    .io_cpu_writeBack_fence_SO              (dataCache_1_io_cpu_writeBack_fence_SO               ), //i
    .io_cpu_writeBack_fence_SI              (dataCache_1_io_cpu_writeBack_fence_SI               ), //i
    .io_cpu_writeBack_fence_PW              (dataCache_1_io_cpu_writeBack_fence_PW               ), //i
    .io_cpu_writeBack_fence_PR              (dataCache_1_io_cpu_writeBack_fence_PR               ), //i
    .io_cpu_writeBack_fence_PO              (dataCache_1_io_cpu_writeBack_fence_PO               ), //i
    .io_cpu_writeBack_fence_PI              (dataCache_1_io_cpu_writeBack_fence_PI               ), //i
    .io_cpu_writeBack_fence_FM              (dataCache_1_io_cpu_writeBack_fence_FM[3:0]          ), //i
    .io_cpu_writeBack_exclusiveOk           (dataCache_1_io_cpu_writeBack_exclusiveOk            ), //o
    .io_cpu_redo                            (dataCache_1_io_cpu_redo                             ), //o
    .io_cpu_flush_valid                     (dataCache_1_io_cpu_flush_valid                      ), //i
    .io_cpu_flush_ready                     (dataCache_1_io_cpu_flush_ready                      ), //o
    .io_cpu_flush_payload_singleLine        (dataCache_1_io_cpu_flush_payload_singleLine         ), //i
    .io_cpu_flush_payload_lineId            (dataCache_1_io_cpu_flush_payload_lineId[5:0]        ), //i
    .io_cpu_writesPending                   (dataCache_1_io_cpu_writesPending                    ), //o
    .io_mem_cmd_valid                       (dataCache_1_io_mem_cmd_valid                        ), //o
    .io_mem_cmd_ready                       (cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN), //i
    .io_mem_cmd_payload_wr                  (dataCache_1_io_mem_cmd_payload_wr                   ), //o
    .io_mem_cmd_payload_uncached            (dataCache_1_io_mem_cmd_payload_uncached             ), //o
    .io_mem_cmd_payload_address             (dataCache_1_io_mem_cmd_payload_address[31:0]        ), //o
    .io_mem_cmd_payload_data                (dataCache_1_io_mem_cmd_payload_data[31:0]           ), //o
    .io_mem_cmd_payload_mask                (dataCache_1_io_mem_cmd_payload_mask[3:0]            ), //o
    .io_mem_cmd_payload_size                (dataCache_1_io_mem_cmd_payload_size[2:0]            ), //o
    .io_mem_cmd_payload_last                (dataCache_1_io_mem_cmd_payload_last                 ), //o
    .io_mem_rsp_valid                       (dBus_rsp_regNext_valid                              ), //i
    .io_mem_rsp_payload_last                (dBus_rsp_regNext_payload_last                       ), //i
    .io_mem_rsp_payload_data                (dBus_rsp_regNext_payload_data[31:0]                 ), //i
    .io_mem_rsp_payload_error               (dBus_rsp_regNext_payload_error                      ), //i
    .debugCd_external_clk                   (debugCd_external_clk                                ), //i
    .systemCd_logic_outputReset             (systemCd_logic_outputReset                          )  //i
  );
  always @(*) begin
    case(_zz_MmuPlugin_ports_0_cacheLine_valid_3)
      2'b00 : begin
        _zz_MmuPlugin_ports_0_cacheLine_valid_4 = MmuPlugin_ports_0_cache_0_valid;
        _zz_MmuPlugin_ports_0_cacheLine_exception = MmuPlugin_ports_0_cache_0_exception;
        _zz_MmuPlugin_ports_0_cacheLine_superPage = MmuPlugin_ports_0_cache_0_superPage;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0 = MmuPlugin_ports_0_cache_0_virtualAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1 = MmuPlugin_ports_0_cache_0_virtualAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0 = MmuPlugin_ports_0_cache_0_physicalAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1 = MmuPlugin_ports_0_cache_0_physicalAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_allowRead = MmuPlugin_ports_0_cache_0_allowRead;
        _zz_MmuPlugin_ports_0_cacheLine_allowWrite = MmuPlugin_ports_0_cache_0_allowWrite;
        _zz_MmuPlugin_ports_0_cacheLine_allowExecute = MmuPlugin_ports_0_cache_0_allowExecute;
        _zz_MmuPlugin_ports_0_cacheLine_allowUser = MmuPlugin_ports_0_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_MmuPlugin_ports_0_cacheLine_valid_4 = MmuPlugin_ports_0_cache_1_valid;
        _zz_MmuPlugin_ports_0_cacheLine_exception = MmuPlugin_ports_0_cache_1_exception;
        _zz_MmuPlugin_ports_0_cacheLine_superPage = MmuPlugin_ports_0_cache_1_superPage;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0 = MmuPlugin_ports_0_cache_1_virtualAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1 = MmuPlugin_ports_0_cache_1_virtualAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0 = MmuPlugin_ports_0_cache_1_physicalAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1 = MmuPlugin_ports_0_cache_1_physicalAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_allowRead = MmuPlugin_ports_0_cache_1_allowRead;
        _zz_MmuPlugin_ports_0_cacheLine_allowWrite = MmuPlugin_ports_0_cache_1_allowWrite;
        _zz_MmuPlugin_ports_0_cacheLine_allowExecute = MmuPlugin_ports_0_cache_1_allowExecute;
        _zz_MmuPlugin_ports_0_cacheLine_allowUser = MmuPlugin_ports_0_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_MmuPlugin_ports_0_cacheLine_valid_4 = MmuPlugin_ports_0_cache_2_valid;
        _zz_MmuPlugin_ports_0_cacheLine_exception = MmuPlugin_ports_0_cache_2_exception;
        _zz_MmuPlugin_ports_0_cacheLine_superPage = MmuPlugin_ports_0_cache_2_superPage;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0 = MmuPlugin_ports_0_cache_2_virtualAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1 = MmuPlugin_ports_0_cache_2_virtualAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0 = MmuPlugin_ports_0_cache_2_physicalAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1 = MmuPlugin_ports_0_cache_2_physicalAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_allowRead = MmuPlugin_ports_0_cache_2_allowRead;
        _zz_MmuPlugin_ports_0_cacheLine_allowWrite = MmuPlugin_ports_0_cache_2_allowWrite;
        _zz_MmuPlugin_ports_0_cacheLine_allowExecute = MmuPlugin_ports_0_cache_2_allowExecute;
        _zz_MmuPlugin_ports_0_cacheLine_allowUser = MmuPlugin_ports_0_cache_2_allowUser;
      end
      default : begin
        _zz_MmuPlugin_ports_0_cacheLine_valid_4 = MmuPlugin_ports_0_cache_3_valid;
        _zz_MmuPlugin_ports_0_cacheLine_exception = MmuPlugin_ports_0_cache_3_exception;
        _zz_MmuPlugin_ports_0_cacheLine_superPage = MmuPlugin_ports_0_cache_3_superPage;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0 = MmuPlugin_ports_0_cache_3_virtualAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1 = MmuPlugin_ports_0_cache_3_virtualAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0 = MmuPlugin_ports_0_cache_3_physicalAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1 = MmuPlugin_ports_0_cache_3_physicalAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_allowRead = MmuPlugin_ports_0_cache_3_allowRead;
        _zz_MmuPlugin_ports_0_cacheLine_allowWrite = MmuPlugin_ports_0_cache_3_allowWrite;
        _zz_MmuPlugin_ports_0_cacheLine_allowExecute = MmuPlugin_ports_0_cache_3_allowExecute;
        _zz_MmuPlugin_ports_0_cacheLine_allowUser = MmuPlugin_ports_0_cache_3_allowUser;
      end
    endcase
  end

  always @(*) begin
    case(_zz_MmuPlugin_ports_1_cacheLine_valid_3)
      2'b00 : begin
        _zz_MmuPlugin_ports_1_cacheLine_valid_4 = MmuPlugin_ports_1_cache_0_valid;
        _zz_MmuPlugin_ports_1_cacheLine_exception = MmuPlugin_ports_1_cache_0_exception;
        _zz_MmuPlugin_ports_1_cacheLine_superPage = MmuPlugin_ports_1_cache_0_superPage;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0 = MmuPlugin_ports_1_cache_0_virtualAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1 = MmuPlugin_ports_1_cache_0_virtualAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0 = MmuPlugin_ports_1_cache_0_physicalAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1 = MmuPlugin_ports_1_cache_0_physicalAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_allowRead = MmuPlugin_ports_1_cache_0_allowRead;
        _zz_MmuPlugin_ports_1_cacheLine_allowWrite = MmuPlugin_ports_1_cache_0_allowWrite;
        _zz_MmuPlugin_ports_1_cacheLine_allowExecute = MmuPlugin_ports_1_cache_0_allowExecute;
        _zz_MmuPlugin_ports_1_cacheLine_allowUser = MmuPlugin_ports_1_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_MmuPlugin_ports_1_cacheLine_valid_4 = MmuPlugin_ports_1_cache_1_valid;
        _zz_MmuPlugin_ports_1_cacheLine_exception = MmuPlugin_ports_1_cache_1_exception;
        _zz_MmuPlugin_ports_1_cacheLine_superPage = MmuPlugin_ports_1_cache_1_superPage;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0 = MmuPlugin_ports_1_cache_1_virtualAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1 = MmuPlugin_ports_1_cache_1_virtualAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0 = MmuPlugin_ports_1_cache_1_physicalAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1 = MmuPlugin_ports_1_cache_1_physicalAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_allowRead = MmuPlugin_ports_1_cache_1_allowRead;
        _zz_MmuPlugin_ports_1_cacheLine_allowWrite = MmuPlugin_ports_1_cache_1_allowWrite;
        _zz_MmuPlugin_ports_1_cacheLine_allowExecute = MmuPlugin_ports_1_cache_1_allowExecute;
        _zz_MmuPlugin_ports_1_cacheLine_allowUser = MmuPlugin_ports_1_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_MmuPlugin_ports_1_cacheLine_valid_4 = MmuPlugin_ports_1_cache_2_valid;
        _zz_MmuPlugin_ports_1_cacheLine_exception = MmuPlugin_ports_1_cache_2_exception;
        _zz_MmuPlugin_ports_1_cacheLine_superPage = MmuPlugin_ports_1_cache_2_superPage;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0 = MmuPlugin_ports_1_cache_2_virtualAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1 = MmuPlugin_ports_1_cache_2_virtualAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0 = MmuPlugin_ports_1_cache_2_physicalAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1 = MmuPlugin_ports_1_cache_2_physicalAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_allowRead = MmuPlugin_ports_1_cache_2_allowRead;
        _zz_MmuPlugin_ports_1_cacheLine_allowWrite = MmuPlugin_ports_1_cache_2_allowWrite;
        _zz_MmuPlugin_ports_1_cacheLine_allowExecute = MmuPlugin_ports_1_cache_2_allowExecute;
        _zz_MmuPlugin_ports_1_cacheLine_allowUser = MmuPlugin_ports_1_cache_2_allowUser;
      end
      default : begin
        _zz_MmuPlugin_ports_1_cacheLine_valid_4 = MmuPlugin_ports_1_cache_3_valid;
        _zz_MmuPlugin_ports_1_cacheLine_exception = MmuPlugin_ports_1_cache_3_exception;
        _zz_MmuPlugin_ports_1_cacheLine_superPage = MmuPlugin_ports_1_cache_3_superPage;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0 = MmuPlugin_ports_1_cache_3_virtualAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1 = MmuPlugin_ports_1_cache_3_virtualAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0 = MmuPlugin_ports_1_cache_3_physicalAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1 = MmuPlugin_ports_1_cache_3_physicalAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_allowRead = MmuPlugin_ports_1_cache_3_allowRead;
        _zz_MmuPlugin_ports_1_cacheLine_allowWrite = MmuPlugin_ports_1_cache_3_allowWrite;
        _zz_MmuPlugin_ports_1_cacheLine_allowExecute = MmuPlugin_ports_1_cache_3_allowExecute;
        _zz_MmuPlugin_ports_1_cacheLine_allowUser = MmuPlugin_ports_1_cache_3_allowUser;
      end
    endcase
  end

  always @(*) begin
    case(_zz_IBusCachedPlugin_jump_pcLoad_payload_6)
      2'b00 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = DBusCachedPlugin_redoBranch_payload;
      2'b01 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = CsrPlugin_jumpInterface_payload;
      2'b10 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = BranchPlugin_jumpInterface_payload;
      default : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = CsrPlugin_redoInterface_payload;
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_1)
      2'b00 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_0;
      2'b01 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_1;
      2'b10 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_2;
      default : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_3;
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_3)
      1'b0 : _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_1;
      default : _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_3;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_memory_to_writeBack_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_memory_to_writeBack_ENV_CTRL_1_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_to_writeBack_ENV_CTRL_1_string = "EBREAK";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_execute_to_memory_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : _zz_execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_execute_to_memory_ENV_CTRL_1_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_to_memory_ENV_CTRL_1_string = "EBREAK";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : decode_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : decode_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : decode_ENV_CTRL_string = "EBREAK";
      default : decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_to_execute_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : _zz_decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_to_execute_ENV_CTRL_1_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_to_execute_ENV_CTRL_1_string = "EBREAK";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : memory_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : memory_ENV_CTRL_string = "EBREAK";
      default : memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_memory_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_ENV_CTRL_string = "EBREAK";
      default : _zz_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : execute_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : execute_ENV_CTRL_string = "EBREAK";
      default : execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_execute_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_ENV_CTRL_string = "EBREAK";
      default : _zz_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : writeBack_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : writeBack_ENV_CTRL_string = "EBREAK";
      default : writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_writeBack_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_writeBack_ENV_CTRL_string = "EBREAK";
      default : _zz_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_ENV_CTRL_1_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_1_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(MmuPlugin_shared_state_1)
      MmuPlugin_shared_State_IDLE : MmuPlugin_shared_state_1_string = "IDLE  ";
      MmuPlugin_shared_State_L1_CMD : MmuPlugin_shared_state_1_string = "L1_CMD";
      MmuPlugin_shared_State_L1_RSP : MmuPlugin_shared_state_1_string = "L1_RSP";
      MmuPlugin_shared_State_L0_CMD : MmuPlugin_shared_state_1_string = "L0_CMD";
      MmuPlugin_shared_State_L0_RSP : MmuPlugin_shared_state_1_string = "L0_RSP";
      default : MmuPlugin_shared_state_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_2_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_2_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_ENV_CTRL_2_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_2_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_2_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_2_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : decode_to_execute_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : execute_to_memory_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : memory_to_writeBack_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW) + $signed(_zz_memory_MUL_LOW_6));
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign execute_MEMORY_VIRTUAL_ADDRESS = dataCache_1_io_cpu_execute_address;
  assign execute_MEMORY_STORE_DATA_RF = _zz_execute_MEMORY_STORE_DATA_RF;
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || (1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_decode_DO_EBREAK))))) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_SRC2 = _zz_decode_SRC2_4;
  assign decode_SRC1 = _zz_decode_SRC1;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_CSR[31];
  assign decode_IS_RS2_SIGNED = _zz_decode_IS_CSR[30];
  assign decode_IS_RS1_SIGNED = _zz_decode_IS_CSR[29];
  assign decode_IS_DIV = _zz_decode_IS_CSR[28];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_IS_CSR[27];
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_CSR[22];
  assign decode_MEMORY_MANAGMENT = _zz_decode_IS_CSR[21];
  assign memory_MEMORY_LRSC = execute_to_memory_MEMORY_LRSC;
  assign decode_MEMORY_WR = _zz_decode_IS_CSR[15];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_CSR[14];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_CSR[13];
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_RESCHEDULE_NEXT = _zz_decode_IS_CSR[1];
  assign decode_IS_SFENCE_VMA2 = _zz_decode_IS_CSR[0];
  assign decode_MEMORY_FORCE_CONSTISTENCY = _zz_decode_MEMORY_FORCE_CONSTISTENCY;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_IS_CSR[35];
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_execute_BRANCH_DO_1;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign execute_RESCHEDULE_NEXT = decode_to_execute_RESCHEDULE_NEXT;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign decode_RS2_USE = _zz_decode_IS_CSR[19];
  assign decode_RS1_USE = _zz_decode_IS_CSR[7];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  always @(*) begin
    _zz_decode_RS2 = memory_REGFILE_WRITE_DATA;
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2 = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
  end

  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  always @(*) begin
    _zz_decode_RS2_1 = execute_REGFILE_WRITE_DATA;
    if(execute_arbitration_isValid) begin
      case(execute_SHIFT_CTRL)
        ShiftCtrlEnum_SLL_1 : begin
          _zz_decode_RS2_1 = _zz_decode_RS2_3;
        end
        ShiftCtrlEnum_SRL_1, ShiftCtrlEnum_SRA_1 : begin
          _zz_decode_RS2_1 = execute_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(when_CsrPlugin_l1731) begin
      _zz_decode_RS2_1 = CsrPlugin_csrMapping_readDataSignal;
    end
    if(DBusCachedPlugin_forceDatapath) begin
      _zz_decode_RS2_1 = MmuPlugin_dBusAccess_cmd_payload_address;
    end
  end

  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_decode_to_execute_PC = decode_PC;
  assign _zz_decode_to_execute_RS2 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_RS1 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_CSR[5];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_CSR[20];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_CSR[12];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = (|{((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}});
  assign writeBack_IS_DBUS_SHARING = memory_to_writeBack_IS_DBUS_SHARING;
  assign execute_IS_DBUS_SHARING = MmuPlugin_dBusAccess_cmd_fire;
  assign memory_IS_DBUS_SHARING = execute_to_memory_IS_DBUS_SHARING;
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusCachedPlugin_l599) begin
      _zz_decode_RS2_2 = writeBack_DBusCachedPlugin_rspFormated;
    end
    if(when_MulPlugin_l147) begin
      case(switch_MulPlugin_l148)
        2'b00 : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2;
        end
        default : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2_1;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_LRSC = memory_to_writeBack_MEMORY_LRSC;
  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_MEMORY_STORE_DATA_RF = memory_to_writeBack_MEMORY_STORE_DATA_RF;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_PC = execute_to_memory_PC;
  assign memory_MEMORY_STORE_DATA_RF = execute_to_memory_MEMORY_STORE_DATA_RF;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign memory_MEMORY_VIRTUAL_ADDRESS = execute_to_memory_MEMORY_VIRTUAL_ADDRESS;
  always @(*) begin
    execute_MEMORY_AMO = decode_to_execute_MEMORY_AMO;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l623) begin
        execute_MEMORY_AMO = 1'b0;
      end
    end
  end

  always @(*) begin
    execute_MEMORY_LRSC = decode_to_execute_MEMORY_LRSC;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l623) begin
        execute_MEMORY_LRSC = 1'b0;
      end
    end
  end

  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_AMO = _zz_decode_IS_CSR[18];
  assign decode_MEMORY_LRSC = _zz_decode_IS_CSR[17];
  assign decode_MEMORY_ENABLE = _zz_decode_IS_CSR[6];
  assign decode_FLUSH_ALL = _zz_decode_IS_CSR[2];
  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(when_IBusCachedPlugin_l245) begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  always @(*) begin
    _zz_execute_to_memory_FORMAL_PC_NEXT = execute_FORMAL_PC_NEXT;
    if(CsrPlugin_redoInterface_valid) begin
      _zz_execute_to_memory_FORMAL_PC_NEXT = CsrPlugin_redoInterface_payload;
    end
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_execute_to_memory_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign execute_IS_SFENCE_VMA2 = decode_to_execute_IS_SFENCE_VMA2;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l356) begin
      decode_arbitration_haltItself = 1'b1;
    end
    case(IBusCachedPlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1671) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_when) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(_zz_when) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l398) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1663) begin
      if(when_CsrPlugin_l1665) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(when_CsrPlugin_l1735) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DBusCachedPlugin_l414) begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(_zz_when_1) begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_when_1) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_jumpInterface_valid) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_trigger_hitBefore) begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_trigger_hitBefore) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l572) begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1534) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1600) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l1416) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1534) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1600) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l324) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  assign IBusCachedPlugin_forceNoDecodeCond = 1'b0;
  always @(*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l242) begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_DBusCachedPlugin_l476 = 1'b0;
    if(DebugPlugin_godmode) begin
      _zz_when_DBusCachedPlugin_l476 = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
    if(when_CsrPlugin_l1846) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
    if(when_CsrPlugin_l1853) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_csrMapping_doForceFailCsr = 1'b0;
    if(execute_CsrPlugin_csr_800) begin
      if(when_CounterPlugin_l161) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
    end
    if(execute_CsrPlugin_csr_3073) begin
      if(when_CounterPlugin_l90) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
      if(when_CounterPlugin_l92) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
      if(when_CounterPlugin_l92_1) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
      if(when_CounterPlugin_l92_2) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
    end
    if(execute_CsrPlugin_csr_3201) begin
      if(when_CounterPlugin_l90_1) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
      if(when_CounterPlugin_l92_3) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
      if(when_CounterPlugin_l92_4) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
      if(when_CounterPlugin_l92_5) begin
        CsrPlugin_csrMapping_doForceFailCsr = 1'b1;
      end
    end
  end

  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  always @(*) begin
    CsrPlugin_inWfi = 1'b0;
    if(when_CsrPlugin_l1663) begin
      CsrPlugin_inWfi = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1534) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1600) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1534) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1600) begin
      case(switch_CsrPlugin_l1604)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        2'b01 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_sepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l344) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_xretAwayFromMachine = 1'b0;
    if(when_CsrPlugin_l1600) begin
      case(switch_CsrPlugin_l1604)
        2'b11 : begin
          if(when_CsrPlugin_l1612) begin
            CsrPlugin_xretAwayFromMachine = 1'b1;
          end
        end
        2'b01 : begin
          CsrPlugin_xretAwayFromMachine = 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    BranchPlugin_inDebugNoFetchFlag = 1'b0;
    if(DebugPlugin_godmode) begin
      BranchPlugin_inDebugNoFetchFlag = 1'b1;
    end
  end

  assign when_MmuPlugin_l117 = (! IBusCachedPlugin_mmuBus_cmd_1_isStuck);
  always @(*) begin
    MmuPlugin_ports_0_requireMmuLockupCalc = ((1'b1 && (! IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation)) && MmuPlugin_satp_mode);
    if(when_MmuPlugin_l131) begin
      MmuPlugin_ports_0_requireMmuLockupCalc = 1'b0;
    end
    if(when_MmuPlugin_l132) begin
      MmuPlugin_ports_0_requireMmuLockupCalc = 1'b0;
    end
  end

  assign when_MmuPlugin_l131 = ((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == 2'b11));
  assign when_MmuPlugin_l132 = (CsrPlugin_privilege == 2'b11);
  assign MmuPlugin_ports_0_cacheHitsCalc = {((MmuPlugin_ports_0_cache_3_valid && (MmuPlugin_ports_0_cache_3_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_3_superPage || (MmuPlugin_ports_0_cache_3_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]))),{((MmuPlugin_ports_0_cache_2_valid && (MmuPlugin_ports_0_cache_2_virtualAddress_1 == _zz_MmuPlugin_ports_0_cacheHitsCalc)) && (MmuPlugin_ports_0_cache_2_superPage || (MmuPlugin_ports_0_cache_2_virtualAddress_0 == _zz_MmuPlugin_ports_0_cacheHitsCalc_1))),{((MmuPlugin_ports_0_cache_1_valid && _zz_MmuPlugin_ports_0_cacheHitsCalc_2) && (MmuPlugin_ports_0_cache_1_superPage || _zz_MmuPlugin_ports_0_cacheHitsCalc_3)),((MmuPlugin_ports_0_cache_0_valid && _zz_MmuPlugin_ports_0_cacheHitsCalc_4) && (MmuPlugin_ports_0_cache_0_superPage || _zz_MmuPlugin_ports_0_cacheHitsCalc_5))}}};
  assign when_MmuPlugin_l124 = (! IBusCachedPlugin_mmuBus_cmd_1_isStuck);
  assign when_MmuPlugin_l124_1 = (! IBusCachedPlugin_mmuBus_cmd_1_isStuck);
  assign MmuPlugin_ports_0_cacheHit = (|MmuPlugin_ports_0_cacheHits);
  assign _zz_MmuPlugin_ports_0_cacheLine_valid = MmuPlugin_ports_0_cacheHits[3];
  assign _zz_MmuPlugin_ports_0_cacheLine_valid_1 = (MmuPlugin_ports_0_cacheHits[1] || _zz_MmuPlugin_ports_0_cacheLine_valid);
  assign _zz_MmuPlugin_ports_0_cacheLine_valid_2 = (MmuPlugin_ports_0_cacheHits[2] || _zz_MmuPlugin_ports_0_cacheLine_valid);
  assign _zz_MmuPlugin_ports_0_cacheLine_valid_3 = {_zz_MmuPlugin_ports_0_cacheLine_valid_2,_zz_MmuPlugin_ports_0_cacheLine_valid_1};
  assign MmuPlugin_ports_0_cacheLine_valid = _zz_MmuPlugin_ports_0_cacheLine_valid_4;
  assign MmuPlugin_ports_0_cacheLine_exception = _zz_MmuPlugin_ports_0_cacheLine_exception;
  assign MmuPlugin_ports_0_cacheLine_superPage = _zz_MmuPlugin_ports_0_cacheLine_superPage;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_0 = _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_1 = _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_0 = _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_1 = _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1;
  assign MmuPlugin_ports_0_cacheLine_allowRead = _zz_MmuPlugin_ports_0_cacheLine_allowRead;
  assign MmuPlugin_ports_0_cacheLine_allowWrite = _zz_MmuPlugin_ports_0_cacheLine_allowWrite;
  assign MmuPlugin_ports_0_cacheLine_allowExecute = _zz_MmuPlugin_ports_0_cacheLine_allowExecute;
  assign MmuPlugin_ports_0_cacheLine_allowUser = _zz_MmuPlugin_ports_0_cacheLine_allowUser;
  always @(*) begin
    MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b0;
    if(when_MmuPlugin_l279) begin
      if(when_MmuPlugin_l281) begin
        MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_0_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_0_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_0_entryToReplace_value == 2'b11);
  assign MmuPlugin_ports_0_entryToReplace_willOverflow = (MmuPlugin_ports_0_entryToReplace_willOverflowIfInc && MmuPlugin_ports_0_entryToReplace_willIncrement);
  always @(*) begin
    MmuPlugin_ports_0_entryToReplace_valueNext = (MmuPlugin_ports_0_entryToReplace_value + _zz_MmuPlugin_ports_0_entryToReplace_valueNext);
    if(MmuPlugin_ports_0_entryToReplace_willClear) begin
      MmuPlugin_ports_0_entryToReplace_valueNext = 2'b00;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockup) begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_0_cacheLine_physicalAddress_1,(MmuPlugin_ports_0_cacheLine_superPage ? IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_0_cacheLine_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
    end else begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_1_virtualAddress;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockup) begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_0_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_0_cacheLine_allowExecute));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockup) begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_0_cacheLine_allowWrite;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockup) begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_0_cacheLine_allowExecute;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockup) begin
      IBusCachedPlugin_mmuBus_rsp_exception = (((! MmuPlugin_ports_0_dirty) && MmuPlugin_ports_0_cacheHit) && ((MmuPlugin_ports_0_cacheLine_exception || ((MmuPlugin_ports_0_cacheLine_allowUser && (CsrPlugin_privilege == 2'b01)) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_0_cacheLine_allowUser) && (CsrPlugin_privilege == 2'b00))));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockup) begin
      IBusCachedPlugin_mmuBus_rsp_refilling = (MmuPlugin_ports_0_dirty || (! MmuPlugin_ports_0_cacheHit));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockup) begin
      IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b1;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
    end
  end

  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = IBusCachedPlugin_mmuBus_rsp_physicalAddress[31];
  assign IBusCachedPlugin_mmuBus_rsp_bypassTranslation = (! MmuPlugin_ports_0_requireMmuLockup);
  assign IBusCachedPlugin_mmuBus_rsp_ways_0_sel = MmuPlugin_ports_0_cacheHits[0];
  assign IBusCachedPlugin_mmuBus_rsp_ways_0_physical = {{MmuPlugin_ports_0_cache_0_physicalAddress_1,(MmuPlugin_ports_0_cache_0_superPage ? IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_0_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_1_sel = MmuPlugin_ports_0_cacheHits[1];
  assign IBusCachedPlugin_mmuBus_rsp_ways_1_physical = {{MmuPlugin_ports_0_cache_1_physicalAddress_1,(MmuPlugin_ports_0_cache_1_superPage ? IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_1_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_2_sel = MmuPlugin_ports_0_cacheHits[2];
  assign IBusCachedPlugin_mmuBus_rsp_ways_2_physical = {{MmuPlugin_ports_0_cache_2_physicalAddress_1,(MmuPlugin_ports_0_cache_2_superPage ? IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_2_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_3_sel = MmuPlugin_ports_0_cacheHits[3];
  assign IBusCachedPlugin_mmuBus_rsp_ways_3_physical = {{MmuPlugin_ports_0_cache_3_physicalAddress_1,(MmuPlugin_ports_0_cache_3_superPage ? IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_3_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
  assign when_MmuPlugin_l117_1 = (! DBusCachedPlugin_mmuBus_cmd_1_isStuck);
  always @(*) begin
    MmuPlugin_ports_1_requireMmuLockupCalc = ((1'b1 && (! DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation)) && MmuPlugin_satp_mode);
    if(when_MmuPlugin_l131_1) begin
      MmuPlugin_ports_1_requireMmuLockupCalc = 1'b0;
    end
    if(when_MmuPlugin_l132_1) begin
      if(when_MmuPlugin_l134) begin
        MmuPlugin_ports_1_requireMmuLockupCalc = 1'b0;
      end
    end
  end

  assign when_MmuPlugin_l131_1 = ((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == 2'b11));
  assign when_MmuPlugin_l132_1 = (CsrPlugin_privilege == 2'b11);
  assign when_MmuPlugin_l134 = ((! MmuPlugin_status_mprv) || (CsrPlugin_mstatus_MPP == 2'b11));
  assign MmuPlugin_ports_1_cacheHitsCalc = {((MmuPlugin_ports_1_cache_3_valid && (MmuPlugin_ports_1_cache_3_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_3_superPage || (MmuPlugin_ports_1_cache_3_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]))),{((MmuPlugin_ports_1_cache_2_valid && (MmuPlugin_ports_1_cache_2_virtualAddress_1 == _zz_MmuPlugin_ports_1_cacheHitsCalc)) && (MmuPlugin_ports_1_cache_2_superPage || (MmuPlugin_ports_1_cache_2_virtualAddress_0 == _zz_MmuPlugin_ports_1_cacheHitsCalc_1))),{((MmuPlugin_ports_1_cache_1_valid && _zz_MmuPlugin_ports_1_cacheHitsCalc_2) && (MmuPlugin_ports_1_cache_1_superPage || _zz_MmuPlugin_ports_1_cacheHitsCalc_3)),((MmuPlugin_ports_1_cache_0_valid && _zz_MmuPlugin_ports_1_cacheHitsCalc_4) && (MmuPlugin_ports_1_cache_0_superPage || _zz_MmuPlugin_ports_1_cacheHitsCalc_5))}}};
  assign when_MmuPlugin_l124_2 = (! DBusCachedPlugin_mmuBus_cmd_1_isStuck);
  assign when_MmuPlugin_l124_3 = (! DBusCachedPlugin_mmuBus_cmd_1_isStuck);
  assign MmuPlugin_ports_1_cacheHit = (|MmuPlugin_ports_1_cacheHits);
  assign _zz_MmuPlugin_ports_1_cacheLine_valid = MmuPlugin_ports_1_cacheHits[3];
  assign _zz_MmuPlugin_ports_1_cacheLine_valid_1 = (MmuPlugin_ports_1_cacheHits[1] || _zz_MmuPlugin_ports_1_cacheLine_valid);
  assign _zz_MmuPlugin_ports_1_cacheLine_valid_2 = (MmuPlugin_ports_1_cacheHits[2] || _zz_MmuPlugin_ports_1_cacheLine_valid);
  assign _zz_MmuPlugin_ports_1_cacheLine_valid_3 = {_zz_MmuPlugin_ports_1_cacheLine_valid_2,_zz_MmuPlugin_ports_1_cacheLine_valid_1};
  assign MmuPlugin_ports_1_cacheLine_valid = _zz_MmuPlugin_ports_1_cacheLine_valid_4;
  assign MmuPlugin_ports_1_cacheLine_exception = _zz_MmuPlugin_ports_1_cacheLine_exception;
  assign MmuPlugin_ports_1_cacheLine_superPage = _zz_MmuPlugin_ports_1_cacheLine_superPage;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_0 = _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_1 = _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_0 = _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_1 = _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1;
  assign MmuPlugin_ports_1_cacheLine_allowRead = _zz_MmuPlugin_ports_1_cacheLine_allowRead;
  assign MmuPlugin_ports_1_cacheLine_allowWrite = _zz_MmuPlugin_ports_1_cacheLine_allowWrite;
  assign MmuPlugin_ports_1_cacheLine_allowExecute = _zz_MmuPlugin_ports_1_cacheLine_allowExecute;
  assign MmuPlugin_ports_1_cacheLine_allowUser = _zz_MmuPlugin_ports_1_cacheLine_allowUser;
  always @(*) begin
    MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b0;
    if(when_MmuPlugin_l279) begin
      if(when_MmuPlugin_l281_1) begin
        MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_1_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_1_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_1_entryToReplace_value == 2'b11);
  assign MmuPlugin_ports_1_entryToReplace_willOverflow = (MmuPlugin_ports_1_entryToReplace_willOverflowIfInc && MmuPlugin_ports_1_entryToReplace_willIncrement);
  always @(*) begin
    MmuPlugin_ports_1_entryToReplace_valueNext = (MmuPlugin_ports_1_entryToReplace_value + _zz_MmuPlugin_ports_1_entryToReplace_valueNext);
    if(MmuPlugin_ports_1_entryToReplace_willClear) begin
      MmuPlugin_ports_1_entryToReplace_valueNext = 2'b00;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockup) begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_1_cacheLine_physicalAddress_1,(MmuPlugin_ports_1_cacheLine_superPage ? DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_1_cacheLine_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
    end else begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_1_virtualAddress;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockup) begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_1_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_1_cacheLine_allowExecute));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockup) begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_1_cacheLine_allowWrite;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockup) begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_1_cacheLine_allowExecute;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockup) begin
      DBusCachedPlugin_mmuBus_rsp_exception = (((! MmuPlugin_ports_1_dirty) && MmuPlugin_ports_1_cacheHit) && ((MmuPlugin_ports_1_cacheLine_exception || ((MmuPlugin_ports_1_cacheLine_allowUser && (CsrPlugin_privilege == 2'b01)) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_1_cacheLine_allowUser) && (CsrPlugin_privilege == 2'b00))));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockup) begin
      DBusCachedPlugin_mmuBus_rsp_refilling = (MmuPlugin_ports_1_dirty || (! MmuPlugin_ports_1_cacheHit));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockup) begin
      DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b1;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
    end
  end

  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = DBusCachedPlugin_mmuBus_rsp_physicalAddress[31];
  assign DBusCachedPlugin_mmuBus_rsp_bypassTranslation = (! MmuPlugin_ports_1_requireMmuLockup);
  assign DBusCachedPlugin_mmuBus_rsp_ways_0_sel = MmuPlugin_ports_1_cacheHits[0];
  assign DBusCachedPlugin_mmuBus_rsp_ways_0_physical = {{MmuPlugin_ports_1_cache_0_physicalAddress_1,(MmuPlugin_ports_1_cache_0_superPage ? DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_0_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_1_sel = MmuPlugin_ports_1_cacheHits[1];
  assign DBusCachedPlugin_mmuBus_rsp_ways_1_physical = {{MmuPlugin_ports_1_cache_1_physicalAddress_1,(MmuPlugin_ports_1_cache_1_superPage ? DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_1_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_2_sel = MmuPlugin_ports_1_cacheHits[2];
  assign DBusCachedPlugin_mmuBus_rsp_ways_2_physical = {{MmuPlugin_ports_1_cache_2_physicalAddress_1,(MmuPlugin_ports_1_cache_2_superPage ? DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_2_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_3_sel = MmuPlugin_ports_1_cacheHits[3];
  assign DBusCachedPlugin_mmuBus_rsp_ways_3_physical = {{MmuPlugin_ports_1_cache_3_physicalAddress_1,(MmuPlugin_ports_1_cache_3_superPage ? DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_3_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_1_virtualAddress[11 : 0]};
  assign MmuPlugin_shared_dBusRsp_pte_V = MmuPlugin_shared_dBusRspStaged_payload_data[0];
  assign MmuPlugin_shared_dBusRsp_pte_R = MmuPlugin_shared_dBusRspStaged_payload_data[1];
  assign MmuPlugin_shared_dBusRsp_pte_W = MmuPlugin_shared_dBusRspStaged_payload_data[2];
  assign MmuPlugin_shared_dBusRsp_pte_X = MmuPlugin_shared_dBusRspStaged_payload_data[3];
  assign MmuPlugin_shared_dBusRsp_pte_U = MmuPlugin_shared_dBusRspStaged_payload_data[4];
  assign MmuPlugin_shared_dBusRsp_pte_G = MmuPlugin_shared_dBusRspStaged_payload_data[5];
  assign MmuPlugin_shared_dBusRsp_pte_A = MmuPlugin_shared_dBusRspStaged_payload_data[6];
  assign MmuPlugin_shared_dBusRsp_pte_D = MmuPlugin_shared_dBusRspStaged_payload_data[7];
  assign MmuPlugin_shared_dBusRsp_pte_RSW = MmuPlugin_shared_dBusRspStaged_payload_data[9 : 8];
  assign MmuPlugin_shared_dBusRsp_pte_PPN0 = MmuPlugin_shared_dBusRspStaged_payload_data[19 : 10];
  assign MmuPlugin_shared_dBusRsp_pte_PPN1 = MmuPlugin_shared_dBusRspStaged_payload_data[31 : 20];
  assign MmuPlugin_shared_dBusRsp_exception = (((! MmuPlugin_shared_dBusRsp_pte_V) || ((! MmuPlugin_shared_dBusRsp_pte_R) && MmuPlugin_shared_dBusRsp_pte_W)) || MmuPlugin_shared_dBusRspStaged_payload_error);
  assign MmuPlugin_shared_dBusRsp_leaf = (MmuPlugin_shared_dBusRsp_pte_R || MmuPlugin_shared_dBusRsp_pte_X);
  assign when_MmuPlugin_l211 = (MmuPlugin_shared_dBusRspStaged_valid && (! MmuPlugin_shared_dBusRspStaged_payload_redo));
  always @(*) begin
    MmuPlugin_dBusAccess_cmd_valid = 1'b0;
    case(MmuPlugin_shared_state_1)
      MmuPlugin_shared_State_IDLE : begin
      end
      MmuPlugin_shared_State_L1_CMD : begin
        MmuPlugin_dBusAccess_cmd_valid = 1'b1;
      end
      MmuPlugin_shared_State_L1_RSP : begin
      end
      MmuPlugin_shared_State_L0_CMD : begin
        MmuPlugin_dBusAccess_cmd_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign MmuPlugin_dBusAccess_cmd_payload_write = 1'b0;
  assign MmuPlugin_dBusAccess_cmd_payload_size = 2'b10;
  always @(*) begin
    MmuPlugin_dBusAccess_cmd_payload_address = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(MmuPlugin_shared_state_1)
      MmuPlugin_shared_State_IDLE : begin
      end
      MmuPlugin_shared_State_L1_CMD : begin
        MmuPlugin_dBusAccess_cmd_payload_address = {{MmuPlugin_satp_ppn[19 : 0],MmuPlugin_shared_vpn_1},2'b00};
      end
      MmuPlugin_shared_State_L1_RSP : begin
      end
      MmuPlugin_shared_State_L0_CMD : begin
        MmuPlugin_dBusAccess_cmd_payload_address = {{{MmuPlugin_shared_pteBuffer_PPN1[9 : 0],MmuPlugin_shared_pteBuffer_PPN0},MmuPlugin_shared_vpn_0},2'b00};
      end
      default : begin
      end
    endcase
  end

  assign MmuPlugin_dBusAccess_cmd_payload_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign MmuPlugin_dBusAccess_cmd_payload_writeMask = 4'bxxxx;
  assign _zz_MmuPlugin_shared_refills = {(((DBusCachedPlugin_mmuBus_cmd_1_isValid && MmuPlugin_ports_1_requireMmuLockup) && (! MmuPlugin_ports_1_dirty)) && (! MmuPlugin_ports_1_cacheHit)),(((IBusCachedPlugin_mmuBus_cmd_1_isValid && MmuPlugin_ports_0_requireMmuLockup) && (! MmuPlugin_ports_0_dirty)) && (! MmuPlugin_ports_0_cacheHit))};
  always @(*) begin
    _zz_MmuPlugin_shared_refills_1[0] = _zz_MmuPlugin_shared_refills[1];
    _zz_MmuPlugin_shared_refills_1[1] = _zz_MmuPlugin_shared_refills[0];
  end

  assign _zz_MmuPlugin_shared_refills_2 = (_zz_MmuPlugin_shared_refills_1 & (~ _zz__zz_MmuPlugin_shared_refills_2));
  always @(*) begin
    _zz_MmuPlugin_shared_refills_3[0] = _zz_MmuPlugin_shared_refills_2[1];
    _zz_MmuPlugin_shared_refills_3[1] = _zz_MmuPlugin_shared_refills_2[0];
  end

  assign MmuPlugin_shared_refills = _zz_MmuPlugin_shared_refills_3;
  assign when_MmuPlugin_l223 = (|MmuPlugin_shared_refills);
  assign _zz_MmuPlugin_shared_vpn_0 = (MmuPlugin_shared_refills[0] ? IBusCachedPlugin_mmuBus_cmd_1_virtualAddress : DBusCachedPlugin_mmuBus_cmd_1_virtualAddress);
  assign when_MmuPlugin_l250 = (MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception);
  assign IBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1 != MmuPlugin_shared_State_IDLE) && MmuPlugin_shared_portSortedOh[0]);
  assign DBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1 != MmuPlugin_shared_State_IDLE) && MmuPlugin_shared_portSortedOh[1]);
  assign when_MmuPlugin_l279 = ((MmuPlugin_shared_dBusRspStaged_valid && (! MmuPlugin_shared_dBusRspStaged_payload_redo)) && (MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception));
  assign when_MmuPlugin_l281 = MmuPlugin_shared_portSortedOh[0];
  assign when_MmuPlugin_l287 = (MmuPlugin_ports_0_entryToReplace_value == 2'b00);
  assign when_MmuPlugin_l287_1 = (MmuPlugin_ports_0_entryToReplace_value == 2'b01);
  assign when_MmuPlugin_l287_2 = (MmuPlugin_ports_0_entryToReplace_value == 2'b10);
  assign when_MmuPlugin_l287_3 = (MmuPlugin_ports_0_entryToReplace_value == 2'b11);
  assign when_MmuPlugin_l281_1 = MmuPlugin_shared_portSortedOh[1];
  assign when_MmuPlugin_l287_4 = (MmuPlugin_ports_1_entryToReplace_value == 2'b00);
  assign when_MmuPlugin_l287_5 = (MmuPlugin_ports_1_entryToReplace_value == 2'b01);
  assign when_MmuPlugin_l287_6 = (MmuPlugin_ports_1_entryToReplace_value == 2'b10);
  assign when_MmuPlugin_l287_7 = (MmuPlugin_ports_1_entryToReplace_value == 2'b11);
  assign when_MmuPlugin_l311 = ((execute_arbitration_isValid && execute_arbitration_isFiring) && execute_IS_SFENCE_VMA2);
  assign IBusCachedPlugin_externalFlush = (|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}});
  assign IBusCachedPlugin_jump_pcLoad_valid = (|{BranchPlugin_jumpInterface_valid,{CsrPlugin_redoInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}});
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload = {CsrPlugin_redoInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload & (~ _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1));
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_2 = _zz_IBusCachedPlugin_jump_pcLoad_payload_1[3];
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_3 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[1] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_4 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[2] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  always @(*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_fire = (IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready);
  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l133 = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate);
  assign when_Fetcher_l133_1 = ((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_IBusCachedPlugin_fetchPc_pc);
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  always @(*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l160 = (IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate));
  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch) begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt) begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
    if(IBusCachedPlugin_mmuBus_busy) begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
  assign _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_3_halt = 1'b0;
    if(when_IBusCachedPlugin_l273) begin
      IBusCachedPlugin_iBusRsp_stages_3_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_3_input_ready = (! IBusCachedPlugin_iBusRsp_stages_3_halt);
  assign IBusCachedPlugin_iBusRsp_stages_3_input_ready = (IBusCachedPlugin_iBusRsp_stages_3_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_3_output_valid = (IBusCachedPlugin_iBusRsp_stages_3_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_3_output_payload = IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid_1;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_payload = _zz_IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_payload;
  assign IBusCachedPlugin_iBusRsp_stages_3_input_valid = IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_3_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_3_input_payload = IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if(when_Fetcher_l322) begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l242 = ((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid) || IBusCachedPlugin_iBusRsp_stages_3_input_valid);
  assign when_Fetcher_l322 = (! IBusCachedPlugin_pcValids_0);
  assign when_Fetcher_l331 = (! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready));
  assign when_Fetcher_l331_1 = (! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready));
  assign when_Fetcher_l331_2 = (! (! IBusCachedPlugin_iBusRsp_stages_3_input_ready));
  assign when_Fetcher_l331_3 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l331_4 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l331_5 = (! writeBack_arbitration_isStuck);
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_5;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
    case(IBusCachedPlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
    if(IBusCachedPlugin_forceNoDecodeCond) begin
      decode_arbitration_isValid = 1'b0;
    end
  end

  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @(*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign IBusCachedPlugin_cache_io_cpu_prefetch_isValid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = IBusCachedPlugin_cache_io_cpu_prefetch_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_cache_io_cpu_fetch_isValid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_1_isValid = IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_1_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_1_virtualAddress = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_1_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_2_input_ready || IBusCachedPlugin_externalFlush);
  assign IBusCachedPlugin_cache_io_cpu_decode_isValid = (IBusCachedPlugin_iBusRsp_stages_3_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_decode_isStuck = (! IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign IBusCachedPlugin_cache_io_cpu_decode_isUser = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @(*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(when_IBusCachedPlugin_l245) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_cache_io_cpu_fill_valid = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_cache_io_cpu_fill_valid = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_3_input_payload[31 : 2],2'b00};
  assign when_IBusCachedPlugin_l245 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign when_IBusCachedPlugin_l250 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign when_IBusCachedPlugin_l256 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign when_IBusCachedPlugin_l262 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign when_IBusCachedPlugin_l273 = (IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt);
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_3_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_3_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_3_output_payload;
  assign IBusCachedPlugin_cache_io_flush = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_valid = (dataCache_1_io_mem_cmd_valid || (! cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN));
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_wr = (cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN ? dataCache_1_io_mem_cmd_payload_wr : cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_wr);
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_uncached = (cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN ? dataCache_1_io_mem_cmd_payload_uncached : cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_uncached);
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_address = (cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN ? dataCache_1_io_mem_cmd_payload_address : cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_address);
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_data = (cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN ? dataCache_1_io_mem_cmd_payload_data : cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_data);
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_mask = (cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN ? dataCache_1_io_mem_cmd_payload_mask : cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_mask);
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_size = (cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN ? dataCache_1_io_mem_cmd_payload_size : cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_size);
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_last = (cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN ? dataCache_1_io_mem_cmd_payload_last : cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_last);
  always @(*) begin
    cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_ready = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready;
    if(when_Stream_l372) begin
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l372 = (! cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid);
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rValid;
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_wr;
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_uncached;
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_address;
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_data;
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_mask;
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_size = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_size;
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_last;
  assign dBus_cmd_valid = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid;
  assign cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready = dBus_cmd_ready;
  assign dBus_cmd_payload_wr = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  assign dBus_cmd_payload_uncached = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached;
  assign dBus_cmd_payload_address = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  assign dBus_cmd_payload_data = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  assign dBus_cmd_payload_mask = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  assign dBus_cmd_payload_size = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_size;
  assign dBus_cmd_payload_last = cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  assign when_DBusCachedPlugin_l356 = ((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE);
  always @(*) begin
    _zz_decode_MEMORY_FORCE_CONSTISTENCY = 1'b0;
    if(when_DBusCachedPlugin_l364) begin
      if(decode_MEMORY_LRSC) begin
        _zz_decode_MEMORY_FORCE_CONSTISTENCY = 1'b1;
      end
      if(decode_MEMORY_AMO) begin
        _zz_decode_MEMORY_FORCE_CONSTISTENCY = 1'b1;
      end
    end
  end

  assign when_DBusCachedPlugin_l364 = decode_INSTRUCTION[25];
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    dataCache_1_io_cpu_execute_isValid = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l623) begin
        if(when_DBusCachedPlugin_l624) begin
          dataCache_1_io_cpu_execute_isValid = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    dataCache_1_io_cpu_execute_address = execute_SRC_ADD;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l623) begin
        dataCache_1_io_cpu_execute_address = MmuPlugin_dBusAccess_cmd_payload_address;
      end
    end
  end

  always @(*) begin
    dataCache_1_io_cpu_execute_args_wr = execute_MEMORY_WR;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l623) begin
        dataCache_1_io_cpu_execute_args_wr = 1'b0;
      end
    end
  end

  always @(*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_execute_MEMORY_STORE_DATA_RF = execute_RS2[31 : 0];
      end
    endcase
  end

  always @(*) begin
    dataCache_1_io_cpu_execute_args_size = execute_DBusCachedPlugin_size;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l623) begin
        dataCache_1_io_cpu_execute_args_size = MmuPlugin_dBusAccess_cmd_payload_size;
      end
    end
  end

  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = dataCache_1_io_cpu_execute_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = execute_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = execute_SRC_ADD;
  always @(*) begin
    DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
    if(execute_IS_DBUS_SHARING) begin
      DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b1;
    end
  end

  assign dataCache_1_io_cpu_flush_valid = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign dataCache_1_io_cpu_flush_payload_singleLine = (execute_INSTRUCTION[19 : 15] != 5'h0);
  assign dataCache_1_io_cpu_flush_payload_lineId = _zz_io_cpu_flush_payload_lineId[5:0];
  assign cores_0_cpu_logic_cpu_dataCache_1_io_cpu_flush_isStall = (dataCache_1_io_cpu_flush_valid && (! dataCache_1_io_cpu_flush_ready));
  assign when_DBusCachedPlugin_l398 = (cores_0_cpu_logic_cpu_dataCache_1_io_cpu_flush_isStall || dataCache_1_io_cpu_execute_haltIt);
  always @(*) begin
    dataCache_1_io_cpu_execute_args_isLrsc = 1'b0;
    if(execute_MEMORY_LRSC) begin
      dataCache_1_io_cpu_execute_args_isLrsc = 1'b1;
    end
  end

  assign dataCache_1_io_cpu_execute_args_amoCtrl_alu = execute_INSTRUCTION[31 : 29];
  assign dataCache_1_io_cpu_execute_args_amoCtrl_swap = execute_INSTRUCTION[27];
  assign when_DBusCachedPlugin_l414 = (dataCache_1_io_cpu_execute_refilling && execute_arbitration_isValid);
  always @(*) begin
    dataCache_1_io_cpu_memory_isValid = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
    if(memory_IS_DBUS_SHARING) begin
      dataCache_1_io_cpu_memory_isValid = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_cmd_1_isValid = dataCache_1_io_cpu_memory_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_1_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_1_virtualAddress = memory_MEMORY_VIRTUAL_ADDRESS;
  always @(*) begin
    DBusCachedPlugin_mmuBus_cmd_1_bypassTranslation = 1'b0;
    if(memory_IS_DBUS_SHARING) begin
      DBusCachedPlugin_mmuBus_cmd_1_bypassTranslation = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @(*) begin
    dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if(when_DBusCachedPlugin_l476) begin
      dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = 1'b1;
    end
  end

  assign when_DBusCachedPlugin_l476 = (_zz_when_DBusCachedPlugin_l476 && (! dataCache_1_io_cpu_memory_isWrite));
  assign DBusCachedPlugin_trigger_valid = (((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_isFlushed)) && memory_MEMORY_ENABLE);
  assign DBusCachedPlugin_trigger_load = (! memory_MEMORY_WR);
  assign DBusCachedPlugin_trigger_store = memory_MEMORY_WR;
  assign DBusCachedPlugin_trigger_size = memory_INSTRUCTION[13 : 12];
  assign DBusCachedPlugin_trigger_virtual = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_trigger_writeData = memory_MEMORY_STORE_DATA_RF;
  assign DBusCachedPlugin_trigger_readData = 32'h0;
  assign DBusCachedPlugin_trigger_readDataValid = 1'b0;
  assign DBusCachedPlugin_trigger_dpc = memory_PC;
  always @(*) begin
    dataCache_1_io_cpu_writeBack_isValid = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_IS_DBUS_SHARING) begin
      dataCache_1_io_cpu_writeBack_isValid = 1'b1;
    end
    if(writeBack_arbitration_haltByOther) begin
      dataCache_1_io_cpu_writeBack_isValid = 1'b0;
    end
  end

  assign dataCache_1_io_cpu_writeBack_isUser = (CsrPlugin_privilege == 2'b00);
  assign dataCache_1_io_cpu_writeBack_address = writeBack_REGFILE_WRITE_DATA;
  assign dataCache_1_io_cpu_writeBack_storeData[31 : 0] = writeBack_MEMORY_STORE_DATA_RF;
  always @(*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(when_DBusCachedPlugin_l552) begin
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(when_DBusCachedPlugin_l552) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_payload_code = 4'bxxxx;
    if(when_DBusCachedPlugin_l552) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code_1};
      end
    end
  end

  assign when_DBusCachedPlugin_l552 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign when_DBusCachedPlugin_l572 = (dataCache_1_io_cpu_writeBack_isValid && dataCache_1_io_cpu_writeBack_haltIt);
  assign writeBack_DBusCachedPlugin_rspData = dataCache_1_io_cpu_writeBack_data;
  assign writeBack_DBusCachedPlugin_rspSplits_0 = writeBack_DBusCachedPlugin_rspData[7 : 0];
  assign writeBack_DBusCachedPlugin_rspSplits_1 = writeBack_DBusCachedPlugin_rspData[15 : 8];
  assign writeBack_DBusCachedPlugin_rspSplits_2 = writeBack_DBusCachedPlugin_rspData[23 : 16];
  assign writeBack_DBusCachedPlugin_rspSplits_3 = writeBack_DBusCachedPlugin_rspData[31 : 24];
  always @(*) begin
    writeBack_DBusCachedPlugin_rspShifted[7 : 0] = _zz_writeBack_DBusCachedPlugin_rspShifted;
    writeBack_DBusCachedPlugin_rspShifted[15 : 8] = _zz_writeBack_DBusCachedPlugin_rspShifted_2;
    writeBack_DBusCachedPlugin_rspShifted[23 : 16] = writeBack_DBusCachedPlugin_rspSplits_2;
    writeBack_DBusCachedPlugin_rspShifted[31 : 24] = writeBack_DBusCachedPlugin_rspSplits_3;
  end

  always @(*) begin
    writeBack_DBusCachedPlugin_rspRf = writeBack_DBusCachedPlugin_rspShifted[31 : 0];
    if(when_DBusCachedPlugin_l589) begin
      writeBack_DBusCachedPlugin_rspRf = {31'd0, _zz_writeBack_DBusCachedPlugin_rspRf};
    end
  end

  assign when_DBusCachedPlugin_l589 = (writeBack_MEMORY_LRSC && writeBack_MEMORY_WR);
  assign switch_Misc_l241 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusCachedPlugin_rspFormated = (writeBack_DBusCachedPlugin_rspRf[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[31] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[30] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[29] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[28] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[27] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[26] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[25] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[24] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[23] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[22] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[21] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[20] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[19] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[18] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[17] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[16] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[15] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[14] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[13] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[12] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[11] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[10] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[9] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[8] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[7 : 0] = writeBack_DBusCachedPlugin_rspRf[7 : 0];
  end

  assign _zz_writeBack_DBusCachedPlugin_rspFormated_2 = (writeBack_DBusCachedPlugin_rspRf[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[31] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[30] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[29] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[28] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[27] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[26] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[25] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[24] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[23] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[22] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[21] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[20] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[19] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[18] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[17] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[16] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[15 : 0] = writeBack_DBusCachedPlugin_rspRf[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l241)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspRf;
      end
    endcase
  end

  assign when_DBusCachedPlugin_l599 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  always @(*) begin
    MmuPlugin_dBusAccess_cmd_ready = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l623) begin
        if(when_DBusCachedPlugin_l624) begin
          MmuPlugin_dBusAccess_cmd_ready = (! execute_arbitration_isStuck);
        end
      end
    end
  end

  always @(*) begin
    DBusCachedPlugin_forceDatapath = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l623) begin
        DBusCachedPlugin_forceDatapath = 1'b1;
      end
    end
  end

  assign when_DBusCachedPlugin_l623 = (! (|{(writeBack_arbitration_isValid || CsrPlugin_exceptionPendings_3),{(memory_arbitration_isValid || CsrPlugin_exceptionPendings_2),(execute_arbitration_isValid || CsrPlugin_exceptionPendings_1)}}));
  assign when_DBusCachedPlugin_l624 = (! dataCache_1_io_cpu_execute_refilling);
  assign MmuPlugin_dBusAccess_cmd_fire = (MmuPlugin_dBusAccess_cmd_valid && MmuPlugin_dBusAccess_cmd_ready);
  assign MmuPlugin_dBusAccess_rsp_valid = ((writeBack_IS_DBUS_SHARING && (! dataCache_1_io_cpu_writeBack_isWrite)) && (dataCache_1_io_cpu_redo || (! dataCache_1_io_cpu_writeBack_haltIt)));
  assign MmuPlugin_dBusAccess_rsp_payload_data = writeBack_DBusCachedPlugin_rspRf;
  assign MmuPlugin_dBusAccess_rsp_payload_error = (dataCache_1_io_cpu_writeBack_unalignedAccess || dataCache_1_io_cpu_writeBack_accessError);
  assign MmuPlugin_dBusAccess_rsp_payload_redo = dataCache_1_io_cpu_redo;
  assign _zz_decode_IS_CSR_1 = ((decode_INSTRUCTION & 32'h02003050) == 32'h02000050);
  assign _zz_decode_IS_CSR_2 = ((decode_INSTRUCTION & 32'h00005048) == 32'h00001008);
  assign _zz_decode_IS_CSR_3 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_CSR_4 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_CSR_5 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002000);
  assign _zz_decode_IS_CSR_6 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_decode_IS_CSR_7 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_CSR_8 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_decode_IS_CSR_9 = ((decode_INSTRUCTION & 32'h00000030) == 32'h00000010);
  assign _zz_decode_IS_CSR_10 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz_decode_IS_CSR_11 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_decode_IS_CSR_12 = ((decode_INSTRUCTION & 32'h10103050) == 32'h00100050);
  assign _zz_decode_IS_CSR = {(|{_zz_decode_IS_CSR_4,(_zz__zz_decode_IS_CSR == _zz__zz_decode_IS_CSR_1)}),{(|(_zz__zz_decode_IS_CSR_2 == _zz__zz_decode_IS_CSR_3)),{(|_zz_decode_IS_CSR_12),{(|_zz__zz_decode_IS_CSR_4),{_zz__zz_decode_IS_CSR_5,{_zz__zz_decode_IS_CSR_8,_zz__zz_decode_IS_CSR_10}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_CSR[4 : 3];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_CSR[9 : 8];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_CSR[11 : 10];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_CSR[24 : 23];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_CSR[26 : 25];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_CSR[34 : 32];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_CSR[37 : 36];
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign decode_RegFilePlugin_rs1Data = RegFilePlugin_regFile_spinal_port0;
  assign decode_RegFilePlugin_rs2Data = RegFilePlugin_regFile_spinal_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_5) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_5) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_5) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      AluBitwiseCtrlEnum_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      AluCtrlEnum_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_decode_SRC1 = _zz_decode_to_execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_decode_SRC1 = {29'd0, _zz__zz_decode_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_decode_SRC1 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_decode_SRC1 = {27'd0, _zz__zz_decode_SRC1_1};
      end
    endcase
  end

  assign _zz_decode_SRC2 = decode_INSTRUCTION[31];
  always @(*) begin
    _zz_decode_SRC2_1[19] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[18] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[17] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[16] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[15] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[14] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[13] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[12] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[11] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[10] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[9] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[8] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[7] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[6] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[5] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[4] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[3] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[2] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[1] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[0] = _zz_decode_SRC2;
  end

  assign _zz_decode_SRC2_2 = _zz__zz_decode_SRC2_2[11];
  always @(*) begin
    _zz_decode_SRC2_3[19] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[18] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[17] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[16] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[15] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[14] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[13] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[12] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[11] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[10] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[9] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[8] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[7] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[6] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[5] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[4] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[3] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[2] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[1] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[0] = _zz_decode_SRC2_2;
  end

  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_decode_SRC2_4 = _zz_decode_to_execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_decode_SRC2_4 = {_zz_decode_SRC2_1,decode_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_decode_SRC2_4 = {_zz_decode_SRC2_3,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_decode_SRC2_4 = _zz_decode_to_execute_PC;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == ShiftCtrlEnum_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = execute_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = execute_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = execute_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = execute_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = execute_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = execute_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = execute_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = execute_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = execute_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = execute_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = execute_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = execute_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = execute_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = execute_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = execute_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = execute_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = execute_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = execute_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = execute_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = execute_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = execute_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = execute_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = execute_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = execute_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = execute_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = execute_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = execute_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = execute_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = execute_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = execute_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = execute_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = execute_SHIFT_RIGHT[0];
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  assign switch_MulPlugin_l87 = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_writeBack_MulPlugin_result) + $signed(_zz_writeBack_MulPlugin_result_1));
  assign when_MulPlugin_l147 = (writeBack_arbitration_isValid && writeBack_IS_MUL);
  assign switch_MulPlugin_l148 = writeBack_INSTRUCTION[13 : 12];
  assign memory_MulDivIterativePlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow) begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_memory_MulDivIterativePlugin_div_counter_valueNext);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear) begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_MulDivIterativePlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder : _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_MulDivIterativePlugin_div_counter_value == 6'h20);
  assign _zz_memory_MulDivIterativePlugin_div_result = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_MulDivIterativePlugin_rs2 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_MulDivIterativePlugin_rs1 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_MulDivIterativePlugin_rs1_1[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_MulDivIterativePlugin_rs1_1[31 : 0] = execute_RS1;
  end

  always @(*) begin
    CsrPlugin_privilege = _zz_CsrPlugin_privilege;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0141101;
  assign CsrPlugin_sip_SEIP_OR = (CsrPlugin_sip_SEIP_SOFT || CsrPlugin_sip_SEIP_INPUT);
  always @(*) begin
    CsrPlugin_redoInterface_valid = 1'b0;
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      CsrPlugin_redoInterface_valid = 1'b1;
    end
  end

  assign CsrPlugin_redoInterface_payload = decode_PC;
  always @(*) begin
    CsrPlugin_rescheduleLogic_rescheduleNext = 1'b0;
    if(when_CsrPlugin_l1304) begin
      CsrPlugin_rescheduleLogic_rescheduleNext = 1'b1;
    end
    if(execute_CsrPlugin_csr_384) begin
      if(execute_CsrPlugin_writeInstruction) begin
        CsrPlugin_rescheduleLogic_rescheduleNext = 1'b1;
      end
    end
  end

  assign when_CsrPlugin_l1304 = (execute_arbitration_isValid && execute_RESCHEDULE_NEXT);
  assign _zz_when_CsrPlugin_l1446 = (CsrPlugin_sip_STIP && CsrPlugin_sie_STIE);
  assign _zz_when_CsrPlugin_l1446_1 = (CsrPlugin_sip_SSIP && CsrPlugin_sie_SSIE);
  assign _zz_when_CsrPlugin_l1446_2 = (CsrPlugin_sip_SEIP_OR && CsrPlugin_sie_SEIE);
  assign _zz_when_CsrPlugin_l1446_3 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l1446_4 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l1446_5 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
    case(CsrPlugin_exceptionPortCtrl_exceptionContext_code)
      4'b0000 : begin
        if(when_CsrPlugin_l1360) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0001 : begin
        if(when_CsrPlugin_l1360_1) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0010 : begin
        if(when_CsrPlugin_l1360_2) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0011 : begin
        if(when_CsrPlugin_l1360_3) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0100 : begin
        if(when_CsrPlugin_l1360_4) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0101 : begin
        if(when_CsrPlugin_l1360_5) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0110 : begin
        if(when_CsrPlugin_l1360_6) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0111 : begin
        if(when_CsrPlugin_l1360_7) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1000 : begin
        if(when_CsrPlugin_l1360_8) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1001 : begin
        if(when_CsrPlugin_l1360_9) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1100 : begin
        if(when_CsrPlugin_l1360_10) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1101 : begin
        if(when_CsrPlugin_l1360_11) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1111 : begin
        if(when_CsrPlugin_l1360_12) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_CsrPlugin_l1360 = ((1'b1 && CsrPlugin_medeleg_IAM) && (! 1'b0));
  assign when_CsrPlugin_l1360_1 = ((1'b1 && CsrPlugin_medeleg_IAF) && (! 1'b0));
  assign when_CsrPlugin_l1360_2 = ((1'b1 && CsrPlugin_medeleg_II) && (! 1'b0));
  assign when_CsrPlugin_l1360_3 = ((1'b1 && CsrPlugin_medeleg_BP) && (! 1'b0));
  assign when_CsrPlugin_l1360_4 = ((1'b1 && CsrPlugin_medeleg_LAM) && (! 1'b0));
  assign when_CsrPlugin_l1360_5 = ((1'b1 && CsrPlugin_medeleg_LAF) && (! 1'b0));
  assign when_CsrPlugin_l1360_6 = ((1'b1 && CsrPlugin_medeleg_SAM) && (! 1'b0));
  assign when_CsrPlugin_l1360_7 = ((1'b1 && CsrPlugin_medeleg_SAF) && (! 1'b0));
  assign when_CsrPlugin_l1360_8 = ((1'b1 && CsrPlugin_medeleg_EU) && (! 1'b0));
  assign when_CsrPlugin_l1360_9 = ((1'b1 && CsrPlugin_medeleg_ES) && (! 1'b0));
  assign when_CsrPlugin_l1360_10 = ((1'b1 && CsrPlugin_medeleg_IPF) && (! 1'b0));
  assign when_CsrPlugin_l1360_11 = ((1'b1 && CsrPlugin_medeleg_LPF) && (! 1'b0));
  assign when_CsrPlugin_l1360_12 = ((1'b1 && CsrPlugin_medeleg_SPF) && (! 1'b0));
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1[0];
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_2 = {BranchPlugin_branchExceptionPort_valid,CsrPlugin_selfException_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3[0];
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(_zz_when_1) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l1403 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1403_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1403_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1403_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1416 = (|{CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}});
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l1440 = ((CsrPlugin_sstatus_SIE && (CsrPlugin_privilege == 2'b01)) || (CsrPlugin_privilege < 2'b01));
  assign when_CsrPlugin_l1440_1 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l1446 = ((_zz_when_CsrPlugin_l1446 && (1'b1 && CsrPlugin_mideleg_ST)) && (! 1'b0));
  assign when_CsrPlugin_l1446_1 = ((_zz_when_CsrPlugin_l1446_1 && (1'b1 && CsrPlugin_mideleg_SS)) && (! 1'b0));
  assign when_CsrPlugin_l1446_2 = ((_zz_when_CsrPlugin_l1446_2 && (1'b1 && CsrPlugin_mideleg_SE)) && (! 1'b0));
  assign when_CsrPlugin_l1446_3 = ((_zz_when_CsrPlugin_l1446 && 1'b1) && (! (|CsrPlugin_mideleg_ST)));
  assign when_CsrPlugin_l1446_4 = ((_zz_when_CsrPlugin_l1446_1 && 1'b1) && (! (|CsrPlugin_mideleg_SS)));
  assign when_CsrPlugin_l1446_5 = ((_zz_when_CsrPlugin_l1446_2 && 1'b1) && (! (|CsrPlugin_mideleg_SE)));
  assign when_CsrPlugin_l1446_6 = ((_zz_when_CsrPlugin_l1446_3 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1446_7 = ((_zz_when_CsrPlugin_l1446_4 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1446_8 = ((_zz_when_CsrPlugin_l1446_5 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l1479 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1479_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1479_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1484 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l1490) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l1490 = (|{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}});
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  assign CsrPlugin_trapCauseEbreakDebug = 1'b0;
  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b01 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_stvec_mode;
      end
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b01 : begin
        CsrPlugin_xtvec_base = CsrPlugin_stvec_base;
      end
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_trapEnterDebug = 1'b0;
  assign when_CsrPlugin_l1534 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1542 = (! CsrPlugin_trapEnterDebug);
  assign when_CsrPlugin_l1600 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1604 = writeBack_INSTRUCTION[29 : 28];
  assign when_CsrPlugin_l1612 = (CsrPlugin_mstatus_MPP < 2'b11);
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1663 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_WFI));
  assign when_CsrPlugin_l1665 = (! execute_CsrPlugin_wfiWake);
  assign when_CsrPlugin_l1671 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_256) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_384) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_3857) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3858) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3859) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3860) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_769) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_832) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_770) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_771) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_324) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_260) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_261) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_321) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_320) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_322) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_323) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_800) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_3073) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3201) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1863) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1869) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1691) begin
      if(when_CsrPlugin_l1692) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @(*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(when_CsrPlugin_l1684) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(when_CsrPlugin_l1699) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(when_CsrPlugin_l1684) begin
      CsrPlugin_selfException_payload_code = 4'b0010;
    end
    if(when_CsrPlugin_l1699) begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        2'b01 : begin
          CsrPlugin_selfException_payload_code = 4'b1001;
        end
        default : begin
          CsrPlugin_selfException_payload_code = 4'b1011;
        end
      endcase
    end
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_selfException_payload_code = 4'b0011;
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign when_CsrPlugin_l1684 = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign when_CsrPlugin_l1691 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
  assign when_CsrPlugin_l1692 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  assign when_CsrPlugin_l1699 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_ECALL));
  assign when_CsrPlugin_l1709 = ((execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_EBREAK)) && CsrPlugin_allowEbreakException);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1863) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1863) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  always @(*) begin
    execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
    end
    if(execute_CsrPlugin_csr_324) begin
      execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
    end
  end

  assign switch_Misc_l241_1 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l241_1)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1731 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1735 = (execute_arbitration_isValid && (execute_IS_CSR || execute_RESCHEDULE_NEXT));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l241_2 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    case(switch_Misc_l241_2)
      3'b000 : begin
        _zz_execute_BRANCH_DO = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_DO = (! execute_BranchPlugin_eq);
      end
      3'b101 : begin
        _zz_execute_BRANCH_DO = (! execute_SRC_LESS);
      end
      3'b111 : begin
        _zz_execute_BRANCH_DO = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_DO = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_DO_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_DO_1 = _zz_execute_BRANCH_DO;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JALR) ? execute_RS1 : execute_PC);
  assign _zz_execute_BranchPlugin_branch_src2 = _zz__zz_execute_BranchPlugin_branch_src2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[19] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[18] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[17] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[16] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[15] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[14] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[13] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[12] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[11] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JAL : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_1,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {_zz_execute_BranchPlugin_branch_src2_3,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_execute_BranchPlugin_branch_src2_6;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = execute_BRANCH_CALC;
  always @(*) begin
    BranchPlugin_branchExceptionPort_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && BranchPlugin_jumpInterface_payload[1]);
    if(when_BranchPlugin_l223) begin
      BranchPlugin_branchExceptionPort_valid = 1'b0;
    end
  end

  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = BranchPlugin_jumpInterface_payload;
  assign when_BranchPlugin_l223 = 1'b0;
  assign CounterPlugin_dbgCtrEn = (! (1'b0 && 1'b0));
  assign CounterPlugin_menable = 3'b111;
  assign CounterPlugin_senable = 3'b111;
  assign _zz_when_CounterPlugin_l90 = CounterPlugin_menable[1];
  assign _zz_when_CounterPlugin_l90_1 = CounterPlugin_menable[1];
  assign when_DebugPlugin_l238 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = DebugPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l257) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l257 = (! _zz_when_DebugPlugin_l257);
  always @(*) begin
    DebugPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign DebugPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l280 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l284 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l284_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l285 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l285_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l286 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l287 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l288 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l288_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l308 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l311 = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) == 1'b0);
  assign when_DebugPlugin_l324 = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l344 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_15 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_17 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_25 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_26 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_27 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_28 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_30 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_32 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_33 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_34 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_38 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_39 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_42 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_43 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_44 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_46 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_58 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_59 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_60 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_61 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_62 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_63 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_64 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_65 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_66 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}}));
  assign execute_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,memory_arbitration_flushNext}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}}));
  assign memory_arbitration_isFlushed = ((|writeBack_arbitration_flushNext) || (|{writeBack_arbitration_flushIt,memory_arbitration_flushIt}));
  assign writeBack_arbitration_isFlushed = (1'b0 || (|writeBack_arbitration_flushIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    DebugPlugin_injectionPort_ready = 1'b0;
    case(IBusCachedPlugin_injector_port_state)
      3'b100 : begin
        DebugPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l391 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1813 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_8 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_9 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_10 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_11 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_12 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_13 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_14 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_15 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_16 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_17 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_18 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_19 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_20 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_21 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_22 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_23 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_24 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_25 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1813_26 = (! execute_arbitration_isStuck);
  assign switch_CsrPlugin_l1167 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit[19 : 19] = MmuPlugin_status_mxr;
      _zz_CsrPlugin_csrMapping_readDataInit[18 : 18] = MmuPlugin_status_sum;
      _zz_CsrPlugin_csrMapping_readDataInit[17 : 17] = MmuPlugin_status_mprv;
      _zz_CsrPlugin_csrMapping_readDataInit[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_CsrPlugin_csrMapping_readDataInit[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_CsrPlugin_csrMapping_readDataInit[8 : 8] = CsrPlugin_sstatus_SPP;
      _zz_CsrPlugin_csrMapping_readDataInit[5 : 5] = CsrPlugin_sstatus_SPIE;
      _zz_CsrPlugin_csrMapping_readDataInit[1 : 1] = CsrPlugin_sstatus_SIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h0;
    if(execute_CsrPlugin_csr_256) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[19 : 19] = MmuPlugin_status_mxr;
      _zz_CsrPlugin_csrMapping_readDataInit_1[18 : 18] = MmuPlugin_status_sum;
      _zz_CsrPlugin_csrMapping_readDataInit_1[17 : 17] = MmuPlugin_status_mprv;
      _zz_CsrPlugin_csrMapping_readDataInit_1[8 : 8] = CsrPlugin_sstatus_SPP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[5 : 5] = CsrPlugin_sstatus_SPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_1[1 : 1] = CsrPlugin_sstatus_SIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h0;
    if(execute_CsrPlugin_csr_384) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[31 : 31] = MmuPlugin_satp_mode;
      _zz_CsrPlugin_csrMapping_readDataInit_2[30 : 22] = MmuPlugin_satp_asid;
      _zz_CsrPlugin_csrMapping_readDataInit_2[21 : 0] = MmuPlugin_satp_ppn;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h0;
    if(execute_CsrPlugin_csr_769) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[31 : 30] = CsrPlugin_misa_base;
      _zz_CsrPlugin_csrMapping_readDataInit_3[25 : 0] = CsrPlugin_misa_extensions;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[3 : 3] = CsrPlugin_mip_MSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[5 : 5] = CsrPlugin_sip_STIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[1 : 1] = CsrPlugin_sip_SSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[9 : 9] = CsrPlugin_sip_SEIP_OR;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_5 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_5[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[3 : 3] = CsrPlugin_mie_MSIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[9 : 9] = CsrPlugin_sie_SEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[5 : 5] = CsrPlugin_sie_STIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[1 : 1] = CsrPlugin_sie_SSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_6 = 32'h0;
    if(execute_CsrPlugin_csr_773) begin
      _zz_CsrPlugin_csrMapping_readDataInit_6[31 : 2] = CsrPlugin_mtvec_base;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_7 = 32'h0;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_7[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_8 = 32'h0;
    if(execute_CsrPlugin_csr_832) begin
      _zz_CsrPlugin_csrMapping_readDataInit_8[31 : 0] = CsrPlugin_mscratch;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_9 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_9[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_9[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_10 = 32'h0;
    if(execute_CsrPlugin_csr_835) begin
      _zz_CsrPlugin_csrMapping_readDataInit_10[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_11 = 32'h0;
    if(execute_CsrPlugin_csr_770) begin
      _zz_CsrPlugin_csrMapping_readDataInit_11[0 : 0] = CsrPlugin_medeleg_IAM;
      _zz_CsrPlugin_csrMapping_readDataInit_11[1 : 1] = CsrPlugin_medeleg_IAF;
      _zz_CsrPlugin_csrMapping_readDataInit_11[2 : 2] = CsrPlugin_medeleg_II;
      _zz_CsrPlugin_csrMapping_readDataInit_11[3 : 3] = CsrPlugin_medeleg_BP;
      _zz_CsrPlugin_csrMapping_readDataInit_11[4 : 4] = CsrPlugin_medeleg_LAM;
      _zz_CsrPlugin_csrMapping_readDataInit_11[5 : 5] = CsrPlugin_medeleg_LAF;
      _zz_CsrPlugin_csrMapping_readDataInit_11[6 : 6] = CsrPlugin_medeleg_SAM;
      _zz_CsrPlugin_csrMapping_readDataInit_11[7 : 7] = CsrPlugin_medeleg_SAF;
      _zz_CsrPlugin_csrMapping_readDataInit_11[8 : 8] = CsrPlugin_medeleg_EU;
      _zz_CsrPlugin_csrMapping_readDataInit_11[9 : 9] = CsrPlugin_medeleg_ES;
      _zz_CsrPlugin_csrMapping_readDataInit_11[12 : 12] = CsrPlugin_medeleg_IPF;
      _zz_CsrPlugin_csrMapping_readDataInit_11[13 : 13] = CsrPlugin_medeleg_LPF;
      _zz_CsrPlugin_csrMapping_readDataInit_11[15 : 15] = CsrPlugin_medeleg_SPF;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_12 = 32'h0;
    if(execute_CsrPlugin_csr_771) begin
      _zz_CsrPlugin_csrMapping_readDataInit_12[9 : 9] = CsrPlugin_mideleg_SE;
      _zz_CsrPlugin_csrMapping_readDataInit_12[5 : 5] = CsrPlugin_mideleg_ST;
      _zz_CsrPlugin_csrMapping_readDataInit_12[1 : 1] = CsrPlugin_mideleg_SS;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_13 = 32'h0;
    if(execute_CsrPlugin_csr_324) begin
      _zz_CsrPlugin_csrMapping_readDataInit_13[5 : 5] = CsrPlugin_sip_STIP;
      _zz_CsrPlugin_csrMapping_readDataInit_13[1 : 1] = CsrPlugin_sip_SSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_13[9 : 9] = CsrPlugin_sip_SEIP_OR;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_14 = 32'h0;
    if(execute_CsrPlugin_csr_260) begin
      _zz_CsrPlugin_csrMapping_readDataInit_14[9 : 9] = CsrPlugin_sie_SEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_14[5 : 5] = CsrPlugin_sie_STIE;
      _zz_CsrPlugin_csrMapping_readDataInit_14[1 : 1] = CsrPlugin_sie_SSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_15 = 32'h0;
    if(execute_CsrPlugin_csr_261) begin
      _zz_CsrPlugin_csrMapping_readDataInit_15[31 : 2] = CsrPlugin_stvec_base;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_16 = 32'h0;
    if(execute_CsrPlugin_csr_321) begin
      _zz_CsrPlugin_csrMapping_readDataInit_16[31 : 0] = CsrPlugin_sepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_17 = 32'h0;
    if(execute_CsrPlugin_csr_320) begin
      _zz_CsrPlugin_csrMapping_readDataInit_17[31 : 0] = CsrPlugin_sscratch;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_18 = 32'h0;
    if(execute_CsrPlugin_csr_322) begin
      _zz_CsrPlugin_csrMapping_readDataInit_18[31 : 31] = CsrPlugin_scause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_18[3 : 0] = CsrPlugin_scause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_19 = 32'h0;
    if(execute_CsrPlugin_csr_323) begin
      _zz_CsrPlugin_csrMapping_readDataInit_19[31 : 0] = CsrPlugin_stval;
    end
  end

  assign when_CounterPlugin_l161 = (! (CsrPlugin_privilege == 2'b11));
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_20 = 32'h0;
    if(execute_CsrPlugin_csr_800) begin
      _zz_CsrPlugin_csrMapping_readDataInit_20[0 : 0] = CounterPlugin_inhibitCY;
      _zz_CsrPlugin_csrMapping_readDataInit_20[2 : 2] = CounterPlugin_inhibitIR;
    end
  end

  assign when_CounterPlugin_l90 = ((! ((CsrPlugin_privilege == 2'b11) || (CsrPlugin_privilege == 2'b01))) || (! _zz_when_CounterPlugin_l90));
  assign when_CounterPlugin_l92 = (! _zz_when_CounterPlugin_l90);
  assign when_CounterPlugin_l92_1 = (! CounterPlugin_senable[1]);
  assign when_CounterPlugin_l92_2 = (! CounterPlugin_menable[1]);
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_21 = 32'h0;
    if(execute_CsrPlugin_csr_3073) begin
      _zz_CsrPlugin_csrMapping_readDataInit_21[31 : 0] = utime[31 : 0];
    end
  end

  assign when_CounterPlugin_l90_1 = ((! ((CsrPlugin_privilege == 2'b11) || (CsrPlugin_privilege == 2'b01))) || (! _zz_when_CounterPlugin_l90_1));
  assign when_CounterPlugin_l92_3 = (! _zz_when_CounterPlugin_l90_1);
  assign when_CounterPlugin_l92_4 = (! CounterPlugin_senable[1]);
  assign when_CounterPlugin_l92_5 = (! CounterPlugin_menable[1]);
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_22 = 32'h0;
    if(execute_CsrPlugin_csr_3201) begin
      _zz_CsrPlugin_csrMapping_readDataInit_22[31 : 0] = utime[63 : 32];
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = (((((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_23)) | ((_zz_CsrPlugin_csrMapping_readDataInit_24 | _zz_CsrPlugin_csrMapping_readDataInit_25) | (_zz_CsrPlugin_csrMapping_readDataInit_26 | _zz_CsrPlugin_csrMapping_readDataInit_3))) | (((_zz_CsrPlugin_csrMapping_readDataInit_4 | _zz_CsrPlugin_csrMapping_readDataInit_5) | (_zz_CsrPlugin_csrMapping_readDataInit_6 | _zz_CsrPlugin_csrMapping_readDataInit_7)) | ((_zz_CsrPlugin_csrMapping_readDataInit_8 | _zz_CsrPlugin_csrMapping_readDataInit_9) | (_zz_CsrPlugin_csrMapping_readDataInit_10 | _zz_CsrPlugin_csrMapping_readDataInit_11)))) | ((((_zz_CsrPlugin_csrMapping_readDataInit_12 | _zz_CsrPlugin_csrMapping_readDataInit_13) | (_zz_CsrPlugin_csrMapping_readDataInit_14 | _zz_CsrPlugin_csrMapping_readDataInit_15)) | ((_zz_CsrPlugin_csrMapping_readDataInit_16 | _zz_CsrPlugin_csrMapping_readDataInit_17) | (_zz_CsrPlugin_csrMapping_readDataInit_18 | _zz_CsrPlugin_csrMapping_readDataInit_19))) | ((_zz_CsrPlugin_csrMapping_readDataInit_20 | _zz_CsrPlugin_csrMapping_readDataInit_21) | _zz_CsrPlugin_csrMapping_readDataInit_22)));
  assign when_CsrPlugin_l1846 = ((execute_arbitration_isValid && execute_IS_CSR) && (({execute_CsrPlugin_csrAddress[11 : 2],2'b00} == 12'h3a0) || ({execute_CsrPlugin_csrAddress[11 : 4],4'b0000} == 12'h3b0)));
  assign _zz_when_CsrPlugin_l1853 = (execute_CsrPlugin_csrAddress & 12'hf60);
  assign when_CsrPlugin_l1853 = (((execute_arbitration_isValid && execute_IS_CSR) && (5'h03 <= execute_CsrPlugin_csrAddress[4 : 0])) && (((_zz_when_CsrPlugin_l1853 == 12'hb00) || (((_zz_when_CsrPlugin_l1853 == 12'hc00) && (! execute_CsrPlugin_writeInstruction)) && (CsrPlugin_privilege == 2'b11))) || ((execute_CsrPlugin_csrAddress & 12'hfe0) == 12'h320)));
  always @(*) begin
    when_CsrPlugin_l1863 = CsrPlugin_csrMapping_doForceFailCsr;
    if(when_CsrPlugin_l1861) begin
      when_CsrPlugin_l1863 = 1'b1;
    end
  end

  assign when_CsrPlugin_l1861 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1869 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  assign DBusCachedPlugin_trigger_hitBefore = 1'b0;
  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      MmuPlugin_status_sum <= 1'b0;
      MmuPlugin_status_mxr <= 1'b0;
      MmuPlugin_status_mprv <= 1'b0;
      MmuPlugin_satp_mode <= 1'b0;
      MmuPlugin_ports_0_cache_0_valid <= 1'b0;
      MmuPlugin_ports_0_cache_1_valid <= 1'b0;
      MmuPlugin_ports_0_cache_2_valid <= 1'b0;
      MmuPlugin_ports_0_cache_3_valid <= 1'b0;
      MmuPlugin_ports_0_dirty <= 1'b0;
      MmuPlugin_ports_0_entryToReplace_value <= 2'b00;
      MmuPlugin_ports_1_cache_0_valid <= 1'b0;
      MmuPlugin_ports_1_cache_1_valid <= 1'b0;
      MmuPlugin_ports_1_cache_2_valid <= 1'b0;
      MmuPlugin_ports_1_cache_3_valid <= 1'b0;
      MmuPlugin_ports_1_dirty <= 1'b0;
      MmuPlugin_ports_1_entryToReplace_value <= 2'b00;
      MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_IDLE;
      MmuPlugin_shared_dBusRspStaged_valid <= 1'b0;
      IBusCachedPlugin_fetchPc_pcReg <= 32'h0;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid_1 <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      IBusCachedPlugin_rspCounter <= 32'h0;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN <= 1'b1;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      dBus_rsp_regNext_valid <= 1'b0;
      DBusCachedPlugin_rspCounter <= 32'h0;
      _zz_5 <= 1'b1;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      _zz_CsrPlugin_privilege <= 2'b11;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_medeleg_IAM <= 1'b0;
      CsrPlugin_medeleg_IAF <= 1'b0;
      CsrPlugin_medeleg_II <= 1'b0;
      CsrPlugin_medeleg_BP <= 1'b0;
      CsrPlugin_medeleg_LAM <= 1'b0;
      CsrPlugin_medeleg_LAF <= 1'b0;
      CsrPlugin_medeleg_SAM <= 1'b0;
      CsrPlugin_medeleg_SAF <= 1'b0;
      CsrPlugin_medeleg_EU <= 1'b0;
      CsrPlugin_medeleg_ES <= 1'b0;
      CsrPlugin_medeleg_IPF <= 1'b0;
      CsrPlugin_medeleg_LPF <= 1'b0;
      CsrPlugin_medeleg_SPF <= 1'b0;
      CsrPlugin_mideleg_ST <= 1'b0;
      CsrPlugin_mideleg_SE <= 1'b0;
      CsrPlugin_mideleg_SS <= 1'b0;
      CsrPlugin_sstatus_SIE <= 1'b0;
      CsrPlugin_sstatus_SPIE <= 1'b0;
      CsrPlugin_sstatus_SPP <= 1'b1;
      CsrPlugin_sip_SEIP_SOFT <= 1'b0;
      CsrPlugin_sip_STIP <= 1'b0;
      CsrPlugin_sip_SSIP <= 1'b0;
      CsrPlugin_sie_SEIE <= 1'b0;
      CsrPlugin_sie_STIE <= 1'b0;
      CsrPlugin_sie_SSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_lastStageWasWfi <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      CounterPlugin_inhibitCY <= 1'b0;
      CounterPlugin_inhibitIR <= 1'b0;
      CounterPlugin_cycle <= 64'h0;
      CounterPlugin_instret <= 64'h0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      IBusCachedPlugin_injector_port_state <= 3'b000;
      execute_to_memory_IS_DBUS_SHARING <= 1'b0;
      memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
    end else begin
      if(CsrPlugin_xretAwayFromMachine) begin
        MmuPlugin_status_mprv <= 1'b0;
      end
      if(when_MmuPlugin_l117) begin
        MmuPlugin_ports_0_dirty <= 1'b0;
      end
      MmuPlugin_ports_0_entryToReplace_value <= MmuPlugin_ports_0_entryToReplace_valueNext;
      if(contextSwitching) begin
        if(MmuPlugin_ports_0_cache_0_exception) begin
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_1_exception) begin
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_2_exception) begin
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_3_exception) begin
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        end
      end
      if(when_MmuPlugin_l117_1) begin
        MmuPlugin_ports_1_dirty <= 1'b0;
      end
      MmuPlugin_ports_1_entryToReplace_value <= MmuPlugin_ports_1_entryToReplace_valueNext;
      if(contextSwitching) begin
        if(MmuPlugin_ports_1_cache_0_exception) begin
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_1_exception) begin
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_2_exception) begin
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_3_exception) begin
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        end
      end
      MmuPlugin_shared_dBusRspStaged_valid <= MmuPlugin_dBusAccess_rsp_valid;
      case(MmuPlugin_shared_state_1)
        MmuPlugin_shared_State_IDLE : begin
          if(when_MmuPlugin_l223) begin
            MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_L1_CMD;
          end
        end
        MmuPlugin_shared_State_L1_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready) begin
            MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_L1_RSP;
          end
        end
        MmuPlugin_shared_State_L1_RSP : begin
          if(MmuPlugin_shared_dBusRspStaged_valid) begin
            MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_L0_CMD;
            if(when_MmuPlugin_l250) begin
              MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_IDLE;
            end
            if(MmuPlugin_shared_dBusRspStaged_payload_redo) begin
              MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_L1_CMD;
            end
          end
        end
        MmuPlugin_shared_State_L0_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready) begin
            MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_L0_RSP;
          end
        end
        default : begin
          if(MmuPlugin_shared_dBusRspStaged_valid) begin
            MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_IDLE;
            if(MmuPlugin_shared_dBusRspStaged_payload_redo) begin
              MmuPlugin_shared_state_1 <= MmuPlugin_shared_State_L0_CMD;
            end
          end
        end
      endcase
      if(when_MmuPlugin_l279) begin
        if(when_MmuPlugin_l281) begin
          MmuPlugin_ports_0_dirty <= 1'b1;
          if(when_MmuPlugin_l287) begin
            MmuPlugin_ports_0_cache_0_valid <= 1'b1;
          end
          if(when_MmuPlugin_l287_1) begin
            MmuPlugin_ports_0_cache_1_valid <= 1'b1;
          end
          if(when_MmuPlugin_l287_2) begin
            MmuPlugin_ports_0_cache_2_valid <= 1'b1;
          end
          if(when_MmuPlugin_l287_3) begin
            MmuPlugin_ports_0_cache_3_valid <= 1'b1;
          end
        end
        if(when_MmuPlugin_l281_1) begin
          MmuPlugin_ports_1_dirty <= 1'b1;
          if(when_MmuPlugin_l287_4) begin
            MmuPlugin_ports_1_cache_0_valid <= 1'b1;
          end
          if(when_MmuPlugin_l287_5) begin
            MmuPlugin_ports_1_cache_1_valid <= 1'b1;
          end
          if(when_MmuPlugin_l287_6) begin
            MmuPlugin_ports_1_cache_2_valid <= 1'b1;
          end
          if(when_MmuPlugin_l287_7) begin
            MmuPlugin_ports_1_cache_3_valid <= 1'b1;
          end
        end
      end
      if(when_MmuPlugin_l311) begin
        MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        MmuPlugin_ports_1_cache_3_valid <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_correction) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l133) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l133_1) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l160) begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid_1 <= 1'b0;
      end
      if(_zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_input_valid_1 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_2_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_2_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l331) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l331_1) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l331_2) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(when_Fetcher_l331_3) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(when_Fetcher_l331_4) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      if(when_Fetcher_l331_5) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= IBusCachedPlugin_injector_nextPcCalc_valids_4;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      if(iBus_rsp_valid) begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dataCache_1_io_mem_cmd_valid) begin
        cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN <= 1'b0;
      end
      if(cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_ready) begin
        cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN <= 1'b1;
      end
      if(cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_ready) begin
        cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rValid <= cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_valid;
      end
      dBus_rsp_regNext_valid <= dBus_rsp_valid;
      if(dBus_rsp_valid) begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      _zz_5 <= 1'b0;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      if(when_CsrPlugin_l1403) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l1403_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l1403_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l1403_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l1440) begin
        if(when_CsrPlugin_l1446) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(when_CsrPlugin_l1440_1) begin
        if(when_CsrPlugin_l1446_3) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_4) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_5) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_6) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_7) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1446_8) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      CsrPlugin_lastStageWasWfi <= (writeBack_arbitration_isFiring && (writeBack_ENV_CTRL == EnvCtrlEnum_WFI));
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l1479) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l1479_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l1479_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l1484) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1534) begin
        if(when_CsrPlugin_l1542) begin
          _zz_CsrPlugin_privilege <= CsrPlugin_targetPrivilege;
          case(CsrPlugin_targetPrivilege)
            2'b01 : begin
              CsrPlugin_sstatus_SIE <= 1'b0;
              CsrPlugin_sstatus_SPIE <= CsrPlugin_sstatus_SIE;
              CsrPlugin_sstatus_SPP <= CsrPlugin_privilege[0 : 0];
            end
            2'b11 : begin
              CsrPlugin_mstatus_MIE <= 1'b0;
              CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
              CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
            end
            default : begin
            end
          endcase
        end
      end
      if(when_CsrPlugin_l1600) begin
        case(switch_CsrPlugin_l1604)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
            _zz_CsrPlugin_privilege <= CsrPlugin_mstatus_MPP;
          end
          2'b01 : begin
            CsrPlugin_sstatus_SPP <= 1'b0;
            CsrPlugin_sstatus_SIE <= CsrPlugin_sstatus_SPIE;
            CsrPlugin_sstatus_SPIE <= 1'b1;
            _zz_CsrPlugin_privilege <= {1'b0,CsrPlugin_sstatus_SPP};
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ((|{_zz_when_CsrPlugin_l1446_5,{_zz_when_CsrPlugin_l1446_4,{_zz_when_CsrPlugin_l1446_3,{_zz_when_CsrPlugin_l1446_2,{_zz_when_CsrPlugin_l1446_1,_zz_when_CsrPlugin_l1446}}}}}) || CsrPlugin_thirdPartyWake);
      CounterPlugin_cycle <= (CounterPlugin_cycle + _zz_CounterPlugin_cycle);
      if(writeBack_arbitration_isFiring) begin
        CounterPlugin_instret <= (CounterPlugin_instret + _zz_CounterPlugin_instret);
      end
      if(when_Pipeline_l124_57) begin
        execute_to_memory_IS_DBUS_SHARING <= execute_IS_DBUS_SHARING;
      end
      if(when_Pipeline_l124_58) begin
        memory_to_writeBack_IS_DBUS_SHARING <= memory_IS_DBUS_SHARING;
      end
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(IBusCachedPlugin_injector_port_state)
        3'b000 : begin
          if(DebugPlugin_injectionPort_valid) begin
            IBusCachedPlugin_injector_port_state <= 3'b001;
          end
        end
        3'b001 : begin
          IBusCachedPlugin_injector_port_state <= 3'b010;
        end
        3'b010 : begin
          IBusCachedPlugin_injector_port_state <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l391) begin
            IBusCachedPlugin_injector_port_state <= 3'b100;
          end
        end
        3'b100 : begin
          IBusCachedPlugin_injector_port_state <= 3'b000;
        end
        default : begin
        end
      endcase
      if(MmuPlugin_dBusAccess_rsp_valid) begin
        memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      end
      if(MmuPlugin_dBusAccess_rsp_valid) begin
        memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      end
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          MmuPlugin_status_mxr <= CsrPlugin_csrMapping_writeDataSignal[19];
          MmuPlugin_status_sum <= CsrPlugin_csrMapping_writeDataSignal[18];
          MmuPlugin_status_mprv <= CsrPlugin_csrMapping_writeDataSignal[17];
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          case(switch_CsrPlugin_l1167)
            2'b11 : begin
              CsrPlugin_mstatus_MPP <= 2'b11;
            end
            2'b01 : begin
              CsrPlugin_mstatus_MPP <= 2'b01;
            end
            2'b00 : begin
              CsrPlugin_mstatus_MPP <= 2'b00;
            end
            default : begin
            end
          endcase
          CsrPlugin_sstatus_SPP <= CsrPlugin_csrMapping_writeDataSignal[8 : 8];
          CsrPlugin_sstatus_SPIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sstatus_SIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_256) begin
        if(execute_CsrPlugin_writeEnable) begin
          MmuPlugin_status_mxr <= CsrPlugin_csrMapping_writeDataSignal[19];
          MmuPlugin_status_sum <= CsrPlugin_csrMapping_writeDataSignal[18];
          MmuPlugin_status_mprv <= CsrPlugin_csrMapping_writeDataSignal[17];
          CsrPlugin_sstatus_SPP <= CsrPlugin_csrMapping_writeDataSignal[8 : 8];
          CsrPlugin_sstatus_SPIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sstatus_SIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_384) begin
        if(execute_CsrPlugin_writeEnable) begin
          MmuPlugin_satp_mode <= CsrPlugin_csrMapping_writeDataSignal[31];
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        end
      end
      if(execute_CsrPlugin_csr_836) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sip_STIP <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sip_SSIP <= CsrPlugin_csrMapping_writeDataSignal[1];
          CsrPlugin_sip_SEIP_SOFT <= CsrPlugin_csrMapping_writeDataSignal[9];
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          CsrPlugin_sie_SEIE <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_sie_STIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sie_SSIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_770) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_medeleg_IAM <= CsrPlugin_csrMapping_writeDataSignal[0];
          CsrPlugin_medeleg_IAF <= CsrPlugin_csrMapping_writeDataSignal[1];
          CsrPlugin_medeleg_II <= CsrPlugin_csrMapping_writeDataSignal[2];
          CsrPlugin_medeleg_BP <= CsrPlugin_csrMapping_writeDataSignal[3];
          CsrPlugin_medeleg_LAM <= CsrPlugin_csrMapping_writeDataSignal[4];
          CsrPlugin_medeleg_LAF <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_medeleg_SAM <= CsrPlugin_csrMapping_writeDataSignal[6];
          CsrPlugin_medeleg_SAF <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_medeleg_EU <= CsrPlugin_csrMapping_writeDataSignal[8];
          CsrPlugin_medeleg_ES <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_medeleg_IPF <= CsrPlugin_csrMapping_writeDataSignal[12];
          CsrPlugin_medeleg_LPF <= CsrPlugin_csrMapping_writeDataSignal[13];
          CsrPlugin_medeleg_SPF <= CsrPlugin_csrMapping_writeDataSignal[15];
        end
      end
      if(execute_CsrPlugin_csr_771) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mideleg_SE <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_mideleg_ST <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_mideleg_SS <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_324) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sip_STIP <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sip_SSIP <= CsrPlugin_csrMapping_writeDataSignal[1];
          CsrPlugin_sip_SEIP_SOFT <= CsrPlugin_csrMapping_writeDataSignal[9];
        end
      end
      if(execute_CsrPlugin_csr_260) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sie_SEIE <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_sie_STIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sie_SSIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_800) begin
        if(execute_CsrPlugin_writeEnable) begin
          CounterPlugin_inhibitCY <= CsrPlugin_csrMapping_writeDataSignal[0];
          CounterPlugin_inhibitIR <= CsrPlugin_csrMapping_writeDataSignal[2];
        end
      end
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(when_MmuPlugin_l124) begin
      MmuPlugin_ports_0_requireMmuLockup <= MmuPlugin_ports_0_requireMmuLockupCalc;
    end
    if(when_MmuPlugin_l124_1) begin
      MmuPlugin_ports_0_cacheHits <= MmuPlugin_ports_0_cacheHitsCalc;
    end
    if(when_MmuPlugin_l124_2) begin
      MmuPlugin_ports_1_requireMmuLockup <= MmuPlugin_ports_1_requireMmuLockupCalc;
    end
    if(when_MmuPlugin_l124_3) begin
      MmuPlugin_ports_1_cacheHits <= MmuPlugin_ports_1_cacheHitsCalc;
    end
    MmuPlugin_shared_dBusRspStaged_payload_data <= MmuPlugin_dBusAccess_rsp_payload_data;
    MmuPlugin_shared_dBusRspStaged_payload_error <= MmuPlugin_dBusAccess_rsp_payload_error;
    MmuPlugin_shared_dBusRspStaged_payload_redo <= MmuPlugin_dBusAccess_rsp_payload_redo;
    if(when_MmuPlugin_l211) begin
      MmuPlugin_shared_pteBuffer_V <= MmuPlugin_shared_dBusRsp_pte_V;
      MmuPlugin_shared_pteBuffer_R <= MmuPlugin_shared_dBusRsp_pte_R;
      MmuPlugin_shared_pteBuffer_W <= MmuPlugin_shared_dBusRsp_pte_W;
      MmuPlugin_shared_pteBuffer_X <= MmuPlugin_shared_dBusRsp_pte_X;
      MmuPlugin_shared_pteBuffer_U <= MmuPlugin_shared_dBusRsp_pte_U;
      MmuPlugin_shared_pteBuffer_G <= MmuPlugin_shared_dBusRsp_pte_G;
      MmuPlugin_shared_pteBuffer_A <= MmuPlugin_shared_dBusRsp_pte_A;
      MmuPlugin_shared_pteBuffer_D <= MmuPlugin_shared_dBusRsp_pte_D;
      MmuPlugin_shared_pteBuffer_RSW <= MmuPlugin_shared_dBusRsp_pte_RSW;
      MmuPlugin_shared_pteBuffer_PPN0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
      MmuPlugin_shared_pteBuffer_PPN1 <= MmuPlugin_shared_dBusRsp_pte_PPN1;
    end
    case(MmuPlugin_shared_state_1)
      MmuPlugin_shared_State_IDLE : begin
        if(when_MmuPlugin_l223) begin
          MmuPlugin_shared_portSortedOh <= MmuPlugin_shared_refills;
          MmuPlugin_shared_vpn_1 <= _zz_MmuPlugin_shared_vpn_0[31 : 22];
          MmuPlugin_shared_vpn_0 <= _zz_MmuPlugin_shared_vpn_0[21 : 12];
        end
      end
      MmuPlugin_shared_State_L1_CMD : begin
      end
      MmuPlugin_shared_State_L1_RSP : begin
      end
      MmuPlugin_shared_State_L0_CMD : begin
      end
      default : begin
      end
    endcase
    if(when_MmuPlugin_l279) begin
      if(when_MmuPlugin_l281) begin
        if(when_MmuPlugin_l287) begin
          MmuPlugin_ports_0_cache_0_exception <= ((MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0))) || (! MmuPlugin_shared_dBusRsp_pte_A));
          MmuPlugin_ports_0_cache_0_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_0_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_0_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_0_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_0_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_0_allowWrite <= (MmuPlugin_shared_dBusRsp_pte_W && MmuPlugin_shared_dBusRsp_pte_D);
          MmuPlugin_ports_0_cache_0_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_0_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_0_superPage <= (MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP);
        end
        if(when_MmuPlugin_l287_1) begin
          MmuPlugin_ports_0_cache_1_exception <= ((MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0))) || (! MmuPlugin_shared_dBusRsp_pte_A));
          MmuPlugin_ports_0_cache_1_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_1_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_1_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_1_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_1_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_1_allowWrite <= (MmuPlugin_shared_dBusRsp_pte_W && MmuPlugin_shared_dBusRsp_pte_D);
          MmuPlugin_ports_0_cache_1_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_1_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_1_superPage <= (MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP);
        end
        if(when_MmuPlugin_l287_2) begin
          MmuPlugin_ports_0_cache_2_exception <= ((MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0))) || (! MmuPlugin_shared_dBusRsp_pte_A));
          MmuPlugin_ports_0_cache_2_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_2_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_2_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_2_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_2_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_2_allowWrite <= (MmuPlugin_shared_dBusRsp_pte_W && MmuPlugin_shared_dBusRsp_pte_D);
          MmuPlugin_ports_0_cache_2_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_2_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_2_superPage <= (MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP);
        end
        if(when_MmuPlugin_l287_3) begin
          MmuPlugin_ports_0_cache_3_exception <= ((MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0))) || (! MmuPlugin_shared_dBusRsp_pte_A));
          MmuPlugin_ports_0_cache_3_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_3_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_3_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_3_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_3_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_3_allowWrite <= (MmuPlugin_shared_dBusRsp_pte_W && MmuPlugin_shared_dBusRsp_pte_D);
          MmuPlugin_ports_0_cache_3_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_3_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_3_superPage <= (MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP);
        end
      end
      if(when_MmuPlugin_l281_1) begin
        if(when_MmuPlugin_l287_4) begin
          MmuPlugin_ports_1_cache_0_exception <= ((MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0))) || (! MmuPlugin_shared_dBusRsp_pte_A));
          MmuPlugin_ports_1_cache_0_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_0_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_0_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_0_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_0_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_0_allowWrite <= (MmuPlugin_shared_dBusRsp_pte_W && MmuPlugin_shared_dBusRsp_pte_D);
          MmuPlugin_ports_1_cache_0_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_0_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_0_superPage <= (MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP);
        end
        if(when_MmuPlugin_l287_5) begin
          MmuPlugin_ports_1_cache_1_exception <= ((MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0))) || (! MmuPlugin_shared_dBusRsp_pte_A));
          MmuPlugin_ports_1_cache_1_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_1_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_1_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_1_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_1_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_1_allowWrite <= (MmuPlugin_shared_dBusRsp_pte_W && MmuPlugin_shared_dBusRsp_pte_D);
          MmuPlugin_ports_1_cache_1_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_1_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_1_superPage <= (MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP);
        end
        if(when_MmuPlugin_l287_6) begin
          MmuPlugin_ports_1_cache_2_exception <= ((MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0))) || (! MmuPlugin_shared_dBusRsp_pte_A));
          MmuPlugin_ports_1_cache_2_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_2_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_2_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_2_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_2_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_2_allowWrite <= (MmuPlugin_shared_dBusRsp_pte_W && MmuPlugin_shared_dBusRsp_pte_D);
          MmuPlugin_ports_1_cache_2_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_2_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_2_superPage <= (MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP);
        end
        if(when_MmuPlugin_l287_7) begin
          MmuPlugin_ports_1_cache_3_exception <= ((MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0))) || (! MmuPlugin_shared_dBusRsp_pte_A));
          MmuPlugin_ports_1_cache_3_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_3_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_3_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_3_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_3_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_3_allowWrite <= (MmuPlugin_shared_dBusRsp_pte_W && MmuPlugin_shared_dBusRsp_pte_D);
          MmuPlugin_ports_1_cache_3_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_3_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_3_superPage <= (MmuPlugin_shared_state_1 == MmuPlugin_shared_State_L1_RSP);
        end
      end
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_output_ready) begin
      _zz_IBusCachedPlugin_iBusRsp_stages_2_output_m2sPipe_payload <= IBusCachedPlugin_iBusRsp_stages_2_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready) begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_3_input_ready) begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rValidN) begin
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_wr <= dataCache_1_io_mem_cmd_payload_wr;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_uncached <= dataCache_1_io_mem_cmd_payload_uncached;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_address <= dataCache_1_io_mem_cmd_payload_address;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_data <= dataCache_1_io_mem_cmd_payload_data;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_mask <= dataCache_1_io_mem_cmd_payload_mask;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_size <= dataCache_1_io_mem_cmd_payload_size;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_rData_last <= dataCache_1_io_mem_cmd_payload_last;
    end
    if(cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_ready) begin
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_wr <= cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_wr;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_uncached <= cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_uncached;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_address <= cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_address;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_data <= cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_data;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_mask <= cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_mask;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_size <= cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_size;
      cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_rData_last <= cores_0_cpu_logic_cpu_dataCache_1_io_mem_cmd_s2mPipe_payload_last;
    end
    dBus_rsp_regNext_payload_last <= dBus_rsp_payload_last;
    dBus_rsp_regNext_payload_data <= dBus_rsp_payload_data;
    dBus_rsp_regNext_payload_error <= dBus_rsp_payload_error;
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    if(when_MulDivIterativePlugin_l126) begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_MulDivIterativePlugin_div_result <= _zz_memory_MulDivIterativePlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_memory_MulDivIterativePlugin_rs1 ? (~ _zz_memory_MulDivIterativePlugin_rs1_1) : _zz_memory_MulDivIterativePlugin_rs1_1) + _zz_memory_MulDivIterativePlugin_rs1_2);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_memory_MulDivIterativePlugin_rs2 ? (~ execute_RS2) : execute_RS2) + _zz_memory_MulDivIterativePlugin_rs2_1);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_memory_MulDivIterativePlugin_rs1 ^ (_zz_memory_MulDivIterativePlugin_rs2 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_sip_SEIP_INPUT <= externalInterruptS;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(_zz_when_1) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3 ? CsrPlugin_selfException_payload_code : BranchPlugin_branchExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_3 ? CsrPlugin_selfException_payload_badAddr : BranchPlugin_branchExceptionPort_payload_badAddr);
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(when_CsrPlugin_l1440) begin
      if(when_CsrPlugin_l1446) begin
        CsrPlugin_interrupt_code <= 4'b0101;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
      if(when_CsrPlugin_l1446_1) begin
        CsrPlugin_interrupt_code <= 4'b0001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
      if(when_CsrPlugin_l1446_2) begin
        CsrPlugin_interrupt_code <= 4'b1001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
    end
    if(when_CsrPlugin_l1440_1) begin
      if(when_CsrPlugin_l1446_3) begin
        CsrPlugin_interrupt_code <= 4'b0101;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1446_4) begin
        CsrPlugin_interrupt_code <= 4'b0001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1446_5) begin
        CsrPlugin_interrupt_code <= 4'b1001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1446_6) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1446_7) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1446_8) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1534) begin
      if(when_CsrPlugin_l1542) begin
        case(CsrPlugin_targetPrivilege)
          2'b01 : begin
            CsrPlugin_scause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_scause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_sepc <= writeBack_PC;
            if(CsrPlugin_hadException) begin
              CsrPlugin_stval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
            end
          end
          2'b11 : begin
            CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_mepc <= writeBack_PC;
            if(CsrPlugin_hadException) begin
              CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
            end
          end
          default : begin
          end
        endcase
      end
    end
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= _zz_decode_to_execute_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= execute_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_execute_to_memory_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= memory_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_IS_SFENCE_VMA2 <= decode_IS_SFENCE_VMA2;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_RESCHEDULE_NEXT <= decode_RESCHEDULE_NEXT;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_13) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_15) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_17) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_19) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_20) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_22) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_23) begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if(when_Pipeline_l124_24) begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if(when_Pipeline_l124_25) begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if(when_Pipeline_l124_26) begin
      decode_to_execute_MEMORY_LRSC <= decode_MEMORY_LRSC;
    end
    if(when_Pipeline_l124_27) begin
      execute_to_memory_MEMORY_LRSC <= execute_MEMORY_LRSC;
    end
    if(when_Pipeline_l124_28) begin
      memory_to_writeBack_MEMORY_LRSC <= memory_MEMORY_LRSC;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_MEMORY_AMO <= decode_MEMORY_AMO;
    end
    if(when_Pipeline_l124_30) begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_32) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_33) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_34) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_35) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_36) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_37) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_38) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_39) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_42) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_43) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_44) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_46) begin
      decode_to_execute_RS1 <= _zz_decode_to_execute_RS1;
    end
    if(when_Pipeline_l124_47) begin
      decode_to_execute_RS2 <= _zz_decode_to_execute_RS2;
    end
    if(when_Pipeline_l124_48) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_49) begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if(when_Pipeline_l124_50) begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if(when_Pipeline_l124_51) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_52) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_53) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_54) begin
      execute_to_memory_MEMORY_STORE_DATA_RF <= execute_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_55) begin
      memory_to_writeBack_MEMORY_STORE_DATA_RF <= memory_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_56) begin
      execute_to_memory_MEMORY_VIRTUAL_ADDRESS <= execute_MEMORY_VIRTUAL_ADDRESS;
    end
    if(when_Pipeline_l124_59) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_60) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_61) begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if(when_Pipeline_l124_62) begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if(when_Pipeline_l124_63) begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if(when_Pipeline_l124_64) begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if(when_Pipeline_l124_65) begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if(when_Pipeline_l124_66) begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if(when_CsrPlugin_l1813) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1813_1) begin
      execute_CsrPlugin_csr_256 <= (decode_INSTRUCTION[31 : 20] == 12'h100);
    end
    if(when_CsrPlugin_l1813_2) begin
      execute_CsrPlugin_csr_384 <= (decode_INSTRUCTION[31 : 20] == 12'h180);
    end
    if(when_CsrPlugin_l1813_3) begin
      execute_CsrPlugin_csr_3857 <= (decode_INSTRUCTION[31 : 20] == 12'hf11);
    end
    if(when_CsrPlugin_l1813_4) begin
      execute_CsrPlugin_csr_3858 <= (decode_INSTRUCTION[31 : 20] == 12'hf12);
    end
    if(when_CsrPlugin_l1813_5) begin
      execute_CsrPlugin_csr_3859 <= (decode_INSTRUCTION[31 : 20] == 12'hf13);
    end
    if(when_CsrPlugin_l1813_6) begin
      execute_CsrPlugin_csr_3860 <= (decode_INSTRUCTION[31 : 20] == 12'hf14);
    end
    if(when_CsrPlugin_l1813_7) begin
      execute_CsrPlugin_csr_769 <= (decode_INSTRUCTION[31 : 20] == 12'h301);
    end
    if(when_CsrPlugin_l1813_8) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1813_9) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1813_10) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1813_11) begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1813_12) begin
      execute_CsrPlugin_csr_832 <= (decode_INSTRUCTION[31 : 20] == 12'h340);
    end
    if(when_CsrPlugin_l1813_13) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1813_14) begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(when_CsrPlugin_l1813_15) begin
      execute_CsrPlugin_csr_770 <= (decode_INSTRUCTION[31 : 20] == 12'h302);
    end
    if(when_CsrPlugin_l1813_16) begin
      execute_CsrPlugin_csr_771 <= (decode_INSTRUCTION[31 : 20] == 12'h303);
    end
    if(when_CsrPlugin_l1813_17) begin
      execute_CsrPlugin_csr_324 <= (decode_INSTRUCTION[31 : 20] == 12'h144);
    end
    if(when_CsrPlugin_l1813_18) begin
      execute_CsrPlugin_csr_260 <= (decode_INSTRUCTION[31 : 20] == 12'h104);
    end
    if(when_CsrPlugin_l1813_19) begin
      execute_CsrPlugin_csr_261 <= (decode_INSTRUCTION[31 : 20] == 12'h105);
    end
    if(when_CsrPlugin_l1813_20) begin
      execute_CsrPlugin_csr_321 <= (decode_INSTRUCTION[31 : 20] == 12'h141);
    end
    if(when_CsrPlugin_l1813_21) begin
      execute_CsrPlugin_csr_320 <= (decode_INSTRUCTION[31 : 20] == 12'h140);
    end
    if(when_CsrPlugin_l1813_22) begin
      execute_CsrPlugin_csr_322 <= (decode_INSTRUCTION[31 : 20] == 12'h142);
    end
    if(when_CsrPlugin_l1813_23) begin
      execute_CsrPlugin_csr_323 <= (decode_INSTRUCTION[31 : 20] == 12'h143);
    end
    if(when_CsrPlugin_l1813_24) begin
      execute_CsrPlugin_csr_800 <= (decode_INSTRUCTION[31 : 20] == 12'h320);
    end
    if(when_CsrPlugin_l1813_25) begin
      execute_CsrPlugin_csr_3073 <= (decode_INSTRUCTION[31 : 20] == 12'hc01);
    end
    if(when_CsrPlugin_l1813_26) begin
      execute_CsrPlugin_csr_3201 <= (decode_INSTRUCTION[31 : 20] == 12'hc81);
    end
    if(execute_CsrPlugin_csr_384) begin
      if(execute_CsrPlugin_writeEnable) begin
        MmuPlugin_satp_asid <= CsrPlugin_csrMapping_writeDataSignal[30 : 22];
        MmuPlugin_satp_ppn <= CsrPlugin_csrMapping_writeDataSignal[21 : 0];
      end
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_773) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_832) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mscratch <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_261) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_stvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
      end
    end
    if(execute_CsrPlugin_csr_321) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_sepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_320) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_sscratch <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_322) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_scause_interrupt <= CsrPlugin_csrMapping_writeDataSignal[31];
        CsrPlugin_scause_exceptionCode <= CsrPlugin_csrMapping_writeDataSignal[3 : 0];
      end
    end
    if(execute_CsrPlugin_csr_323) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_stval <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  always @(posedge debugCd_external_clk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= ((|{writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}}) || IBusCachedPlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l257 <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h10 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_hardwareBreakpoints_0_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        default : begin
        end
      endcase
    end
    if(when_DebugPlugin_l308) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge debugCd_external_clk or posedge debugCd_logic_outputReset) begin
    if(debugCd_logic_outputReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
      DebugPlugin_hardwareBreakpoints_0_valid <= 1'b0;
    end else begin
      if(when_DebugPlugin_l238) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l280)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l284) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l284_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l285) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l285_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l286) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l287) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l288) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l288_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          6'h10 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_hardwareBreakpoints_0_valid <= debug_bus_cmd_payload_data[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l308) begin
        if(when_DebugPlugin_l311) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l324) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module BmbClint (
  input  wire          io_bus_cmd_valid,
  output wire          io_bus_cmd_ready,
  input  wire          io_bus_cmd_payload_last,
  input  wire [0:0]    io_bus_cmd_payload_fragment_opcode,
  input  wire [15:0]   io_bus_cmd_payload_fragment_address,
  input  wire [1:0]    io_bus_cmd_payload_fragment_length,
  input  wire [31:0]   io_bus_cmd_payload_fragment_data,
  input  wire [3:0]    io_bus_cmd_payload_fragment_mask,
  output wire          io_bus_rsp_valid,
  input  wire          io_bus_rsp_ready,
  output wire          io_bus_rsp_payload_last,
  output wire [0:0]    io_bus_rsp_payload_fragment_opcode,
  output wire [31:0]   io_bus_rsp_payload_fragment_data,
  output wire [0:0]    io_timerInterrupt,
  output wire [0:0]    io_softwareInterrupt,
  output wire [63:0]   io_time,
  input  wire          io_stop,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset
);

  wire                factory_readErrorFlag;
  wire                factory_writeErrorFlag;
  wire                factory_readHaltTrigger;
  wire                factory_writeHaltTrigger;
  wire                factory_rsp_valid;
  wire                factory_rsp_ready;
  wire                factory_rsp_payload_last;
  reg        [0:0]    factory_rsp_payload_fragment_opcode;
  reg        [31:0]   factory_rsp_payload_fragment_data;
  wire                _zz_factory_rsp_ready;
  reg                 _zz_factory_rsp_ready_1;
  wire                _zz_io_bus_rsp_valid;
  reg                 _zz_io_bus_rsp_valid_1;
  reg                 _zz_io_bus_rsp_payload_last;
  reg        [0:0]    _zz_io_bus_rsp_payload_fragment_opcode;
  reg        [31:0]   _zz_io_bus_rsp_payload_fragment_data;
  wire                when_Stream_l372;
  wire                factory_askWrite;
  wire                factory_askRead;
  wire                io_bus_cmd_fire;
  wire                factory_doWrite;
  wire                factory_doRead;
  wire                when_BmbSlaveFactory_l33;
  wire                when_BmbSlaveFactory_l35;
  reg                 logic_stop;
  reg        [63:0]   logic_time;
  wire                when_Clint_l39;
  reg        [63:0]   logic_harts_0_cmp;
  reg                 logic_harts_0_timerInterrupt;
  reg                 logic_harts_0_softwareInterrupt;
  wire       [63:0]   _zz_factory_rsp_payload_fragment_data;
  wire                when_BusSlaveFactory_l1041;
  wire                when_BmbSlaveFactory_l77;
  wire                when_BmbSlaveFactory_l77_1;
  wire                when_BmbSlaveFactory_l77_2;
  wire                when_BusSlaveFactory_l1041_1;
  wire                when_BusSlaveFactory_l1041_2;
  wire                when_BusSlaveFactory_l1041_3;
  wire                when_BusSlaveFactory_l1041_4;
  wire                when_BmbSlaveFactory_l77_3;
  wire                when_BusSlaveFactory_l1041_5;
  wire                when_BusSlaveFactory_l1041_6;
  wire                when_BusSlaveFactory_l1041_7;
  wire                when_BusSlaveFactory_l1041_8;

  assign factory_readErrorFlag = 1'b0;
  assign factory_writeErrorFlag = 1'b0;
  assign factory_readHaltTrigger = 1'b0;
  assign factory_writeHaltTrigger = 1'b0;
  assign _zz_factory_rsp_ready = (! (factory_readHaltTrigger || factory_writeHaltTrigger));
  assign factory_rsp_ready = (_zz_factory_rsp_ready_1 && _zz_factory_rsp_ready);
  always @(*) begin
    _zz_factory_rsp_ready_1 = io_bus_rsp_ready;
    if(when_Stream_l372) begin
      _zz_factory_rsp_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l372 = (! _zz_io_bus_rsp_valid);
  assign _zz_io_bus_rsp_valid = _zz_io_bus_rsp_valid_1;
  assign io_bus_rsp_valid = _zz_io_bus_rsp_valid;
  assign io_bus_rsp_payload_last = _zz_io_bus_rsp_payload_last;
  assign io_bus_rsp_payload_fragment_opcode = _zz_io_bus_rsp_payload_fragment_opcode;
  assign io_bus_rsp_payload_fragment_data = _zz_io_bus_rsp_payload_fragment_data;
  assign factory_askWrite = (io_bus_cmd_valid && (io_bus_cmd_payload_fragment_opcode == 1'b1));
  assign factory_askRead = (io_bus_cmd_valid && (io_bus_cmd_payload_fragment_opcode == 1'b0));
  assign io_bus_cmd_fire = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign factory_doWrite = (io_bus_cmd_fire && (io_bus_cmd_payload_fragment_opcode == 1'b1));
  assign factory_doRead = (io_bus_cmd_fire && (io_bus_cmd_payload_fragment_opcode == 1'b0));
  assign factory_rsp_valid = io_bus_cmd_valid;
  assign io_bus_cmd_ready = factory_rsp_ready;
  assign factory_rsp_payload_last = 1'b1;
  assign when_BmbSlaveFactory_l33 = (factory_doWrite && factory_writeErrorFlag);
  always @(*) begin
    if(when_BmbSlaveFactory_l33) begin
      factory_rsp_payload_fragment_opcode = 1'b1;
    end else begin
      if(when_BmbSlaveFactory_l35) begin
        factory_rsp_payload_fragment_opcode = 1'b1;
      end else begin
        factory_rsp_payload_fragment_opcode = 1'b0;
      end
    end
  end

  assign when_BmbSlaveFactory_l35 = (factory_doRead && factory_readErrorFlag);
  always @(*) begin
    factory_rsp_payload_fragment_data = 32'h0;
    case(io_bus_cmd_payload_fragment_address)
      16'h0 : begin
        factory_rsp_payload_fragment_data[0 : 0] = logic_harts_0_softwareInterrupt;
      end
      default : begin
      end
    endcase
    if(when_BmbSlaveFactory_l77) begin
      factory_rsp_payload_fragment_data[31 : 0] = _zz_factory_rsp_payload_fragment_data[31 : 0];
    end
    if(when_BmbSlaveFactory_l77_1) begin
      factory_rsp_payload_fragment_data[31 : 0] = _zz_factory_rsp_payload_fragment_data[63 : 32];
    end
  end

  always @(*) begin
    logic_stop = 1'b0;
    if(io_stop) begin
      logic_stop = 1'b1;
    end
  end

  assign when_Clint_l39 = (! logic_stop);
  assign _zz_factory_rsp_payload_fragment_data = logic_time;
  assign io_timerInterrupt[0] = logic_harts_0_timerInterrupt;
  assign io_softwareInterrupt[0] = logic_harts_0_softwareInterrupt;
  assign io_time = logic_time;
  assign when_BusSlaveFactory_l1041 = io_bus_cmd_payload_fragment_mask[0];
  assign when_BmbSlaveFactory_l77 = ((io_bus_cmd_payload_fragment_address & (~ 16'h0003)) == 16'hbff8);
  assign when_BmbSlaveFactory_l77_1 = ((io_bus_cmd_payload_fragment_address & (~ 16'h0003)) == 16'hbffc);
  assign when_BmbSlaveFactory_l77_2 = ((io_bus_cmd_payload_fragment_address & (~ 16'h0003)) == 16'h4000);
  assign when_BusSlaveFactory_l1041_1 = io_bus_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_2 = io_bus_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_3 = io_bus_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_4 = io_bus_cmd_payload_fragment_mask[3];
  assign when_BmbSlaveFactory_l77_3 = ((io_bus_cmd_payload_fragment_address & (~ 16'h0003)) == 16'h4004);
  assign when_BusSlaveFactory_l1041_5 = io_bus_cmd_payload_fragment_mask[0];
  assign when_BusSlaveFactory_l1041_6 = io_bus_cmd_payload_fragment_mask[1];
  assign when_BusSlaveFactory_l1041_7 = io_bus_cmd_payload_fragment_mask[2];
  assign when_BusSlaveFactory_l1041_8 = io_bus_cmd_payload_fragment_mask[3];
  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      _zz_io_bus_rsp_valid_1 <= 1'b0;
      logic_time <= 64'h0;
      logic_harts_0_softwareInterrupt <= 1'b0;
    end else begin
      if(_zz_factory_rsp_ready_1) begin
        _zz_io_bus_rsp_valid_1 <= (factory_rsp_valid && _zz_factory_rsp_ready);
      end
      if(when_Clint_l39) begin
        logic_time <= (logic_time + 64'h0000000000000001);
      end
      case(io_bus_cmd_payload_fragment_address)
        16'h0 : begin
          if(factory_doWrite) begin
            if(when_BusSlaveFactory_l1041) begin
              logic_harts_0_softwareInterrupt <= io_bus_cmd_payload_fragment_data[0];
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(_zz_factory_rsp_ready_1) begin
      _zz_io_bus_rsp_payload_last <= factory_rsp_payload_last;
      _zz_io_bus_rsp_payload_fragment_opcode <= factory_rsp_payload_fragment_opcode;
      _zz_io_bus_rsp_payload_fragment_data <= factory_rsp_payload_fragment_data;
    end
    logic_harts_0_timerInterrupt <= (logic_harts_0_cmp <= logic_time);
    if(when_BmbSlaveFactory_l77_2) begin
      if(factory_doWrite) begin
        if(when_BusSlaveFactory_l1041_1) begin
          logic_harts_0_cmp[7 : 0] <= io_bus_cmd_payload_fragment_data[7 : 0];
        end
        if(when_BusSlaveFactory_l1041_2) begin
          logic_harts_0_cmp[15 : 8] <= io_bus_cmd_payload_fragment_data[15 : 8];
        end
        if(when_BusSlaveFactory_l1041_3) begin
          logic_harts_0_cmp[23 : 16] <= io_bus_cmd_payload_fragment_data[23 : 16];
        end
        if(when_BusSlaveFactory_l1041_4) begin
          logic_harts_0_cmp[31 : 24] <= io_bus_cmd_payload_fragment_data[31 : 24];
        end
      end
    end
    if(when_BmbSlaveFactory_l77_3) begin
      if(factory_doWrite) begin
        if(when_BusSlaveFactory_l1041_5) begin
          logic_harts_0_cmp[39 : 32] <= io_bus_cmd_payload_fragment_data[7 : 0];
        end
        if(when_BusSlaveFactory_l1041_6) begin
          logic_harts_0_cmp[47 : 40] <= io_bus_cmd_payload_fragment_data[15 : 8];
        end
        if(when_BusSlaveFactory_l1041_7) begin
          logic_harts_0_cmp[55 : 48] <= io_bus_cmd_payload_fragment_data[23 : 16];
        end
        if(when_BusSlaveFactory_l1041_8) begin
          logic_harts_0_cmp[63 : 56] <= io_bus_cmd_payload_fragment_data[31 : 24];
        end
      end
    end
  end


endmodule

module SystemDebugger (
  input  wire          io_remote_cmd_valid,
  output wire          io_remote_cmd_ready,
  input  wire          io_remote_cmd_payload_last,
  input  wire [0:0]    io_remote_cmd_payload_fragment,
  output wire          io_remote_rsp_valid,
  input  wire          io_remote_rsp_ready,
  output wire          io_remote_rsp_payload_error,
  output wire [31:0]   io_remote_rsp_payload_data,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [31:0]   io_mem_cmd_payload_data,
  output wire          io_mem_cmd_payload_wr,
  output wire [1:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [31:0]   io_mem_rsp_payload,
  input  wire          debugCd_external_clk,
  input  wire          debugCd_logic_outputReset
);

  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire                when_Fragment_l356;
  wire                when_Fragment_l359;
  wire       [66:0]   _zz_io_mem_cmd_payload_address;
  wire                io_mem_cmd_isStall;
  wire                when_Fragment_l382;

  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign when_Fragment_l356 = (dispatcher_headerLoaded == 1'b0);
  assign when_Fragment_l359 = (dispatcher_counter == 3'b111);
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_io_mem_cmd_payload_address = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_io_mem_cmd_payload_address[31 : 0];
  assign io_mem_cmd_payload_data = _zz_io_mem_cmd_payload_address[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_io_mem_cmd_payload_address[64];
  assign io_mem_cmd_payload_size = _zz_io_mem_cmd_payload_address[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_mem_cmd_isStall = (io_mem_cmd_valid && (! io_mem_cmd_ready));
  assign when_Fragment_l382 = ((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! io_mem_cmd_isStall));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @(posedge debugCd_external_clk or posedge debugCd_logic_outputReset) begin
    if(debugCd_logic_outputReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid) begin
        if(when_Fragment_l356) begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if(when_Fragment_l359) begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last) begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(when_Fragment_l382) begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(io_remote_cmd_valid) begin
      if(when_Fragment_l356) begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1'd1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1'd1);
      end
    end
  end


endmodule

module JtagBridgeNoTap (
  input  wire          io_ctrl_tdi,
  input  wire          io_ctrl_enable,
  input  wire          io_ctrl_capture,
  input  wire          io_ctrl_shift,
  input  wire          io_ctrl_update,
  input  wire          io_ctrl_reset,
  output wire          io_ctrl_tdo,
  output wire          io_remote_cmd_valid,
  input  wire          io_remote_cmd_ready,
  output wire          io_remote_cmd_payload_last,
  output wire [0:0]    io_remote_cmd_payload_fragment,
  input  wire          io_remote_rsp_valid,
  output wire          io_remote_rsp_ready,
  input  wire          io_remote_rsp_payload_error,
  input  wire [31:0]   io_remote_rsp_payload_data,
  input  wire          debugCd_external_clk,
  input  wire          debugCd_logic_outputReset,
  input  wire          jtag_clk
);

  wire                flowCCUnsafeByToggle_1_io_output_valid;
  wire                flowCCUnsafeByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCUnsafeByToggle_1_io_output_payload_fragment;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  wire                system_cmd_toStream_valid;
  wire                system_cmd_toStream_ready;
  wire                system_cmd_toStream_payload_last;
  wire       [0:0]    system_cmd_toStream_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  wire                jtag_wrapper_ctrl_tdi;
  wire                jtag_wrapper_ctrl_enable;
  wire                jtag_wrapper_ctrl_capture;
  wire                jtag_wrapper_ctrl_shift;
  wire                jtag_wrapper_ctrl_update;
  wire                jtag_wrapper_ctrl_reset;
  reg                 jtag_wrapper_ctrl_tdo;
  reg        [1:0]    jtag_wrapper_header;
  wire       [1:0]    jtag_wrapper_headerNext;
  reg        [0:0]    jtag_wrapper_counter;
  reg                 jtag_wrapper_done;
  reg                 jtag_wrapper_sendCapture;
  reg                 jtag_wrapper_sendShift;
  reg                 jtag_wrapper_sendUpdate;
  wire                when_JtagTapInstructions_l183;
  wire                when_JtagTapInstructions_l186;
  wire                jtag_writeArea_ctrl_tdi;
  wire                jtag_writeArea_ctrl_enable;
  wire                jtag_writeArea_ctrl_capture;
  wire                jtag_writeArea_ctrl_shift;
  wire                jtag_writeArea_ctrl_update;
  wire                jtag_writeArea_ctrl_reset;
  wire                jtag_writeArea_ctrl_tdo;
  wire                jtag_writeArea_source_valid;
  wire                jtag_writeArea_source_payload_last;
  wire       [0:0]    jtag_writeArea_source_payload_fragment;
  reg                 jtag_writeArea_valid;
  reg                 jtag_writeArea_data;
  wire                when_JtagTapInstructions_l209;
  wire                jtag_readArea_ctrl_tdi;
  wire                jtag_readArea_ctrl_enable;
  wire                jtag_readArea_ctrl_capture;
  wire                jtag_readArea_ctrl_shift;
  wire                jtag_readArea_ctrl_update;
  wire                jtag_readArea_ctrl_reset;
  wire                jtag_readArea_ctrl_tdo;
  reg        [33:0]   jtag_readArea_full_shifter;
  wire                when_JtagTapInstructions_l209_1;

  FlowCCUnsafeByToggle flowCCUnsafeByToggle_1 (
    .io_input_valid             (jtag_writeArea_source_valid                      ), //i
    .io_input_payload_last      (jtag_writeArea_source_payload_last               ), //i
    .io_input_payload_fragment  (jtag_writeArea_source_payload_fragment           ), //i
    .io_output_valid            (flowCCUnsafeByToggle_1_io_output_valid           ), //o
    .io_output_payload_last     (flowCCUnsafeByToggle_1_io_output_payload_last    ), //o
    .io_output_payload_fragment (flowCCUnsafeByToggle_1_io_output_payload_fragment), //o
    .jtag_clk                   (jtag_clk                                         ), //i
    .debugCd_external_clk       (debugCd_external_clk                             ), //i
    .debugCd_logic_outputReset  (debugCd_logic_outputReset                        )  //i
  );
  assign system_cmd_toStream_valid = system_cmd_valid;
  assign system_cmd_toStream_payload_last = system_cmd_payload_last;
  assign system_cmd_toStream_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_cmd_valid = system_cmd_toStream_valid;
  assign system_cmd_toStream_ready = io_remote_cmd_ready;
  assign io_remote_cmd_payload_last = system_cmd_toStream_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_toStream_payload_fragment;
  assign io_remote_rsp_fire = (io_remote_rsp_valid && io_remote_rsp_ready);
  assign io_remote_rsp_ready = 1'b1;
  assign jtag_wrapper_headerNext = ({jtag_wrapper_ctrl_tdi,jtag_wrapper_header} >>> 1'd1);
  always @(*) begin
    jtag_wrapper_sendCapture = 1'b0;
    if(jtag_wrapper_ctrl_enable) begin
      if(jtag_wrapper_ctrl_shift) begin
        if(when_JtagTapInstructions_l183) begin
          if(when_JtagTapInstructions_l186) begin
            jtag_wrapper_sendCapture = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    jtag_wrapper_sendShift = 1'b0;
    if(jtag_wrapper_ctrl_enable) begin
      if(jtag_wrapper_ctrl_shift) begin
        if(!when_JtagTapInstructions_l183) begin
          jtag_wrapper_sendShift = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    jtag_wrapper_sendUpdate = 1'b0;
    if(jtag_wrapper_ctrl_enable) begin
      if(jtag_wrapper_ctrl_update) begin
        jtag_wrapper_sendUpdate = 1'b1;
      end
    end
  end

  assign when_JtagTapInstructions_l183 = (! jtag_wrapper_done);
  assign when_JtagTapInstructions_l186 = (jtag_wrapper_counter == 1'b1);
  always @(*) begin
    jtag_wrapper_ctrl_tdo = 1'b0;
    if(when_JtagTapInstructions_l209) begin
      jtag_wrapper_ctrl_tdo = jtag_writeArea_ctrl_tdo;
    end
    if(when_JtagTapInstructions_l209_1) begin
      jtag_wrapper_ctrl_tdo = jtag_readArea_ctrl_tdo;
    end
  end

  assign jtag_wrapper_ctrl_tdi = io_ctrl_tdi;
  assign jtag_wrapper_ctrl_enable = io_ctrl_enable;
  assign jtag_wrapper_ctrl_capture = io_ctrl_capture;
  assign jtag_wrapper_ctrl_shift = io_ctrl_shift;
  assign jtag_wrapper_ctrl_update = io_ctrl_update;
  assign jtag_wrapper_ctrl_reset = io_ctrl_reset;
  assign io_ctrl_tdo = jtag_wrapper_ctrl_tdo;
  assign jtag_writeArea_source_valid = jtag_writeArea_valid;
  assign jtag_writeArea_source_payload_last = (! (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift));
  assign jtag_writeArea_source_payload_fragment[0] = jtag_writeArea_data;
  assign system_cmd_valid = flowCCUnsafeByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCUnsafeByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCUnsafeByToggle_1_io_output_payload_fragment;
  assign jtag_writeArea_ctrl_tdo = 1'b0;
  assign when_JtagTapInstructions_l209 = (jtag_wrapper_header == 2'b00);
  assign jtag_writeArea_ctrl_tdi = jtag_wrapper_ctrl_tdi;
  assign jtag_writeArea_ctrl_enable = 1'b1;
  assign jtag_writeArea_ctrl_capture = ((jtag_wrapper_headerNext == 2'b00) && jtag_wrapper_sendCapture);
  assign jtag_writeArea_ctrl_shift = (when_JtagTapInstructions_l209 && jtag_wrapper_sendShift);
  assign jtag_writeArea_ctrl_update = (when_JtagTapInstructions_l209 && jtag_wrapper_sendUpdate);
  assign jtag_writeArea_ctrl_reset = jtag_wrapper_ctrl_reset;
  assign jtag_readArea_ctrl_tdo = jtag_readArea_full_shifter[0];
  assign when_JtagTapInstructions_l209_1 = (jtag_wrapper_header == 2'b01);
  assign jtag_readArea_ctrl_tdi = jtag_wrapper_ctrl_tdi;
  assign jtag_readArea_ctrl_enable = 1'b1;
  assign jtag_readArea_ctrl_capture = ((jtag_wrapper_headerNext == 2'b01) && jtag_wrapper_sendCapture);
  assign jtag_readArea_ctrl_shift = (when_JtagTapInstructions_l209_1 && jtag_wrapper_sendShift);
  assign jtag_readArea_ctrl_update = (when_JtagTapInstructions_l209_1 && jtag_wrapper_sendUpdate);
  assign jtag_readArea_ctrl_reset = jtag_wrapper_ctrl_reset;
  always @(posedge debugCd_external_clk) begin
    if(io_remote_cmd_valid) begin
      system_rsp_valid <= 1'b0;
    end
    if(io_remote_rsp_fire) begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @(posedge jtag_clk) begin
    if(jtag_wrapper_ctrl_enable) begin
      if(jtag_wrapper_ctrl_capture) begin
        jtag_wrapper_done <= 1'b0;
        jtag_wrapper_counter <= 1'b0;
      end
      if(jtag_wrapper_ctrl_shift) begin
        if(when_JtagTapInstructions_l183) begin
          jtag_wrapper_counter <= (jtag_wrapper_counter + 1'b1);
          jtag_wrapper_header <= jtag_wrapper_headerNext;
          if(when_JtagTapInstructions_l186) begin
            jtag_wrapper_done <= 1'b1;
          end
        end
      end
    end
    jtag_writeArea_valid <= (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift);
    jtag_writeArea_data <= jtag_writeArea_ctrl_tdi;
    if(jtag_readArea_ctrl_enable) begin
      if(jtag_readArea_ctrl_capture) begin
        jtag_readArea_full_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(jtag_readArea_ctrl_shift) begin
        jtag_readArea_full_shifter <= ({jtag_readArea_ctrl_tdi,jtag_readArea_full_shifter} >>> 1'd1);
      end
    end
  end


endmodule

module BufferCC_1 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          debugCd_external_clk,
  input  wire          debugCd_logic_outputReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge debugCd_external_clk or posedge debugCd_logic_outputReset) begin
    if(debugCd_logic_outputReset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          debugCd_external_clk,
  input  wire          debugCd_external_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge debugCd_external_clk or posedge debugCd_external_reset) begin
    if(debugCd_external_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire          io_inputs_0_payload_last,
  input  wire [0:0]    io_inputs_0_payload_fragment_source,
  input  wire [0:0]    io_inputs_0_payload_fragment_opcode,
  input  wire [31:0]   io_inputs_0_payload_fragment_address,
  input  wire [5:0]    io_inputs_0_payload_fragment_length,
  input  wire [31:0]   io_inputs_0_payload_fragment_data,
  input  wire [3:0]    io_inputs_0_payload_fragment_mask,
  input  wire [0:0]    io_inputs_0_payload_fragment_context,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire          io_inputs_1_payload_last,
  input  wire [0:0]    io_inputs_1_payload_fragment_source,
  input  wire [0:0]    io_inputs_1_payload_fragment_opcode,
  input  wire [31:0]   io_inputs_1_payload_fragment_address,
  input  wire [5:0]    io_inputs_1_payload_fragment_length,
  input  wire [31:0]   io_inputs_1_payload_fragment_data,
  input  wire [3:0]    io_inputs_1_payload_fragment_mask,
  input  wire [0:0]    io_inputs_1_payload_fragment_context,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire          io_output_payload_last,
  output wire [0:0]    io_output_payload_fragment_source,
  output wire [0:0]    io_output_payload_fragment_opcode,
  output wire [31:0]   io_output_payload_fragment_address,
  output wire [5:0]    io_output_payload_fragment_length,
  output wire [31:0]   io_output_payload_fragment_data,
  output wire [3:0]    io_output_payload_fragment_mask,
  output wire [0:0]    io_output_payload_fragment_context,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                when_Stream_l671;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign when_Stream_l671 = (io_output_fire && io_output_payload_last);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_last = (maskRouted_0 ? io_inputs_0_payload_last : io_inputs_1_payload_last);
  assign io_output_payload_fragment_source = (maskRouted_0 ? io_inputs_0_payload_fragment_source : io_inputs_1_payload_fragment_source);
  assign io_output_payload_fragment_opcode = (maskRouted_0 ? io_inputs_0_payload_fragment_opcode : io_inputs_1_payload_fragment_opcode);
  assign io_output_payload_fragment_address = (maskRouted_0 ? io_inputs_0_payload_fragment_address : io_inputs_1_payload_fragment_address);
  assign io_output_payload_fragment_length = (maskRouted_0 ? io_inputs_0_payload_fragment_length : io_inputs_1_payload_fragment_length);
  assign io_output_payload_fragment_data = (maskRouted_0 ? io_inputs_0_payload_fragment_data : io_inputs_1_payload_fragment_data);
  assign io_output_payload_fragment_mask = (maskRouted_0 ? io_inputs_0_payload_fragment_mask : io_inputs_1_payload_fragment_mask);
  assign io_output_payload_fragment_context = (maskRouted_0 ? io_inputs_0_payload_fragment_context : io_inputs_1_payload_fragment_context);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(when_Stream_l671) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module DataCache (
  input  wire          io_cpu_execute_isValid,
  input  wire [31:0]   io_cpu_execute_address,
  output reg           io_cpu_execute_haltIt,
  input  wire          io_cpu_execute_args_wr,
  input  wire [1:0]    io_cpu_execute_args_size,
  input  wire          io_cpu_execute_args_isLrsc,
  input  wire          io_cpu_execute_args_isAmo,
  input  wire          io_cpu_execute_args_amoCtrl_swap,
  input  wire [2:0]    io_cpu_execute_args_amoCtrl_alu,
  input  wire          io_cpu_execute_args_totalyConsistent,
  output wire          io_cpu_execute_refilling,
  input  wire          io_cpu_memory_isValid,
  input  wire          io_cpu_memory_isStuck,
  output wire          io_cpu_memory_isWrite,
  input  wire [31:0]   io_cpu_memory_address,
  input  wire [31:0]   io_cpu_memory_mmuRsp_physicalAddress,
  input  wire          io_cpu_memory_mmuRsp_isIoAccess,
  input  wire          io_cpu_memory_mmuRsp_isPaging,
  input  wire          io_cpu_memory_mmuRsp_allowRead,
  input  wire          io_cpu_memory_mmuRsp_allowWrite,
  input  wire          io_cpu_memory_mmuRsp_allowExecute,
  input  wire          io_cpu_memory_mmuRsp_exception,
  input  wire          io_cpu_memory_mmuRsp_refilling,
  input  wire          io_cpu_memory_mmuRsp_bypassTranslation,
  input  wire          io_cpu_memory_mmuRsp_ways_0_sel,
  input  wire [31:0]   io_cpu_memory_mmuRsp_ways_0_physical,
  input  wire          io_cpu_memory_mmuRsp_ways_1_sel,
  input  wire [31:0]   io_cpu_memory_mmuRsp_ways_1_physical,
  input  wire          io_cpu_memory_mmuRsp_ways_2_sel,
  input  wire [31:0]   io_cpu_memory_mmuRsp_ways_2_physical,
  input  wire          io_cpu_memory_mmuRsp_ways_3_sel,
  input  wire [31:0]   io_cpu_memory_mmuRsp_ways_3_physical,
  input  wire          io_cpu_writeBack_isValid,
  input  wire          io_cpu_writeBack_isStuck,
  input  wire          io_cpu_writeBack_isFiring,
  input  wire          io_cpu_writeBack_isUser,
  output reg           io_cpu_writeBack_haltIt,
  output wire          io_cpu_writeBack_isWrite,
  input  wire [31:0]   io_cpu_writeBack_storeData,
  output reg  [31:0]   io_cpu_writeBack_data,
  input  wire [31:0]   io_cpu_writeBack_address,
  output wire          io_cpu_writeBack_mmuException,
  output wire          io_cpu_writeBack_unalignedAccess,
  output reg           io_cpu_writeBack_accessError,
  output wire          io_cpu_writeBack_keepMemRspData,
  input  wire          io_cpu_writeBack_fence_SW,
  input  wire          io_cpu_writeBack_fence_SR,
  input  wire          io_cpu_writeBack_fence_SO,
  input  wire          io_cpu_writeBack_fence_SI,
  input  wire          io_cpu_writeBack_fence_PW,
  input  wire          io_cpu_writeBack_fence_PR,
  input  wire          io_cpu_writeBack_fence_PO,
  input  wire          io_cpu_writeBack_fence_PI,
  input  wire [3:0]    io_cpu_writeBack_fence_FM,
  output wire          io_cpu_writeBack_exclusiveOk,
  output reg           io_cpu_redo,
  input  wire          io_cpu_flush_valid,
  output wire          io_cpu_flush_ready,
  input  wire          io_cpu_flush_payload_singleLine,
  input  wire [5:0]    io_cpu_flush_payload_lineId,
  output wire          io_cpu_writesPending,
  output reg           io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output reg           io_mem_cmd_payload_wr,
  output wire          io_mem_cmd_payload_uncached,
  output reg  [31:0]   io_mem_cmd_payload_address,
  output wire [31:0]   io_mem_cmd_payload_data,
  output wire [3:0]    io_mem_cmd_payload_mask,
  output reg  [2:0]    io_mem_cmd_payload_size,
  output wire          io_mem_cmd_payload_last,
  input  wire          io_mem_rsp_valid,
  input  wire          io_mem_rsp_payload_last,
  input  wire [31:0]   io_mem_rsp_payload_data,
  input  wire          io_mem_rsp_payload_error,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset
);

  wire                ways_0_data_wr_en;
  wire                ways_0_data_rd_en;
  reg        [21:0]   ways_0_tags_spinal_port0;
  wire       [31:0]   ways_0_data_rd_data;
  wire       [21:0]   _zz_ways_0_tags_port;
  wire       [31:0]   _zz_stageB_amo_addSub;
  wire       [31:0]   _zz_stageB_amo_addSub_1;
  wire       [31:0]   _zz_stageB_amo_addSub_2;
  wire       [31:0]   _zz_stageB_amo_addSub_3;
  wire       [31:0]   _zz_stageB_amo_addSub_4;
  wire       [1:0]    _zz_stageB_amo_addSub_5;
  wire       [0:0]    _zz_when;
  wire       [3:0]    _zz_loader_counter_valueNext;
  wire       [0:0]    _zz_loader_counter_valueNext_1;
  wire       [1:0]    _zz_loader_waysAllocator;
  reg                 _zz_wr_en;
  reg                 _zz_1;
  wire                haltCpu;
  reg                 tagsReadCmd_valid;
  reg        [5:0]    tagsReadCmd_payload;
  reg                 tagsWriteCmd_valid;
  reg        [0:0]    tagsWriteCmd_payload_way;
  reg        [5:0]    tagsWriteCmd_payload_address;
  reg                 tagsWriteCmd_payload_data_valid;
  reg                 tagsWriteCmd_payload_data_error;
  reg        [19:0]   tagsWriteCmd_payload_data_address;
  reg                 tagsWriteLastCmd_valid;
  reg        [0:0]    tagsWriteLastCmd_payload_way;
  reg        [5:0]    tagsWriteLastCmd_payload_address;
  reg                 tagsWriteLastCmd_payload_data_valid;
  reg                 tagsWriteLastCmd_payload_data_error;
  reg        [19:0]   tagsWriteLastCmd_payload_data_address;
  reg                 dataReadCmd_valid;
  reg        [9:0]    dataReadCmd_payload;
  reg                 dataWriteCmd_valid;
  reg        [0:0]    dataWriteCmd_payload_way;
  reg        [9:0]    dataWriteCmd_payload_address;
  reg        [31:0]   dataWriteCmd_payload_data;
  reg        [3:0]    dataWriteCmd_payload_mask;
  wire                _zz_ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_ways_0_tagsReadRsp_valid_1;
  wire       [31:0]   ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                when_DataCache_l645;
  wire                when_DataCache_l648;
  wire                when_DataCache_l667;
  wire                rspSync;
  wire                rspLast;
  reg                 memCmdSent;
  wire                io_mem_cmd_fire;
  wire                when_DataCache_l689;
  reg        [3:0]    _zz_stage0_mask;
  wire       [3:0]    stage0_mask;
  wire       [0:0]    stage0_dataColisions;
  wire       [0:0]    stage0_wayInvalidate;
  wire                when_DataCache_l776;
  reg                 stageA_request_wr;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_isLrsc;
  reg                 stageA_request_isAmo;
  reg                 stageA_request_amoCtrl_swap;
  reg        [2:0]    stageA_request_amoCtrl_alu;
  reg                 stageA_request_totalyConsistent;
  wire                when_DataCache_l776_1;
  reg        [3:0]    stageA_mask;
  wire       [0:0]    stageA_wayHits;
  wire                when_DataCache_l776_2;
  reg        [0:0]    stageA_wayInvalidate;
  wire                when_DataCache_l776_3;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [0:0]    _zz_stageA_dataColisions;
  wire       [0:0]    stageA_dataColisions;
  wire                when_DataCache_l827;
  reg                 stageB_request_wr;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_isLrsc;
  reg                 stageB_request_isAmo;
  reg                 stageB_request_amoCtrl_swap;
  reg        [2:0]    stageB_request_amoCtrl_alu;
  reg                 stageB_request_totalyConsistent;
  reg                 stageB_mmuRspFreeze;
  wire                when_DataCache_l829;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_isPaging;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_mmuRsp_bypassTranslation;
  reg                 stageB_mmuRsp_ways_0_sel;
  reg        [31:0]   stageB_mmuRsp_ways_0_physical;
  reg                 stageB_mmuRsp_ways_1_sel;
  reg        [31:0]   stageB_mmuRsp_ways_1_physical;
  reg                 stageB_mmuRsp_ways_2_sel;
  reg        [31:0]   stageB_mmuRsp_ways_2_physical;
  reg                 stageB_mmuRsp_ways_3_sel;
  reg        [31:0]   stageB_mmuRsp_ways_3_physical;
  wire                when_DataCache_l826;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  wire                when_DataCache_l826_1;
  reg        [31:0]   stageB_dataReadRsp_0;
  wire                when_DataCache_l825;
  reg        [0:0]    stageB_wayInvalidate;
  wire                stageB_consistancyHazard;
  wire                when_DataCache_l825_1;
  reg        [0:0]    stageB_dataColisions;
  wire                when_DataCache_l825_2;
  reg                 stageB_unaligned;
  wire                when_DataCache_l825_3;
  reg        [0:0]    stageB_waysHitsBeforeInvalidate;
  wire       [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  wire                when_DataCache_l825_4;
  reg        [3:0]    stageB_mask;
  reg                 stageB_loaderValid;
  wire       [31:0]   stageB_ioMemRspMuxed;
  reg                 stageB_flusher_waitDone;
  wire                stageB_flusher_hold;
  reg        [6:0]    stageB_flusher_counter;
  wire                when_DataCache_l855;
  wire                when_DataCache_l861;
  wire                when_DataCache_l863;
  reg                 stageB_flusher_start;
  wire                when_DataCache_l877;
  reg                 stageB_lrSc_reserved;
  wire                when_DataCache_l885;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  reg        [31:0]   stageB_requestDataBypass;
  wire                stageB_amo_compare;
  wire                stageB_amo_unsigned;
  wire       [31:0]   stageB_amo_addSub;
  wire                stageB_amo_less;
  wire                stageB_amo_selectRf;
  wire       [2:0]    switch_Misc_l241;
  reg        [31:0]   stageB_amo_result;
  reg        [31:0]   stageB_amo_resultReg;
  reg                 stageB_amo_internal_resultRegValid;
  reg                 stageB_cpuWriteToCache;
  wire                when_DataCache_l931;
  wire                stageB_badPermissions;
  wire                stageB_loadStoreFault;
  wire                stageB_bypassCache;
  wire                when_DataCache_l1000;
  wire                when_DataCache_l1004;
  wire                when_DataCache_l1009;
  wire                when_DataCache_l1014;
  wire                when_DataCache_l1017;
  wire                when_DataCache_l1025;
  wire                when_DataCache_l1030;
  wire                when_DataCache_l1037;
  wire                when_DataCache_l996;
  wire                when_DataCache_l1072;
  wire                when_DataCache_l1081;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  reg        [3:0]    loader_counter_valueNext;
  reg        [3:0]    loader_counter_value;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [0:0]    loader_waysAllocator;
  reg                 loader_error;
  wire                loader_kill;
  reg                 loader_killReg;
  wire                when_DataCache_l1097;
  wire                loader_done;
  wire                when_DataCache_l1125;
  reg                 loader_valid_regNext;
  wire                when_DataCache_l1129;
  wire                when_DataCache_l1132;
  reg [21:0] ways_0_tags [0:63];

  assign _zz_stageB_amo_addSub = ($signed(_zz_stageB_amo_addSub_1) + $signed(_zz_stageB_amo_addSub_4));
  assign _zz_stageB_amo_addSub_1 = ($signed(_zz_stageB_amo_addSub_2) + $signed(_zz_stageB_amo_addSub_3));
  assign _zz_stageB_amo_addSub_2 = io_cpu_writeBack_storeData[31 : 0];
  assign _zz_stageB_amo_addSub_3 = (stageB_amo_compare ? (~ stageB_dataMux[31 : 0]) : stageB_dataMux[31 : 0]);
  assign _zz_stageB_amo_addSub_5 = (stageB_amo_compare ? 2'b01 : 2'b00);
  assign _zz_stageB_amo_addSub_4 = {{30{_zz_stageB_amo_addSub_5[1]}}, _zz_stageB_amo_addSub_5};
  assign _zz_when = 1'b1;
  assign _zz_loader_counter_valueNext_1 = loader_counter_willIncrement;
  assign _zz_loader_counter_valueNext = {3'd0, _zz_loader_counter_valueNext_1};
  assign _zz_loader_waysAllocator = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_ways_0_tags_port = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @(posedge debugCd_external_clk) begin
    if(_zz_ways_0_tagsReadRsp_valid) begin
      ways_0_tags_spinal_port0 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(_zz_1) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  Ram_1w_1rs #(
    .wordCount      (1024      ),
    .wordWidth      (32        ),
    .clockCrossing  (1'b0      ),
    .technology     ("auto"    ),
    .readUnderWrite ("dontCare"),
    .wrAddressWidth (10        ),
    .wrDataWidth    (32        ),
    .wrMaskWidth    (4         ),
    .wrMaskEnable   (1'b1      ),
    .rdAddressWidth (10        ),
    .rdDataWidth    (32        )
  ) ways_0_data (
    .wr_clk  (debugCd_external_clk             ), //i
    .wr_en   (ways_0_data_wr_en                ), //i
    .wr_mask (dataWriteCmd_payload_mask[3:0]   ), //i
    .wr_addr (dataWriteCmd_payload_address[9:0]), //i
    .wr_data (dataWriteCmd_payload_data[31:0]  ), //i
    .rd_clk  (debugCd_external_clk             ), //i
    .rd_en   (ways_0_data_rd_en                ), //i
    .rd_addr (dataReadCmd_payload[9:0]         ), //i
    .rd_data (ways_0_data_rd_data[31:0]        )  //o
  );
  always @(*) begin
    _zz_wr_en = 1'b0;
    if(when_DataCache_l648) begin
      _zz_wr_en = 1'b1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_DataCache_l645) begin
      _zz_1 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_ways_0_tagsReadRsp_valid = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_ways_0_tagsReadRsp_valid_1 = ways_0_tags_spinal_port0;
  assign ways_0_tagsReadRsp_valid = _zz_ways_0_tagsReadRsp_valid_1[0];
  assign ways_0_tagsReadRsp_error = _zz_ways_0_tagsReadRsp_valid_1[1];
  assign ways_0_tagsReadRsp_address = _zz_ways_0_tagsReadRsp_valid_1[21 : 2];
  assign ways_0_dataReadRspMem = ways_0_data_rd_data;
  assign ways_0_dataReadRsp = ways_0_dataReadRspMem[31 : 0];
  assign when_DataCache_l645 = (tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]);
  assign when_DataCache_l648 = (dataWriteCmd_valid && dataWriteCmd_payload_way[0]);
  always @(*) begin
    tagsReadCmd_valid = 1'b0;
    if(when_DataCache_l667) begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsReadCmd_payload = 6'bxxxxxx;
    if(when_DataCache_l667) begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 6];
    end
  end

  always @(*) begin
    dataReadCmd_valid = 1'b0;
    if(when_DataCache_l667) begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataReadCmd_payload = 10'bxxxxxxxxxx;
    if(when_DataCache_l667) begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @(*) begin
    tagsWriteCmd_valid = 1'b0;
    if(when_DataCache_l855) begin
      tagsWriteCmd_valid = 1'b1;
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        tagsWriteCmd_valid = 1'b0;
      end
    end
    if(loader_done) begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_way = 1'bx;
    if(when_DataCache_l855) begin
      tagsWriteCmd_payload_way = 1'b1;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_address = 6'bxxxxxx;
    if(when_DataCache_l855) begin
      tagsWriteCmd_payload_address = stageB_flusher_counter[5:0];
    end
    if(loader_done) begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 6];
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(when_DataCache_l855) begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_data_valid = (! (loader_kill || loader_killReg));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_error = (loader_error || (io_mem_rsp_valid && io_mem_rsp_payload_error));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_address = 20'bxxxxxxxxxxxxxxxxxxxx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @(*) begin
    dataWriteCmd_valid = 1'b0;
    if(stageB_cpuWriteToCache) begin
      if(when_DataCache_l931) begin
        dataWriteCmd_valid = 1'b1;
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(when_DataCache_l1009) begin
            if(stageB_request_isAmo) begin
              if(when_DataCache_l1017) begin
                dataWriteCmd_valid = 1'b0;
              end
            end
            if(when_DataCache_l1030) begin
              dataWriteCmd_valid = 1'b0;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        dataWriteCmd_valid = 1'b0;
      end
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_address = 10'bxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 6],loader_counter_value};
    end
  end

  always @(*) begin
    dataWriteCmd_payload_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_mask = 4'b0000;
      if(_zz_when[0]) begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
    end
    if(when_DataCache_l1097) begin
      dataWriteCmd_payload_mask = 4'b1111;
    end
  end

  assign when_DataCache_l667 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  always @(*) begin
    io_cpu_execute_haltIt = 1'b0;
    if(when_DataCache_l855) begin
      io_cpu_execute_haltIt = 1'b1;
    end
  end

  assign rspSync = 1'b1;
  assign rspLast = 1'b1;
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign when_DataCache_l689 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    _zz_stage0_mask = 4'bxxxx;
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_stage0_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_stage0_mask = 4'b0011;
      end
      2'b10 : begin
        _zz_stage0_mask = 4'b1111;
      end
      default : begin
      end
    endcase
  end

  assign stage0_mask = (_zz_stage0_mask <<< io_cpu_execute_address[1 : 0]);
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_execute_address[11 : 2])) && ((stage0_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign when_DataCache_l776 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l776_1 = (! io_cpu_memory_isStuck);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_wayHits = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign when_DataCache_l776_2 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l776_3 = (! io_cpu_memory_isStuck);
  assign _zz_stageA_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_memory_address[11 : 2])) && ((stageA_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stageA_dataColisions = (stage0_dataColisions_regNextWhen | _zz_stageA_dataColisions);
  assign when_DataCache_l827 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_mmuRspFreeze = 1'b0;
    if(when_DataCache_l1132) begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign when_DataCache_l829 = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign when_DataCache_l826 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l826_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l825 = (! io_cpu_writeBack_isStuck);
  assign stageB_consistancyHazard = 1'b0;
  assign when_DataCache_l825_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l825_2 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l825_3 = (! io_cpu_writeBack_isStuck);
  assign stageB_waysHits = (stageB_waysHitsBeforeInvalidate & (~ stageB_wayInvalidate));
  assign stageB_waysHit = (|stageB_waysHits);
  assign stageB_dataMux = stageB_dataReadRsp_0;
  assign when_DataCache_l825_4 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(!when_DataCache_l1009) begin
            if(io_mem_cmd_ready) begin
              stageB_loaderValid = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        stageB_loaderValid = 1'b0;
      end
    end
  end

  assign stageB_ioMemRspMuxed = io_mem_rsp_payload_data[31 : 0];
  always @(*) begin
    io_cpu_writeBack_haltIt = 1'b1;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l996) begin
          if(when_DataCache_l1000) begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
          if(when_DataCache_l1004) begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(when_DataCache_l1009) begin
            if(when_DataCache_l1014) begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
            if(stageB_request_isAmo) begin
              if(when_DataCache_l1017) begin
                io_cpu_writeBack_haltIt = 1'b1;
              end
            end
            if(when_DataCache_l1030) begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        io_cpu_writeBack_haltIt = 1'b0;
      end
    end
  end

  assign stageB_flusher_hold = 1'b0;
  assign when_DataCache_l855 = (! stageB_flusher_counter[6]);
  assign when_DataCache_l861 = (! stageB_flusher_hold);
  assign when_DataCache_l863 = (io_cpu_flush_valid && io_cpu_flush_payload_singleLine);
  assign io_cpu_flush_ready = (stageB_flusher_waitDone && stageB_flusher_counter[6]);
  assign when_DataCache_l877 = (io_cpu_flush_valid && io_cpu_flush_payload_singleLine);
  assign when_DataCache_l885 = (io_cpu_writeBack_isValid && io_cpu_writeBack_isFiring);
  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  always @(*) begin
    stageB_requestDataBypass = io_cpu_writeBack_storeData;
    if(stageB_request_isAmo) begin
      stageB_requestDataBypass[31 : 0] = stageB_amo_resultReg;
    end
  end

  assign stageB_amo_compare = stageB_request_amoCtrl_alu[2];
  assign stageB_amo_unsigned = (stageB_request_amoCtrl_alu[2 : 1] == 2'b11);
  assign stageB_amo_addSub = _zz_stageB_amo_addSub;
  assign stageB_amo_less = ((io_cpu_writeBack_storeData[31] == stageB_dataMux[31]) ? stageB_amo_addSub[31] : (stageB_amo_unsigned ? stageB_dataMux[31] : io_cpu_writeBack_storeData[31]));
  assign stageB_amo_selectRf = (stageB_request_amoCtrl_swap ? 1'b1 : (stageB_request_amoCtrl_alu[0] ^ stageB_amo_less));
  assign switch_Misc_l241 = (stageB_request_amoCtrl_alu | {stageB_request_amoCtrl_swap,2'b00});
  always @(*) begin
    case(switch_Misc_l241)
      3'b000 : begin
        stageB_amo_result = stageB_amo_addSub;
      end
      3'b001 : begin
        stageB_amo_result = (io_cpu_writeBack_storeData[31 : 0] ^ stageB_dataMux[31 : 0]);
      end
      3'b010 : begin
        stageB_amo_result = (io_cpu_writeBack_storeData[31 : 0] | stageB_dataMux[31 : 0]);
      end
      3'b011 : begin
        stageB_amo_result = (io_cpu_writeBack_storeData[31 : 0] & stageB_dataMux[31 : 0]);
      end
      default : begin
        stageB_amo_result = (stageB_amo_selectRf ? io_cpu_writeBack_storeData[31 : 0] : stageB_dataMux[31 : 0]);
      end
    endcase
  end

  always @(*) begin
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(when_DataCache_l1009) begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign when_DataCache_l931 = (stageB_request_wr && stageB_waysHit);
  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_request_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @(*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(when_DataCache_l1009) begin
            if(when_DataCache_l1025) begin
              io_cpu_redo = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1081) begin
        io_cpu_redo = 1'b1;
      end
    end
    if(when_DataCache_l1129) begin
      io_cpu_redo = 1'b1;
    end
  end

  always @(*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_bypassCache) begin
      io_cpu_writeBack_accessError = ((((! stageB_request_wr) && 1'b1) && io_mem_rsp_valid) && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = (((stageB_waysHits & stageB_tagsReadRsp_0_error) != 1'b0) || (stageB_loadStoreFault && (! stageB_mmuRsp_isPaging)));
    end
  end

  assign io_cpu_writeBack_mmuException = (stageB_loadStoreFault && stageB_mmuRsp_isPaging);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && stageB_unaligned);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @(*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l996) begin
          io_mem_cmd_valid = (! memCmdSent);
          if(when_DataCache_l1004) begin
            io_mem_cmd_valid = 1'b0;
          end
        end else begin
          if(when_DataCache_l1009) begin
            if(stageB_request_wr) begin
              io_mem_cmd_valid = 1'b1;
            end
            if(stageB_request_isAmo) begin
              if(when_DataCache_l1017) begin
                io_mem_cmd_valid = 1'b0;
              end
            end
            if(when_DataCache_l1025) begin
              io_mem_cmd_valid = 1'b0;
            end
            if(when_DataCache_l1030) begin
              io_mem_cmd_valid = 1'b0;
            end
          end else begin
            if(when_DataCache_l1037) begin
              io_mem_cmd_valid = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1072) begin
        io_mem_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    io_mem_cmd_payload_address = stageB_mmuRsp_physicalAddress;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(!when_DataCache_l1009) begin
            io_mem_cmd_payload_address[5 : 0] = 6'h0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_last = 1'b1;
  always @(*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(!when_DataCache_l1009) begin
            io_mem_cmd_payload_wr = 1'b0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  assign io_mem_cmd_payload_uncached = stageB_mmuRsp_isIoAccess;
  always @(*) begin
    io_mem_cmd_payload_size = {1'd0, stageB_request_size};
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l996) begin
          if(!when_DataCache_l1009) begin
            io_mem_cmd_payload_size = 3'b110;
          end
        end
      end
    end
  end

  assign stageB_bypassCache = ((stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc) || stageB_isExternalAmo);
  assign io_cpu_writeBack_keepMemRspData = 1'b0;
  assign when_DataCache_l1000 = ((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready);
  assign when_DataCache_l1004 = (stageB_request_isLrsc && (! stageB_lrSc_reserved));
  assign when_DataCache_l1009 = (stageB_waysHit || (stageB_request_wr && (! stageB_request_isAmo)));
  assign when_DataCache_l1014 = ((! stageB_request_wr) || io_mem_cmd_ready);
  assign when_DataCache_l1017 = (! stageB_amo_internal_resultRegValid);
  assign when_DataCache_l1025 = (((! stageB_request_wr) || stageB_request_isAmo) && ((stageB_dataColisions & stageB_waysHits) != 1'b0));
  assign when_DataCache_l1030 = (stageB_request_isLrsc && (! stageB_lrSc_reserved));
  assign when_DataCache_l1037 = (! memCmdSent);
  assign when_DataCache_l996 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  always @(*) begin
    if(stageB_bypassCache) begin
      io_cpu_writeBack_data = stageB_ioMemRspMuxed;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
  end

  assign io_cpu_writeBack_exclusiveOk = stageB_lrSc_reserved;
  assign when_DataCache_l1072 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign when_DataCache_l1081 = (stageB_mmuRsp_refilling || stageB_consistancyHazard);
  always @(*) begin
    loader_counter_willIncrement = 1'b0;
    if(when_DataCache_l1097) begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 4'b1111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @(*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_loader_counter_valueNext);
    if(loader_counter_willClear) begin
      loader_counter_valueNext = 4'b0000;
    end
  end

  assign loader_kill = 1'b0;
  assign when_DataCache_l1097 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign loader_done = loader_counter_willOverflow;
  assign when_DataCache_l1125 = (! loader_valid);
  assign when_DataCache_l1129 = (loader_valid && (! loader_valid_regNext));
  assign io_cpu_execute_refilling = loader_valid;
  assign when_DataCache_l1132 = (stageB_loaderValid || loader_valid);
  assign ways_0_data_wr_en = (_zz_wr_en && 1'b1);
  assign ways_0_data_rd_en = ((dataReadCmd_valid && (! io_cpu_memory_isStuck)) && 1'b1);
  always @(posedge debugCd_external_clk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if(when_DataCache_l776) begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_isLrsc <= io_cpu_execute_args_isLrsc;
      stageA_request_isAmo <= io_cpu_execute_args_isAmo;
      stageA_request_amoCtrl_swap <= io_cpu_execute_args_amoCtrl_swap;
      stageA_request_amoCtrl_alu <= io_cpu_execute_args_amoCtrl_alu;
      stageA_request_totalyConsistent <= io_cpu_execute_args_totalyConsistent;
    end
    if(when_DataCache_l776_1) begin
      stageA_mask <= stage0_mask;
    end
    if(when_DataCache_l776_2) begin
      stageA_wayInvalidate <= stage0_wayInvalidate;
    end
    if(when_DataCache_l776_3) begin
      stage0_dataColisions_regNextWhen <= stage0_dataColisions;
    end
    if(when_DataCache_l827) begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_size <= stageA_request_size;
      stageB_request_isLrsc <= stageA_request_isLrsc;
      stageB_request_isAmo <= stageA_request_isAmo;
      stageB_request_amoCtrl_swap <= stageA_request_amoCtrl_swap;
      stageB_request_amoCtrl_alu <= stageA_request_amoCtrl_alu;
      stageB_request_totalyConsistent <= stageA_request_totalyConsistent;
    end
    if(when_DataCache_l829) begin
      stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuRsp_physicalAddress;
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuRsp_isIoAccess;
      stageB_mmuRsp_isPaging <= io_cpu_memory_mmuRsp_isPaging;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuRsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuRsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuRsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuRsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuRsp_refilling;
      stageB_mmuRsp_bypassTranslation <= io_cpu_memory_mmuRsp_bypassTranslation;
      stageB_mmuRsp_ways_0_sel <= io_cpu_memory_mmuRsp_ways_0_sel;
      stageB_mmuRsp_ways_0_physical <= io_cpu_memory_mmuRsp_ways_0_physical;
      stageB_mmuRsp_ways_1_sel <= io_cpu_memory_mmuRsp_ways_1_sel;
      stageB_mmuRsp_ways_1_physical <= io_cpu_memory_mmuRsp_ways_1_physical;
      stageB_mmuRsp_ways_2_sel <= io_cpu_memory_mmuRsp_ways_2_sel;
      stageB_mmuRsp_ways_2_physical <= io_cpu_memory_mmuRsp_ways_2_physical;
      stageB_mmuRsp_ways_3_sel <= io_cpu_memory_mmuRsp_ways_3_sel;
      stageB_mmuRsp_ways_3_physical <= io_cpu_memory_mmuRsp_ways_3_physical;
    end
    if(when_DataCache_l826) begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if(when_DataCache_l826_1) begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if(when_DataCache_l825) begin
      stageB_wayInvalidate <= stageA_wayInvalidate;
    end
    if(when_DataCache_l825_1) begin
      stageB_dataColisions <= stageA_dataColisions;
    end
    if(when_DataCache_l825_2) begin
      stageB_unaligned <= (|{((stageA_request_size == 2'b10) && (io_cpu_memory_address[1 : 0] != 2'b00)),((stageA_request_size == 2'b01) && (io_cpu_memory_address[0 : 0] != 1'b0))});
    end
    if(when_DataCache_l825_3) begin
      stageB_waysHitsBeforeInvalidate <= stageA_wayHits;
    end
    if(when_DataCache_l825_4) begin
      stageB_mask <= stageA_mask;
    end
    stageB_amo_internal_resultRegValid <= io_cpu_writeBack_isStuck;
    stageB_amo_resultReg <= stageB_amo_result;
    loader_valid_regNext <= loader_valid;
  end

  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      memCmdSent <= 1'b0;
      stageB_flusher_waitDone <= 1'b0;
      stageB_flusher_counter <= 7'h0;
      stageB_flusher_start <= 1'b1;
      stageB_lrSc_reserved <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= 4'b0000;
      loader_waysAllocator <= 1'b1;
      loader_error <= 1'b0;
      loader_killReg <= 1'b0;
    end else begin
      if(io_mem_cmd_fire) begin
        memCmdSent <= 1'b1;
      end
      if(when_DataCache_l689) begin
        memCmdSent <= 1'b0;
      end
      if(io_cpu_flush_ready) begin
        stageB_flusher_waitDone <= 1'b0;
      end
      if(when_DataCache_l855) begin
        if(when_DataCache_l861) begin
          stageB_flusher_counter <= (stageB_flusher_counter + 7'h01);
          if(when_DataCache_l863) begin
            stageB_flusher_counter[6] <= 1'b1;
          end
        end
      end
      stageB_flusher_start <= (((((((! stageB_flusher_waitDone) && (! stageB_flusher_start)) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start) begin
        stageB_flusher_waitDone <= 1'b1;
        stageB_flusher_counter <= 7'h0;
        if(when_DataCache_l877) begin
          stageB_flusher_counter <= {1'b0,io_cpu_flush_payload_lineId};
        end
      end
      if(when_DataCache_l885) begin
        if(stageB_request_isLrsc) begin
          stageB_lrSc_reserved <= 1'b1;
        end
        if(stageB_request_wr) begin
          stageB_lrSc_reserved <= 1'b0;
        end
      end
      if(io_cpu_writeBack_isValid) begin
        if(when_DataCache_l1072) begin
          stageB_lrSc_reserved <= stageB_lrSc_reserved;
        end
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))); // DataCache.scala:L1084
        `else
          if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
            $display("ERROR writeBack stuck by another plugin is not allowed"); // DataCache.scala:L1084
          end
        `endif
      `endif
      if(stageB_loaderValid) begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(loader_kill) begin
        loader_killReg <= 1'b1;
      end
      if(when_DataCache_l1097) begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done) begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if(when_DataCache_l1125) begin
        loader_waysAllocator <= _zz_loader_waysAllocator[0:0];
      end
    end
  end


endmodule

module InstructionCache (
  input  wire          io_flush,
  input  wire          io_cpu_prefetch_isValid,
  output reg           io_cpu_prefetch_haltIt,
  input  wire [31:0]   io_cpu_prefetch_pc,
  input  wire          io_cpu_fetch_isValid,
  input  wire          io_cpu_fetch_isStuck,
  input  wire          io_cpu_fetch_isRemoved,
  input  wire [31:0]   io_cpu_fetch_pc,
  output wire [31:0]   io_cpu_fetch_data,
  input  wire [31:0]   io_cpu_fetch_mmuRsp_physicalAddress,
  input  wire          io_cpu_fetch_mmuRsp_isIoAccess,
  input  wire          io_cpu_fetch_mmuRsp_isPaging,
  input  wire          io_cpu_fetch_mmuRsp_allowRead,
  input  wire          io_cpu_fetch_mmuRsp_allowWrite,
  input  wire          io_cpu_fetch_mmuRsp_allowExecute,
  input  wire          io_cpu_fetch_mmuRsp_exception,
  input  wire          io_cpu_fetch_mmuRsp_refilling,
  input  wire          io_cpu_fetch_mmuRsp_bypassTranslation,
  input  wire          io_cpu_fetch_mmuRsp_ways_0_sel,
  input  wire [31:0]   io_cpu_fetch_mmuRsp_ways_0_physical,
  input  wire          io_cpu_fetch_mmuRsp_ways_1_sel,
  input  wire [31:0]   io_cpu_fetch_mmuRsp_ways_1_physical,
  input  wire          io_cpu_fetch_mmuRsp_ways_2_sel,
  input  wire [31:0]   io_cpu_fetch_mmuRsp_ways_2_physical,
  input  wire          io_cpu_fetch_mmuRsp_ways_3_sel,
  input  wire [31:0]   io_cpu_fetch_mmuRsp_ways_3_physical,
  output wire [31:0]   io_cpu_fetch_physicalAddress,
  input  wire          io_cpu_decode_isValid,
  input  wire          io_cpu_decode_isStuck,
  input  wire [31:0]   io_cpu_decode_pc,
  output wire [31:0]   io_cpu_decode_physicalAddress,
  output wire [31:0]   io_cpu_decode_data,
  output wire          io_cpu_decode_cacheMiss,
  output wire          io_cpu_decode_error,
  output wire          io_cpu_decode_mmuRefilling,
  output wire          io_cpu_decode_mmuException,
  input  wire          io_cpu_decode_isUser,
  input  wire          io_cpu_fill_valid,
  input  wire [31:0]   io_cpu_fill_payload,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [2:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [31:0]   io_mem_rsp_payload_data,
  input  wire          io_mem_rsp_payload_error,
  input  wire [2:0]    _zz_when_Fetcher_l411,
  input  wire [31:0]   _zz_io_cpu_fetch_data_regNextWhen,
  input  wire          debugCd_external_clk,
  input  wire          systemCd_logic_outputReset
);

  reg        [31:0]   banks_0_spinal_port1;
  reg        [21:0]   ways_0_tags_spinal_port1;
  wire       [21:0]   _zz_ways_0_tags_port;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [6:0]    lineLoader_flushCounter;
  wire                when_InstructionCache_l338;
  reg                 _zz_when_InstructionCache_l342;
  wire                when_InstructionCache_l342;
  wire                when_InstructionCache_l351;
  reg                 lineLoader_cmdSent;
  wire                io_mem_cmd_fire;
  wire                when_Utils_l578;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [3:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [5:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [19:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [9:0]    lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire                when_InstructionCache_l401;
  wire       [9:0]    _zz_fetchStage_read_banksValue_0_dataMem;
  wire                _zz_fetchStage_read_banksValue_0_dataMem_1;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [5:0]    _zz_fetchStage_read_waysValues_0_tag_valid;
  wire                _zz_fetchStage_read_waysValues_0_tag_valid_1;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [21:0]   _zz_fetchStage_read_waysValues_0_tag_valid_2;
  wire                fetchStage_hit_hits_0;
  wire                fetchStage_hit_valid;
  wire                fetchStage_hit_error;
  wire       [31:0]   fetchStage_hit_data;
  wire       [31:0]   fetchStage_hit_word;
  wire                when_InstructionCache_l435;
  reg        [31:0]   io_cpu_fetch_data_regNextWhen;
  wire                when_InstructionCache_l459;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_isPaging;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_mmuRsp_bypassTranslation;
  reg                 decodeStage_mmuRsp_ways_0_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_0_physical;
  reg                 decodeStage_mmuRsp_ways_1_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_1_physical;
  reg                 decodeStage_mmuRsp_ways_2_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_2_physical;
  reg                 decodeStage_mmuRsp_ways_3_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_3_physical;
  wire                when_InstructionCache_l459_1;
  reg                 decodeStage_hit_valid;
  wire                when_InstructionCache_l459_2;
  reg                 decodeStage_hit_error;
  wire                when_Fetcher_l411;
  reg [31:0] banks_0 [0:1023];
  reg [21:0] ways_0_tags [0:63];

  assign _zz_ways_0_tags_port = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @(posedge debugCd_external_clk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(_zz_fetchStage_read_banksValue_0_dataMem_1) begin
      banks_0_spinal_port1 <= banks_0[_zz_fetchStage_read_banksValue_0_dataMem];
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(_zz_fetchStage_read_waysValues_0_tag_valid_1) begin
      ways_0_tags_spinal_port1 <= ways_0_tags[_zz_fetchStage_read_waysValues_0_tag_valid];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid) begin
      if(when_InstructionCache_l401) begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @(*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(when_InstructionCache_l338) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(when_InstructionCache_l342) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign when_InstructionCache_l338 = (! lineLoader_flushCounter[6]);
  assign when_InstructionCache_l342 = (! _zz_when_InstructionCache_l342);
  assign when_InstructionCache_l351 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 6],6'h0};
  assign io_mem_cmd_payload_size = 3'b110;
  assign when_Utils_l578 = (! lineLoader_valid);
  always @(*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if(when_Utils_l578) begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[6]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[6] ? lineLoader_address[11 : 6] : lineLoader_flushCounter[5 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[6];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 6],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data[31 : 0];
  assign when_InstructionCache_l401 = (lineLoader_wordIndex == 4'b1111);
  assign _zz_fetchStage_read_banksValue_0_dataMem = io_cpu_prefetch_pc[11 : 2];
  assign _zz_fetchStage_read_banksValue_0_dataMem_1 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = banks_0_spinal_port1;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_fetchStage_read_waysValues_0_tag_valid = io_cpu_prefetch_pc[11 : 6];
  assign _zz_fetchStage_read_waysValues_0_tag_valid_1 = (! io_cpu_fetch_isStuck);
  assign _zz_fetchStage_read_waysValues_0_tag_valid_2 = ways_0_tags_spinal_port1;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_fetchStage_read_waysValues_0_tag_valid_2[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_fetchStage_read_waysValues_0_tag_valid_2[1];
  assign fetchStage_read_waysValues_0_tag_address = _zz_fetchStage_read_waysValues_0_tag_valid_2[21 : 2];
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuRsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_valid = (|fetchStage_hit_hits_0);
  assign fetchStage_hit_error = fetchStage_read_waysValues_0_tag_error;
  assign fetchStage_hit_data = fetchStage_read_banksValue_0_data;
  assign fetchStage_hit_word = fetchStage_hit_data;
  assign io_cpu_fetch_data = fetchStage_hit_word;
  assign when_InstructionCache_l435 = (! io_cpu_decode_isStuck);
  assign io_cpu_decode_data = io_cpu_fetch_data_regNextWhen;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign when_InstructionCache_l459 = (! io_cpu_decode_isStuck);
  assign when_InstructionCache_l459_1 = (! io_cpu_decode_isStuck);
  assign when_InstructionCache_l459_2 = (! io_cpu_decode_isStuck);
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  assign when_Fetcher_l411 = (_zz_when_Fetcher_l411 != 3'b000);
  always @(posedge debugCd_external_clk or posedge systemCd_logic_outputReset) begin
    if(systemCd_logic_outputReset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= 4'b0000;
    end else begin
      if(lineLoader_fire) begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire) begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid) begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush) begin
        lineLoader_flushPending <= 1'b1;
      end
      if(when_InstructionCache_l351) begin
        lineLoader_flushPending <= 1'b0;
      end
      if(io_mem_cmd_fire) begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire) begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid) begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 4'b0001);
        if(io_mem_rsp_payload_error) begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @(posedge debugCd_external_clk) begin
    if(io_cpu_fill_valid) begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(when_InstructionCache_l338) begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 7'h01);
    end
    _zz_when_InstructionCache_l342 <= lineLoader_flushCounter[6];
    if(when_InstructionCache_l351) begin
      lineLoader_flushCounter <= 7'h0;
    end
    if(when_InstructionCache_l435) begin
      io_cpu_fetch_data_regNextWhen <= io_cpu_fetch_data;
    end
    if(when_InstructionCache_l459) begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuRsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuRsp_isIoAccess;
      decodeStage_mmuRsp_isPaging <= io_cpu_fetch_mmuRsp_isPaging;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuRsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuRsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuRsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuRsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuRsp_refilling;
      decodeStage_mmuRsp_bypassTranslation <= io_cpu_fetch_mmuRsp_bypassTranslation;
      decodeStage_mmuRsp_ways_0_sel <= io_cpu_fetch_mmuRsp_ways_0_sel;
      decodeStage_mmuRsp_ways_0_physical <= io_cpu_fetch_mmuRsp_ways_0_physical;
      decodeStage_mmuRsp_ways_1_sel <= io_cpu_fetch_mmuRsp_ways_1_sel;
      decodeStage_mmuRsp_ways_1_physical <= io_cpu_fetch_mmuRsp_ways_1_physical;
      decodeStage_mmuRsp_ways_2_sel <= io_cpu_fetch_mmuRsp_ways_2_sel;
      decodeStage_mmuRsp_ways_2_physical <= io_cpu_fetch_mmuRsp_ways_2_physical;
      decodeStage_mmuRsp_ways_3_sel <= io_cpu_fetch_mmuRsp_ways_3_sel;
      decodeStage_mmuRsp_ways_3_physical <= io_cpu_fetch_mmuRsp_ways_3_physical;
    end
    if(when_InstructionCache_l459_1) begin
      decodeStage_hit_valid <= fetchStage_hit_valid;
    end
    if(when_InstructionCache_l459_2) begin
      decodeStage_hit_error <= fetchStage_hit_error;
    end
    if(when_Fetcher_l411) begin
      io_cpu_fetch_data_regNextWhen <= _zz_io_cpu_fetch_data_regNextWhen;
    end
  end


endmodule

module FlowCCUnsafeByToggle (
  input  wire          io_input_valid,
  input  wire          io_input_payload_last,
  input  wire [0:0]    io_input_payload_fragment,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [0:0]    io_output_payload_fragment,
  input  wire          jtag_clk,
  input  wire          debugCd_external_clk,
  input  wire          debugCd_logic_outputReset
);

  wire                inputArea_target_buffercc_io_dataOut;
  reg                 inputArea_target;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_m2sPipe_valid;
  (* async_reg = "true" *) reg                 outputArea_flow_m2sPipe_payload_last;
  (* async_reg = "true" *) reg        [0:0]    outputArea_flow_m2sPipe_payload_fragment;

  BufferCC_3 inputArea_target_buffercc (
    .io_dataIn                 (inputArea_target                    ), //i
    .io_dataOut                (inputArea_target_buffercc_io_dataOut), //o
    .debugCd_external_clk      (debugCd_external_clk                ), //i
    .debugCd_logic_outputReset (debugCd_logic_outputReset           )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    inputArea_target = $urandom;
    outputArea_hit = $urandom;
  `endif
  end

  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @(posedge jtag_clk) begin
    if(io_input_valid) begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @(posedge debugCd_external_clk) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge debugCd_external_clk or posedge debugCd_logic_outputReset) begin
    if(debugCd_logic_outputReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module BufferCC_3 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          debugCd_external_clk,
  input  wire          debugCd_logic_outputReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  initial begin
  `ifndef SYNTHESIS
    buffers_0 = $urandom;
    buffers_1 = $urandom;
  `endif
  end

  assign io_dataOut = buffers_1;
  always @(posedge debugCd_external_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule
