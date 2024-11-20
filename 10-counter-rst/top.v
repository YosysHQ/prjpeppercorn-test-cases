module top (
    input  clk,
    // outputs
    output  wire  [7:0] led         // to LEDs
);

	wire rst;
	CC_USR_RSTN usr_rstn_inst (
   	    .USR_RSTN(rst) // reset signal to CPE array
    );

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    reg [BITS+LOG2DELAY-1:0] counter = 0;

    always @(posedge clk) begin
        if (~rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    assign led = ~counter[28:21];
endmodule

