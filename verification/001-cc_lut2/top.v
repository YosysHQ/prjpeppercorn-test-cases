module top(input [15:0][1:0] i, output [79:0] o);

  genvar idx, j;
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

  generate
    for (idx = 0; idx < 16; idx = idx + 1) begin : gen_lut2
      for (j = 0; j < 4; j = j + 1) begin : const_i_input
        CC_LUT2 #(
          .INIT(idx[3:0])
        ) lut_inst (
          .I0(j[0]),
          .I1(j[1]),
          .O(o[16 + idx * 4 + j])
        );
      end
    end
  endgenerate
endmodule