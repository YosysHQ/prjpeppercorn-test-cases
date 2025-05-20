`default_nettype none
module keypad (
  input clk,
  input reset,
  input [10:0] ps2_key,
  output reg [3:0] key,
  output reg [3:0] extra_keys
);

wire pressed = ~ps2_key[9];
wire [7:0]  code = ps2_key[7:0];
reg [15:0] keys;

always @(posedge clk) begin
  if (reset) begin
    keys <= 0;
    extra_keys <= 0;
  end else begin
    if (ps2_key[10] && !ps2_key[8]) begin // Non-extended key
      case (code)
        8'h36, 8'h74: keys[1]  <= pressed; // 6 
        8'h16, 8'h69: keys[2]  <= pressed; // 1
        8'h26, 8'h7a: keys[3]  <= pressed; // 3
        8'h46, 8'h7d: keys[4]  <= pressed; // 9
        8'h45, 8'h70: keys[5]  <= pressed; // 0
        8'h4e, 8'h7b: keys[6]  <= pressed; // - for *
        8'h1e, 8'h72: keys[8]  <= pressed; // 2
        8'h55:        keys[9]  <= pressed; // = for #
        8'h3d, 8'h6c: keys[10] <= pressed; // 7
        8'h2e, 8'h73: keys[12] <= pressed; // 5
        8'h25, 8'h6b: keys[13] <= pressed; // 4
        8'h3e, 8'h75: keys[14] <= pressed; // 8
	8'h77:  extra_keys[0]  <= pressed; // Num lock for pause cpu
      endcase
    end      
  end
end

integer i;
always @*begin
  key = 0;
  for(i=15;i>=0;i=i-1) begin
    if (keys[i]) key = i;
  end
end

endmodule

