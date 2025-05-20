module keyram (
  input            clk,
  input            we,
  input [7:0]     addr,
  input [7:0]      din,
  output reg [7:0] dout,
);

  parameter MEM_INIT_FILE = "";
   
  reg [7:0] ram [0:255];

  initial
    if (MEM_INIT_FILE != "")
      $readmemh(MEM_INIT_FILE, ram);
   
  always @(posedge clk) begin
    if (we)
      ram[addr] <= din;
    dout <= ram[addr];
  end

endmodule
