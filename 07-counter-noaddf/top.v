module top (
    input  clk,
    input  rst,
    // outputs
    output  wire  [7:0] led         // to LEDs
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

