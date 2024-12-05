module top (
    input wire        clk,
    input wire        rst,
    // outputs
    output wire [7:0] led
);

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    reg [BITS+LOG2DELAY-1:0] counter = 0;
    reg [BITS-1:0] shift = 0;
    reg count_edge = 0;

    always @(posedge clk) begin
        counter <= counter + 1;

        if (counter[21] != count_edge) begin
            shift <= counter[28:25] * counter[24:21];
            count_edge <= counter[21];
        end
    end

    assign led = ~shift;

endmodule
