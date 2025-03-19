module top (
	input [7:0] DATA,
	input CLK,
	input EN,
	input RECFG,
	input VALID
);
    CC_CFG_CTRL cfg_ctrl_inst (
        .DATA(DATA),
        // Configuration data byte
        .CLK(CLK),
        // Configuration clock
        .EN(EN),
        // Enable signal
        .RECFG(RECFG), // Reconfigure-enable signal
        .VALID(VALID) // Data valid pulse signal
    );
endmodule
