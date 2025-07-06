module top(input [15:0][1:0] i, output [15:0] o);

  genvar idx;
  generate
    for (idx = 0; idx < 16; idx = idx + 1) begin : gen_lut2
      CC_LUT2 #(
        .INIT(idx[3:0])
      ) lut_inst (
        .I0(i[idx][0]),
        .I1(i[idx][1]),
        .O(o[idx])
      );
    end
  endgenerate

endmodule