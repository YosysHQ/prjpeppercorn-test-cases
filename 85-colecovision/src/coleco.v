`default_nettype none
module coleco
(
  input         clk10_mhz,
  // Buttons
  input   btn,
  // VGA 
  output wire   [3:0]  vga_red,
  output wire   [3:0]  vga_green,
  output wire   [3:0]  vga_blue,
  output wire          hSync,
  output wire          vSync,
  // Keyboard
  inout         ps2Clk,
  inout         ps2Data,
  // Audio
  //output [3:0]  audio_l,
  //output [3:0]  audio_r,
);

  wire   [7:0]  red;
  wire   [7:0]  green;
  wire   [7:0]  blue;

  // Port numbers
  wire [7:0] vdp_ctrl_port = 8'hbf;
  wire [7:0] vdp_data_port = 8'hbe;

  wire [7:0] psg_write_port = 8'hff;

  wire [7:0] ctrl_0_port = 8'hfc;
  wire [7:0] ctrl_1_port = 8'hff;
  wire [7:0] keypad_sel_port = 8'h80;
  wire [7:0] joystick_sel_port = 8'hc0;
  
  wire          n_WR;
  wire          n_RD;
  wire          n_INT;
  wire [15:0]   cpuAddress;
  wire [7:0]    cpuDataOut;
  wire [7:0]    cpuDataIn;
  wire          n_memWR;
  wire          n_memRD;
  wire          n_ioWR;
  wire          n_ioRD;
  wire          n_MREQ;
  wire          n_IORQ;
  wire          n_M1;
  wire          n_int;

  reg [3:0]     cpuClockCount;
  wire          cpuClockEnable;
  reg           cpuClockEnable1; 
  wire          cpuClockEdge = cpuClockEnable && !cpuClockEnable1;
  wire [7:0]    ramOut;
  wire [7:0]    romOut;

  // ===============================================================
  // System Clock generation
  // ===============================================================
  wire clk_vga;
  wire cpuClock;

  pll pll_i (
    .clock_in(clk10_mhz),
    .clock_out(clk_vga)
  );
  assign cpuClock = clk_vga;

  // ===============================================================
  // Reset generation
  // ===============================================================
  reg [15:0] pwr_up_reset_counter = 0;
  wire       pwr_up_reset_n = &pwr_up_reset_counter;

  always @(posedge cpuClock) begin
     if (!pwr_up_reset_n)
       pwr_up_reset_counter <= pwr_up_reset_counter + 1;
  end

  // ===============================================================
  // CPU
  // ===============================================================
  wire [15:0] pc;
  
  reg n_hard_reset;
  always @(posedge cpuClock)
    n_hard_reset <= pwr_up_reset_n & btn;

  wire [3:0] extra_keys;
  wire sound_ready;

  tv80n cpu1 (
    .reset_n(n_hard_reset),
    //.clk(cpuClock), // turbo mode 28MHz
    .clk(cpuClockEnable), // normal mode 3.5MHz
    .wait_n(!extra_keys[0]),
    .int_n(1'b1),
    .nmi_n(n_int),
    .busrq_n(1'b1),
    .mreq_n(n_MREQ),
    .m1_n(n_M1),
    .iorq_n(n_IORQ),
    .wr_n(n_WR),
    .rd_n(n_RD),
    .A(cpuAddress),
    .di(cpuDataIn),
    .do(cpuDataOut),
    .pc(pc)
  );

  // ===============================================================
  // RAM
  // ===============================================================
  ram #(
    .MEM_INIT_FILE("../roms/coleco.mem")
  )
  ram32 (
    .clk(cpuClock),
    //.we(cpuAddress[15:13] == 3 && !n_memWR),
    .we(!n_memWR),
    .addr(cpuAddress[14:0]),
    .din(cpuDataOut),
    .dout(ramOut)
  );

  // ===============================================================
  // GAME ROM
  // ===============================================================
  gamerom #(
    .MEM_INIT_FILE("../roms/donkey_kong.mem")
  ) 
  rom8 (
    .clk(cpuClock),
    .addr(cpuAddress[14:0]),
    .dout(romOut)
  );

  // ===============================================================
  // Keyboard
  // ===============================================================
  wire [10:0] ps2_key;

    // Get PS/2 keyboard events
  ps2 ps2_kbd (
    .clk(cpuClock),
    .ps2_clk(ps2Clk),
    .ps2_data(ps2Data),
    .ps2_key(ps2_key)
  );

  keypad pad (
    .clk(cpuClock),
    .reset(!n_hard_reset),
    .ps2_key(ps2_key),
    .key(key),
    .extra_keys(extra_keys)
  );

  // ===============================================================
  // VGA
  // ===============================================================
  wire        vga_de;
  wire [7:0]  vga_dout;
  reg  [13:0] vga_addr;
  wire        vga_wr = cpuAddress[7:0] == vdp_data_port && n_ioWR == 1'b0;
  wire        vga_rd = cpuAddress[7:0] == vdp_data_port && n_ioRD == 1'b0;
  reg         is_second_addr_byte = 0;
  reg [7:0]   first_addr_byte;
  reg [7:0]   r_vdp [0:7];
  wire [1:0]  mode = r_vdp[1][3] ? 3 : r_vdp[0][1] ? 2 : r_vdp[1][4] ? 0 : 1;
  wire [13:0] name_table_addr = r_vdp[2] * 1024;
  wire [13:0] color_table_addr = (mode == 2 ? r_vdp[3][7] * 16'h2000 : r_vdp[3] * 64);
  wire [13:0] font_addr = mode == 2 ? r_vdp[4][2] * 8192 : r_vdp[4] * 2048;
  wire [13:0] sprite_attr_addr = r_vdp[5] * 128;
  wire [13:0] sprite_pattern_table_addr = r_vdp[6] * 2048;
  wire [7:0]  vga_diag;
  reg         r_vga_rd;
  wire [4:0]  sprite5;
  wire        sprite_collision;
  wire        too_many_sprites;
  wire        interrupt_flag;
  reg         keypad;
  reg [3:0]   key;

  always @(posedge cpuClock) begin
    if (cpuClockEdge) begin
      if (cpuAddress[7:0] == keypad_sel_port && n_ioWR == 1'b0) keypad <= 1;
      if (cpuAddress[7:0] == joystick_sel_port && n_ioWR == 1'b0) keypad <= 0;
      // VDP interface
      if (vga_wr) vga_addr <= vga_addr + 1;
      // Increment address on CPU cycle after IO read
      r_vga_rd <= vga_rd;
      if (r_vga_rd && !vga_rd) vga_addr <= vga_addr + 1;

      if (cpuAddress[7:0] == vdp_ctrl_port && n_ioWR == 1'b0) begin
        is_second_addr_byte <= ~is_second_addr_byte;
	if (is_second_addr_byte) begin
          if (!cpuDataOut[7]) 
            vga_addr <=  {cpuDataOut[5:0], first_addr_byte};
          else if (cpuDataOut[5:0] < 8)
            r_vdp[cpuDataOut[5:0]] <= first_addr_byte;
        end else
          first_addr_byte <= cpuDataOut;
      end
    end
  end
      
  video vga (
    .clk(clk_vga),
    .reset(~n_hard_reset),
    .vga_r(red),
    .vga_g(green),
    .vga_b(blue),
    .vga_de(vga_de),
    .vga_hs(hSync),
    .vga_vs(vSync),
    .vga_addr(vga_addr),
    .vga_din(cpuDataOut),
    .vga_dout(vga_dout),
    .vga_wr(vga_wr && cpuClockEdge),
    .vga_rd(vga_rd && cpuClockEdge),
    .mode(mode),
    .cpu_clk(cpuClock),
    .font_addr(font_addr),
    .name_table_addr(name_table_addr),
    .color_table_addr(color_table_addr),
    .sprite_attr_addr(sprite_attr_addr),
    .sprite_pattern_table_addr(sprite_pattern_table_addr),
    .n_int(n_int),
    .video_on(r_vdp[1][6]),
    .text_color(r_vdp[7][7:4]),
    .back_color(r_vdp[7][3:0]),
    .sprite_large(r_vdp[1][1]),
    .sprite_enlarged(r_vdp[1][0]),
    .vert_retrace_int(r_vdp[1][5]),
    .sprite_collision(sprite_collision),
    .too_many_sprites(too_many_sprites),
    .sprite5(sprite5),
    .interrupt_flag(interrupt_flag),
    .diag(vga_diag)
  );

  assign vga_red = red[7:4];
  assign vga_green = green[7:4];
  assign vga_blue = blue[7:4];

  // ===============================================================
  // MEMORY READ/WRITE LOGIC
  // ===============================================================

  assign n_ioWR  = n_WR | n_IORQ;
  assign n_memWR = n_WR | n_MREQ;
  assign n_ioRD  = n_RD | n_IORQ;
  assign n_memRD = n_RD | n_MREQ;

  // ===============================================================
  // Memory decoding
  // ===============================================================

  reg  r_interrupt_flag, r_sprite_collision;
  reg  r_status_read;
  wire [7:0] status = {r_interrupt_flag, too_many_sprites, r_sprite_collision, (too_many_sprites ? sprite5 : 5'b11111)};
  wire [7:0] key_data = {4'b0010, ~key};
  wire [7:0] joy_data = {8'd0 };

  assign cpuDataIn =  cpuAddress[7:0] == vdp_data_port && n_ioRD == 1'b0 ? vga_dout :
                      cpuAddress[7:0] == vdp_ctrl_port && n_ioRD == 1'b0 ? status :
		      // Controllers 0 and 1
		      cpuAddress[7:0] == ctrl_0_port && n_ioRD == 1'b0 ? (keypad ? key_data : joy_data) :
		      cpuAddress[7:0] == ctrl_1_port && n_ioRD == 1'b0 ? (keypad ? key_data : joy_data) :
                      cpuAddress[15] && n_memRD == 1'b0          ? romOut : ramOut;

  always @(posedge cpuClock) begin
    if (!n_hard_reset) begin
      r_interrupt_flag <= 0;
      r_sprite_collision <= 0;
    end else begin
      if (interrupt_flag) r_interrupt_flag <= 1;
      if (sprite_collision) r_sprite_collision <= 1;
      if (cpuClockEdge) begin
        r_status_read <= cpuAddress[7:0] == vdp_ctrl_port && n_ioRD == 1'b0;
        if (r_status_read && !(cpuAddress[7:0] == vdp_ctrl_port && n_ioRD == 1'b0)) begin
          r_interrupt_flag <= 0;
          r_sprite_collision <= 0;
        end
      end
    end
  end
  
  // ===============================================================
  // CPU clock enable
  // ===============================================================
  
  always @(posedge cpuClock) begin
    cpuClockEnable1 <= cpuClockEnable;
    if(cpuClockCount == 6) // divide by 7: 25MHz/7 = 3.571MHz
      cpuClockCount <= 0;
    else
      cpuClockCount <= cpuClockCount + 1;
  end

  assign cpuClockEnable = cpuClockCount[2]; // 3.5Mhz

  // ===============================================================
  // Audio
  // ===============================================================
  //wire [15:0] sound_16;
  //wire audio_pulse;
//
  //dac #(
  //  .WIDTH(16)
  //) dac(
  //  .rst_n(n_hard_reset),
  //  .clk(cpuClock),
  //  .value(sound_16),
  //  .pulse(audio_pulse)
  //);
//
  //assign audio_l = {audio_pulse, 3'd0};
  //assign audio_r = audio_l;
//
  //sn76489 audio (
  //  .clk(cpuClock),
  //  .clk_en(cpuClockEnable),
  //  .reset(!n_hard_reset),
  //  .ce_n(1'b0),
  //  .we_n(!(cpuAddress[7:0] == psg_write_port && n_ioWR == 1'b0)),
  //  .ready(sound_ready),
  //  .d(cpuDataOut),
  //  .audio_out(sound_16)
  //);
endmodule
