// 32-bit PSRAM controller test
// Copyright (c) 2025 Daniel Cliche
// SPDX-License-Identifier: BSD-3

`default_nettype none
module top(
    input CLK,
    output LED, // inverted
    input BUT,  // inverted
    output PSRAM_CSN,
    output PSRAM_SCLK,
    inout [7:0] PSRAM_DATA
);

    wire clk;
    wire locked;
    pll PLL(.clock_in(CLK),.clock_out(clk),.locked(locked));
    reg [3:0] reset_counter = 4'd0;
    always @(posedge clk) begin
        if (locked && !&reset_counter)
            reset_counter <= reset_counter + 4'd1;
    end

    wire rst = !BUT || !&reset_counter;

    reg led;
    assign LED = ~led;

    reg         psram_stb;
    reg         psram_we;
    reg  [23:0] psram_addr;
    reg  [31:0] psram_din;
    wire [31:0] psram_dout;
    wire        psram_busy;
    wire        psram_done;

    reg failure_detected;

    reg [19:0] success_counter = 20'd0;
    always @(posedge clk) begin
        led <= rst ? 1'b0 : failure_detected ? 1'b1 : success_counter[19];
    end

    integer state;

    always @(posedge clk) begin
        if (rst) begin
            state <= 0;
            psram_addr <= 24'd0;
            psram_din <= 32'h55555555;
            psram_we <= 1'b0;
            psram_stb <= 1'b0;
            failure_detected <= 1'b0;
            success_counter <= 20'd0;
        end else begin
            case (state)
                0: begin
                    if (!psram_busy)
                        state <= 1;
                end
                1: begin
                    // Write
                    psram_we <= 1'b1;
                    psram_stb <= 1'b1;
                    state <= 2;
                end
                2: begin
                    psram_stb <= 1'b0;
                    if (psram_done) begin
                        psram_we <= 1'b0;
                        state <= 3;
                    end
                end
                3: begin
                    // Read
                    psram_stb <= 1'b1;
                    state <= 4;
                end
                4: begin
                    psram_stb <= 1'b0;
                    if (psram_done) begin
                        if (psram_dout != psram_din) begin
                            failure_detected <= 1'b1;
                        end else begin
                            // Success!
                            psram_addr <= psram_addr + 24'd4;
                            psram_din <= psram_din + 32'd1;
                            success_counter <= success_counter + 20'd1;
                            state <= 1;
                        end
                    end
                end
            endcase
        end
    end

    psram psram(
        .i_clk(clk),
        .i_rst(rst),
        .i_stb(psram_stb),
        .i_we(psram_we),
        .i_addr(psram_addr),
        .i_din(psram_din),
        .o_dout(psram_dout),
        .o_busy(psram_busy),
        .o_done(psram_done),

        // Interface to PSRAM chips

        .o_psram_csn(PSRAM_CSN),
        .o_psram_sclk(PSRAM_SCLK),
        .io_psram_data(PSRAM_DATA)
    );
  
endmodule
