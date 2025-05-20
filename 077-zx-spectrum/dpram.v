module dpram (
  // Port A
  input            clk_a,
  input            we_a,
  input [15:0]     addr_a,
  input [7:0]      din_a,
  output reg [7:0] dout_a,
  // Port B
  input            clk_b,
  input [15:0]     addr_b,
  output reg [7:0] dout_b
);

  parameter MEM_INIT_FILE = "";
   
  reg [7:0] ram [0:65535];

  initial
    if (MEM_INIT_FILE != "")
      $readmemh(MEM_INIT_FILE, ram);
   
  always @(posedge clk_a) begin
    if (we_a)
      ram[addr_a] <= din_a;
    dout_a <= ram[addr_a];
  end

  always @(posedge clk_b) begin
    dout_b <= ram[addr_b];
  end

endmodule
