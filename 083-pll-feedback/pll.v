`timescale 1ns / 1ps

module pll (
    input wire clk_i,
    input wire rst_i, // lock reset
    output wire led_o
);
    wire clk_o;
    wire usr_pll_lock_stdy;
    wire usr_pll_lock;

    wire clk270, clk180, clk90, clk0, usr_ref_out;

    CC_PLL #(
        .REF_CLK("10.0"),    // 10 MHz reference input
        .OUT_CLK("20.0"),    // 20 MHz PLL output -- must be multiple of ref_clk
        .LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
        .CI_FILTER_CONST(2), // optional CI filter constant
        .CP_FILTER_CONST(4)  // optional CP filter constant
    ) pll_inst (
        .CLK_REF(clk_i), .CLK_FEEDBACK(clk_buf), .USR_CLK_REF(1'b0),
        .USR_LOCKED_STDY_RST(!rst_i), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy), .USR_PLL_LOCKED(usr_pll_lock),
        .CLK270(clk270), .CLK180(clk180), .CLK90(clk90), .CLK0(clk0), .CLK_REF_OUT(usr_ref_out)
    );

    wire clk_buf;
    CC_BUFG clkbuf (
        .I(clk0),
        .O(clk_buf)
    );

    assign clk_o = clk_buf;
    assign led_o = counter[22];

    reg [26:0] counter = 0;
    always @(posedge clk_buf) begin
        counter <= counter + 1'b1;
    end

endmodule
