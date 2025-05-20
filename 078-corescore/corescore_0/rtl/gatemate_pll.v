module pll(input clki, 
    output locked,
    output clko
);
    wire clko_nobuf;
    CC_PLL #(
        .REF_CLK("10.0"),    // reference input in MHz
        .OUT_CLK("16.0"),    // pll output frequency in MHz
        .LOCK_REQ(0),        // 1: Lock status required before PLL output enable
                            // 0: PLL output before lock
        .PERF_MD("ECONOMY"), // LOWPOWER, ECONOMY, SPEED
        .LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
        .CI_FILTER_CONST(2), // optional CI filter constant
        .CP_FILTER_CONST(4)  // optional CP filter constant
    ) pll25 (
        .CLK_REF(clki), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
        .USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(),
        .USR_PLL_LOCKED(locked),
        .CLK270(), .CLK180(), .CLK90(), .CLK0(clko_nobuf), .CLK_REF_OUT()
    );
    CC_BUFG pll_bufg (.I(clko_nobuf), .O(clko));

endmodule
