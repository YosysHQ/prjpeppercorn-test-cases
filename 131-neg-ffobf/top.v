module top(input clk25, input d, output q_neg, output q_pos);
  reg a, b;
  always @(negedge clk25) a <= d;
  always @(posedge clk25) b <= d;
  assign q_neg = a;
  assign q_pos = b;
endmodule
