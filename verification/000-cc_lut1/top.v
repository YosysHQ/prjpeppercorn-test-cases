module top(input [3:0] i, output [3:0] o);
  genvar idx;
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
endmodule