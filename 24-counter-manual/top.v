module top (
    input  rst,
    // outputs
    output  wire  [7:0] led         // to LEDs
);

    localparam BITS = 8;

    reg [BITS:0] counter = 0;

    always @(posedge rst) begin
        counter <= counter + 1;
    end

    assign led = ~counter[7:0];
endmodule

