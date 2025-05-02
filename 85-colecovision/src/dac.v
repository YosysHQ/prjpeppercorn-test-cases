// Simple 1st order sigma-delta DAC
// Ref.: https://www.fpga4fun.com/PWM_DAC_2.html

module dac #(
    parameter WIDTH = 8
) (
    input             rst_n,
    input             clk,
    input [WIDTH-1:0] value,
    output            pulse
);

    reg [WIDTH:0] accumulator;
    always @(posedge clk)
        if (!rst_n) begin
            accumulator <= '0;
        end else begin
            accumulator <= accumulator[WIDTH-1:0] + value;
        end

    assign pulse = accumulator[WIDTH];
endmodule
