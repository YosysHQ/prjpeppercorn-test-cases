module top(input [3:0] i, output [11:0] o);
  genvar idx, j;
  generate
    for (idx = 0; idx < 4; idx = idx + 1) begin : gen_lut
      CC_LUT1 #(
        .INIT(idx[1:0])
      ) lut_inst (
        .I0(i[idx]),
        .O(o[idx])
      );
    end
  endgenerate

  generate
    for (idx = 0; idx < 4; idx = idx + 1) begin : gen_lut_const
      for (j = 0; j < 2; j = j + 1) begin : const_i_input
        CC_LUT1 #(
          .INIT(idx[1:0])
        ) lut_inst_const (
          .I0(j[0]),
          .O(o[4 + idx * 2 + j])
        );
      end
    end
  endgenerate
endmodule