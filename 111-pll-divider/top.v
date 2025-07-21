module top (
    input  clk,
    input  rst,
    // outputs
    output  wire  [7:0] led         // to LEDs
);

	wire clk_pix, clk_dvi, lock;
    pll pll_inst (
		.clock_in(clk),       //  10 MHz reference
		.clock_out(clk_pix),  //  25 MHz, 0 deg
		.clock_5x_out(clk_dvi), // 125 MHz, 0 deg
		.lock_out(lock)
	);

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    reg [BITS+LOG2DELAY-1:0] counter = 0;

    always @(posedge clk_pix) begin
        if (~rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    assign led = ~counter[28:21];
endmodule

