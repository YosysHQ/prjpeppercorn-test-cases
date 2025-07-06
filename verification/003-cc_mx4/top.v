module top(input [3:0][3:0] d, input [3:0][1:0] s, output [3:0] y);

  genvar j;
  generate
    for (j = 0; j < 4; j = j + 1) begin : gen_mx4
      CC_MX4 mx4_inst (
        .D0(d[j][0]),
        .D1(d[j][1]),
        .D2(d[j][2]),
        .D3(d[j][3]),
        .S0(s[j][0]),
        .S1(s[j][1]),
        .Y(y[j])
      );
    end
  endgenerate

endmodule
