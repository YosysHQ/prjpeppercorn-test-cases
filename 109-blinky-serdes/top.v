module top (
    input  clk,
    input  rst,
    output clkout_p,
    output clkout_n,

    input clk_in,

    // outputs
    output  wire led
);

	CC_LVDS_OBUF #(
		.DELAY_OBF(0),
	) lvds_clk_out (
		.A(clk),
		.O_N(clkout_n),
		.O_P(clkout_p)
	);

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    reg [BITS+LOG2DELAY-1:0] counter = 0;

    always @(posedge clk_in) begin
        if (~rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    assign led = counter[21];
endmodule

