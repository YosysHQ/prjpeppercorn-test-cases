module vgabuff(
  input clk,
  input [15:0] raddr,
  input [15:0] waddr,
  input we,
  input [11:0] pixout,
  input rclk,
  output reg [11:0] pixin
);

  //(16 * 640 * 480) / 96  -- do not know if this is correct
  reg [11:0] mem [0:64*1024];

  always @(posedge clk) begin
    if (we) begin
      mem[waddr] <= pixout;
    end
  end
  always @(posedge rclk) begin
      pixin <= mem[raddr];
  end

endmodule
