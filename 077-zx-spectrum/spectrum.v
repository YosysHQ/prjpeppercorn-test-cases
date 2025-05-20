`default_nettype none
module spectrum
(
  input         clk10_mhz,
  // Buttons
  input         btn,
  // Keyboard
  inout         ps2Clk,
  inout         ps2Data,
  output   [3:0]  red,
  output   [3:0]  green,
  output   [3:0]  blue,
  output          hSync,
  output          vSync
);

  
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
  wire          n_romCS;
  wire          n_ramCS;
  wire          n_kbdCS;
  wire          n_joyCS;
  
  reg [2:0]     border_color;
  wire          ula_we = ~cpuAddress[0] & ~n_IORQ & ~n_WR & n_M1;
  reg           old_ula_we;
  reg           sound;

  reg [2:0]     cpuClockCount;
  wire          cpuClock;
  wire          cpuClockEnable;

  wire [7:0] ramOut;
  // ===============================================================
  // System Clock generation
  // ===============================================================
  wire clk;

  pll pll_i (
    .clock_in(clk10_mhz),
    .clock_out(clk)
  );

  assign cpuClock = clk;
  // ===============================================================
  // Reset generation
  // ===============================================================
  reg [15:0] pwr_up_reset_counter = 0;
  wire       pwr_up_reset_n = &pwr_up_reset_counter;

  always @(posedge clk) begin
     if (!pwr_up_reset_n)
       pwr_up_reset_counter <= pwr_up_reset_counter + 1;
  end

  // ===============================================================
  // CPU
  // ===============================================================
  wire [15:0] pc;
  
  wire loading = 1'b0;

  wire n_hard_reset = pwr_up_reset_n & btn;

  tv80n cpu1 (
    .reset_n(n_hard_reset),
    //.clk(cpuClock), // turbo mode 28MHz
    .clk(cpuClockEnable), // normal mode 3.5MHz
    .wait_n(~loading),
    .int_n(n_INT),
    .nmi_n(1'b1),
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
  // Border color and sound
  // ===============================================================

  always @(posedge cpuClock) begin
    old_ula_we <= ula_we;

    if (ula_we && !old_ula_we) begin
      border_color <= cpuDataOut[2:0];
      sound <= cpuDataOut[4];
    end
  end

  // ===============================================================
  // RAM
  // ===============================================================
  wire [7:0] vidOut;
  wire [12:0] vga_addr;
  wire [7:0] attrOut;
  wire [12:0] attr_addr;

  dpram
  #(
    .MEM_INIT_FILE("spectrum48.mem")
  )
  ram48 (
    .clk_a(cpuClock),
    .we_a(!n_ramCS & !n_memWR),
    .addr_a(cpuAddress),
    .din_a(cpuDataOut),
    .dout_a(ramOut),
    .clk_b(clk_vga),
    .addr_b({3'b010, vga_addr}),
    .dout_b(vidOut)
  );

  // ===============================================================
  // Keyboard
  // ===============================================================
  wire [4:0]  key_data;
  wire [11:1] Fn;
  wire [2:0]  mod;
  wire [10:0] ps2_key;

    // Get PS/2 keyboard events
  ps2 ps2_kbd (
     .clk(clk),
     .ps2_clk(ps2Clk),
     .ps2_data(ps2Data),
     .ps2_key(ps2_key)
  );

  // Keyboard matrix
  keyboard the_keyboard (
    .reset(~n_hard_reset),
    .clk_sys(clk),
    .ps2_key(ps2_key),
    .addr(cpuAddress),
    .key_data(key_data),
    .Fn(Fn),
    .mod(mod)
  );

  // ===============================================================
  // VGA
  // ===============================================================
  wire clk_vga = clk;
  wire vga_de;

  video vga (
    .clk(clk_vga),
    .vga_r(red),
    .vga_g(green),
    .vga_b(blue),
    .vga_de(vga_de),
    .vga_hs(hSync),
    .vga_vs(vSync),
    .vga_addr(vga_addr),
    .vga_data(vidOut),
    .n_int(n_INT),
    .border_color(border_color)
  );

  // ===============================================================
  // MEMORY READ/WRITE LOGIC
  // ===============================================================

  assign n_ioWR = n_WR | n_IORQ;
  assign n_memWR = n_WR | n_MREQ;
  assign n_ioRD = n_RD | n_IORQ;
  assign n_memRD = n_RD | n_MREQ;

  // ===============================================================
  // Chip selects
  // ===============================================================

  assign n_kbdCS = cpuAddress[7:0] == 8'HFE && n_ioRD == 1'b0 ? 1'b0 : 1'b1;
  assign n_joyCS = cpuAddress[7:0] == 8'd31 && n_ioRD == 1'b0 ? 1'b0 : 1'b1; // kempston joystick
  assign n_romCS = cpuAddress[15:14] != 0;
  assign n_ramCS = !n_romCS;

  // ===============================================================
  // Memory decoding
  // ===============================================================

  assign cpuDataIn =  n_kbdCS == 1'b0 ? {3'b111, key_data} :
                      ramOut;

  // ===============================================================
  // CPU clock enable
  // ===============================================================
   
  always @(posedge cpuClock) begin
    cpuClockCount <= cpuClockCount + 1;
  end

  assign cpuClockEnable = cpuClockCount[2]; // 3.5Mhz
  
endmodule
