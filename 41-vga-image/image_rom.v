module image_rom(
  input clk,
  input [14:0] addr,
  output [11:0] data_out
);

  reg [3:0] store[0:19200];
  initial
  begin
		$readmemh("david.mem", store);
  end
  wire [3:0] data;
  always @(posedge clk)
	  data <= store[addr];
  
  assign data_out = { data, data, data };
endmodule
