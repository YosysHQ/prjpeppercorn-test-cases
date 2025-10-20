`define USE_PLL

module top (
  input wire refclk,
  output wire recfg
);

  reg [24:0] rst_cnt = 0;
  wire rstn = &rst_cnt;
  assign recfg = rstn;

  wire clk;

`ifdef USE_PLL
  CC_PLL #(
    .REF_CLK("10.0"), // reference input in MHz
    .OUT_CLK("12.0"), // pll output frequency in MHz
  ) pll_inst (
      .CLK_REF(refclk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
      .USR_LOCKED_STDY_RST(1'b0), .CLK0(clk)
  );
`else
  assign clk = refclk;
`endif

  always @(posedge clk) begin
    rst_cnt <= rst_cnt + !rstn;
  end

  CC_CFG_CTRL cfg_ctrl_inst (
    .CLK(1'b0),
    .EN(1'b0),
    .DATA(8'b0),
    .RECFG(recfg), // used to trigger auto_read -- works only if primary config is read in spi active mode
    .VALID(1'b0)
  );

endmodule
