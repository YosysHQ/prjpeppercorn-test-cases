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
    wire next_bit;

    (* keep *)
    CC_MX4 mux (
        .S0(counter[24]),
        .S1(counter[25]),
        .D0(rst),
        .D1(~rst),
        .D2(counter[21]),
        .D3(~counter[22]),
        .Y(next_bit)
    );

    always @(posedge clk) begin
        counter <= counter + 1;

        if (counter[21] != count_edge) begin
            shift <= {shift[6:0], next_bit};
            count_edge <= counter[21];
        end
    end

    assign led = ~shift;

endmodule
