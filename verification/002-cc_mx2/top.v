module top(input [1:0][1:0] d, input [1:0] s, output [1:0] y);

  genvar i;
  generate
    for (i = 0; i < 2; i = i + 1) begin : gen_mx2
      CC_MX2 mx2_inst (
        .D0(d[i][0]),
        .D1(d[i][1]),
        .S0(s[i]),
        .Y(y[i])
      );
    end
  endgenerate

endmodule
