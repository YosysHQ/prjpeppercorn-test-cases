module gamerom (
  input            clk,
  input [14:0]     addr,
  output reg [7:0] dout,
);

  parameter MEM_INIT_FILE = "";
   
  reg [7:0] rom [0:32767];

  initial
    if (MEM_INIT_FILE != "")
      $readmemh(MEM_INIT_FILE, rom);
   
  always @(posedge clk) begin
    dout <= rom[addr];
  end
endmodule
