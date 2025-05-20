module ram (
  input            clk,
  input            we,
  input [15:0]     addr,
  input [7:0]      din,
  output reg [7:0] dout,
);

  parameter MEM_INIT_FILE = "";
   
  reg [7:0] ram [0:65535];

  initial
    if (MEM_INIT_FILE != "")
      $readmemh(MEM_INIT_FILE, ram);
   
  always @(posedge clk) begin
    if (we)
      ram[addr] <= din;
    dout <= ram[addr];
  end

endmodule
