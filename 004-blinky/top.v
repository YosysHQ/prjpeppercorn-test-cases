module top (
    input  clk,
    output  wire led
);

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    reg [BITS+LOG2DELAY-1:0] counter = 0;

    always @(posedge clk) begin
        counter <= counter + 1;
    end

    assign led = counter[23];
endmodule

