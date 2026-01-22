`timescale 1ns / 1ps

module top (
  input         clk,
  input         wen,
  input   [8:0] addr,
  input  [31:0] wdata_a, wdata_b,
  output [31:0] rdata_a, rdata_b,
  output        ecc_1b_err_a, ecc_1b_err_b,
  output        ecc_2b_err_a, ecc_2b_err_b,
);

  CC_BRAM_40K #(
    .A_CLK_INV(1'b0),
    .A_DO_REG(1'b0),
    .A_ECC_EN(1'b1),
    .A_EN_INV(1'b0),
    .A_RD_WIDTH(40),
    .A_WE_INV(1'b0),
    .A_WR_MODE("NO_CHANGE"),
    .A_WR_WIDTH(40),
    .B_CLK_INV(1'b0),
    .B_DO_REG(1'b0),
    .B_ECC_EN(1'b1),
    .B_EN_INV(1'b0),
    .B_RD_WIDTH(40),
    .B_WE_INV(1'b0),
    .B_WR_MODE("NO_CHANGE"),
    .B_WR_WIDTH(40),
    .CAS("NONE"),
    .RAM_MODE("TDP")
  ) mem_top_l (
    .A_ADDR({addr, 7'b0}),
    .A_BM(40'hffffffffff),
    .A_CLK(clk),
    .A_DI(wdata_a),
    .A_DO(rdata_a),
    .A_EN(1'h1),
    .A_WE(wen),
    .A_ECC_1B_ERR(ecc_1b_err_a),
    .A_ECC_2B_ERR(ecc_2b_err_a),
    .B_ADDR({addr, 7'b0}),
    .B_BM(40'hffffffffff),
    .B_CLK(clk),
    .B_DI(wdata_b),
    .B_DO(rdata_b),
    .B_EN(1'h1),
    .B_WE(web),
    .B_ECC_1B_ERR(ecc_1b_err_b),
    .B_ECC_2B_ERR(ecc_2b_err_b)
  );

endmodule
