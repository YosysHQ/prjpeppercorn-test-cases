`default_nettype none
module keymap (
  input clk,
  input [10:0] addr,
  output [7:0] dbi
);

  keyrom #(
    .MEM_INIT_FILE("../roms/keymap.mem")
  )
  key_rom (
    .clk(clk),
    .addr(addr[9:0]),
    .dout(dbi)
  );

endmodule

