// 32-bit PSRAM controller
// Copyright (c) 2025 Daniel Cliche
// SPDX-License-Identifier: BSD-3

// This is an adaptation of the PSRAM controller from openCologne available here: https://github.com/chili-chips-ba/openCologne/blob/main/2.Simple--1--PSRAM/1.hw/psram.sv

module psram(

    // Interface to processor

    input               i_clk,
    input               i_rst,
    input               i_stb,
    input               i_we,
    input      [23:0]   i_addr,
    input      [31:0]   i_din,
    output reg [31:0]   o_dout,
    output reg          o_busy,
    output reg          o_done,

    // Interface to PSRAM chips

    output reg          o_psram_csn,
    output              o_psram_sclk,
    inout      [7:0]    io_psram_data
);

    localparam  RESET_JUST_NOW    = 6'd0,
                RESET_CLOCK_WAIT  = 6'd1,
                RESET_CLOCK_DONE  = 6'd2,
                MODE_SELECT_CMD_7 = 6'd3,
                MODE_CMD_6        = 6'd4,
                MODE_CMD_5        = 6'd5,
                MODE_CMD_4        = 6'd6,
                MODE_CMD_3        = 6'd7,
                MODE_CMD_2        = 6'd8,
                MODE_CMD_1        = 6'd9,
                MODE_CMD_0        = 6'd10,
                MODE_DESELECT     = 6'd11,
                IDLE              = 6'd12,
                READ_CMD_3_0      = 6'd13,
                READ_ADDR_23_20   = 6'd14,
                READ_ADDR_19_16   = 6'd15,
                READ_ADDR_15_12   = 6'd16,
                READ_ADDR_11_8    = 6'd17,
                READ_ADDR_7_4     = 6'd18,
                READ_ADDR_3_0     = 6'd19,
                READ_WAIT         = 6'd20,
                READ_DATA_31_24   = 6'd21,
                READ_DATA_23_16   = 6'd22,
                READ_DATA_15_8    = 6'd23,
                READ_DATA_7_0     = 6'd24,
                READ_DESELECT     = 6'd25,
                WRITE_CMD_3_0     = 6'd26,
                WRITE_ADDR_23_20  = 6'd27,
                WRITE_ADDR_19_16  = 6'd28,
                WRITE_ADDR_15_12  = 6'd29,
                WRITE_ADDR_11_8   = 6'd30,
                WRITE_ADDR_7_4    = 6'd31,
                WRITE_ADDR_3_0    = 6'd32,
                WRITE_DATA_31_24  = 6'd33,
                WRITE_DATA_23_16  = 6'd34,
                WRITE_DATA_15_8   = 6'd35,
                WRITE_DATA_7_0    = 6'd36,
                WRITE_DESELECT    = 6'd37;

    // The main clock (i_clk) here is 100 MHz, which ticks every
    // 10 nS. In order to wait 150 uS upon reset, we must count
    // at least 15000 ticks. So, we wait 20000, to be safe.
    reg [14:0] long_delay;

    reg [5:0]  state;
    reg [34:0] states_hit;

    reg [3:0] short_delay;
    reg       hold_clk_lo;
    reg [7:0] out_enable;
    reg [7:0] data_to_chip;

    assign o_psram_sclk = (hold_clk_lo ? 0 : ~i_clk);

    wire [23:0] addr = {1'b0, i_addr[23:1]};

    genvar i;
    generate
        for (i = 0; i < 8 ; i++) begin
            assign io_psram_data[i] = out_enable[i] ? data_to_chip[i] : 1'bz;
        end
    endgenerate

    always @(posedge i_clk) begin
        if (i_rst) begin
            // Reset the SPI machine
            long_delay <= 0;
            state <= RESET_JUST_NOW;
            o_busy <= 1;
            o_done <= 0;
            o_psram_csn <= 1; // deselect
            o_dout <= 0;
            hold_clk_lo <= 1;
            data_to_chip <= 8'd0;
            states_hit <= 0;
            out_enable <= 8'hFF;
        end else begin
            states_hit[state] <= 1;
            case (state)
                // Startup long_delay
                RESET_JUST_NOW: begin
                        if (long_delay == 19999)
                            state <= RESET_CLOCK_WAIT;
                        else
                            long_delay <= long_delay + 1;
                    end

                // Post-reset clock wait start
                RESET_CLOCK_WAIT: begin
                        hold_clk_lo <= 0;
                        state <= RESET_CLOCK_DONE;
                    end
                
                // Post-reset clock wait end
                RESET_CLOCK_DONE: begin
                        out_enable <= 8'h00;
                        state <= MODE_SELECT_CMD_7;
                    end

                // Entering QPI mode is done by command 35H
                // The command bits are sent 1-at-a-time, on both PSRAM chips
                MODE_SELECT_CMD_7: begin
                        o_psram_csn <= 0; // select
                        out_enable[0] <= 1;
                        out_enable[4] <= 1;
                        data_to_chip <= 8'h00;
                        state <= MODE_CMD_6;
                    end

                MODE_CMD_6: begin
                        data_to_chip <= 8'h00;
                        state <= MODE_CMD_5;
                    end

                MODE_CMD_5: begin
                        data_to_chip <= 8'hFF;
                        state <= MODE_CMD_4;
                    end

                MODE_CMD_4: begin
                        data_to_chip <= 8'hFF;
                        state <= MODE_CMD_3;
                    end

                MODE_CMD_3: begin
                        data_to_chip <= 8'h00;
                        state <= MODE_CMD_2;
                    end

                MODE_CMD_2: begin
                        data_to_chip <= 8'hFF;
                        state <= MODE_CMD_1;
                    end

                MODE_CMD_1: begin
                        data_to_chip <= 8'h00;
                        state <= MODE_CMD_0;
                    end

                MODE_CMD_0: begin
                        data_to_chip <= 8'hFF;
                        state <= MODE_DESELECT;
                    end

                MODE_DESELECT: begin
                        o_psram_csn <= 1; // deselect
                        out_enable <= 8'h00;
                        o_busy <= 0;
                        state <= IDLE;
                    end

                // Idle, awaiting command
                IDLE: begin
                        o_done <= 0;
                        if (i_stb) begin
                            if (i_we) begin
                                // A write to PSRAM is done by command 38H
                                // The command bits are sent 4-at-a-time, on both PSRAM chips
                                data_to_chip[3:0] <= 4'h3;
                                data_to_chip[7:4] <= 4'h3;
                                state <= WRITE_CMD_3_0;
                            end else begin
                                // A read from PSRAM is done by command EBH
                                // The command bits are sent 4-at-a-time, on both PSRAM chips
                                data_to_chip[3:0] <= 4'hE;
                                data_to_chip[7:4] <= 4'hE;
                                state <= READ_CMD_3_0;
                            end
                            o_psram_csn <= 0; // select
                            o_busy <= 1;
                            out_enable <= 8'hFF;
                        end
                    end

                READ_CMD_3_0: begin
                        data_to_chip[3:0] <= 4'hB;
                        data_to_chip[7:4] <= 4'hB;
                        state <= READ_ADDR_23_20;
                    end

                READ_ADDR_23_20: begin
                        data_to_chip[3:0] <= addr[23:20];
                        data_to_chip[7:4] <= addr[23:20];
                        state <= READ_ADDR_19_16;
                    end

                READ_ADDR_19_16: begin
                        data_to_chip[3:0] <= addr[19:16];
                        data_to_chip[7:4] <= addr[19:16];
                        state <= READ_ADDR_15_12;
                    end

                READ_ADDR_15_12: begin
                        data_to_chip[3:0] <= addr[15:12];
                        data_to_chip[7:4] <= addr[15:12];
                        state <= READ_ADDR_11_8;
                    end

                READ_ADDR_11_8: begin
                        data_to_chip[3:0] <= addr[11:8];
                        data_to_chip[7:4] <= addr[11:8];
                        state <= READ_ADDR_7_4;
                    end

                READ_ADDR_7_4: begin
                        data_to_chip[3:0] <= addr[7:4];
                        data_to_chip[7:4] <= addr[7:4];
                        state <= READ_ADDR_3_0;
                    end

                READ_ADDR_3_0: begin
                        data_to_chip[3:0] <= addr[3:0];
                        data_to_chip[7:4] <= addr[3:0];
                        short_delay <= 0;
                        state <= READ_WAIT;
                    end

                READ_WAIT: begin
                        out_enable <= 8'h00;
                        if (short_delay == 6)
                            state <= READ_DATA_31_24;
                        else
                            short_delay <= short_delay + 1;
                    end

                READ_DATA_31_24: begin
                        o_dout[31:24] <= io_psram_data;
                        state      <= READ_DATA_23_16;
                    end

                READ_DATA_23_16: begin
                        o_dout[23:16] <= io_psram_data;
                        state     <= READ_DATA_15_8;
                    end

                READ_DATA_15_8: begin
                        o_dout[15:8] <= io_psram_data;
                        state     <= READ_DATA_7_0;
                    end

                READ_DATA_7_0: begin
                        o_dout[7:0] <= io_psram_data;
                        state     <= READ_DESELECT;
                    end

                READ_DESELECT: begin
                        o_psram_csn <= 1; // deselect
                        o_busy <= 0;
                        o_done <= 1;
                        state <= IDLE;
                    end

                WRITE_CMD_3_0: begin
                        data_to_chip[3:0] <= 4'h8;
                        data_to_chip[7:4] <= 4'h8;
                        state <= WRITE_ADDR_23_20;
                    end

                WRITE_ADDR_23_20: begin
                        data_to_chip[3:0] <= addr[23:20];
                        data_to_chip[7:4] <= addr[23:20];
                        state <= WRITE_ADDR_19_16;
                    end

                WRITE_ADDR_19_16: begin
                        data_to_chip[3:0] <= addr[19:16];
                        data_to_chip[7:4] <= addr[19:16];
                        state <= WRITE_ADDR_15_12;
                    end

                WRITE_ADDR_15_12: begin
                        data_to_chip[3:0] <= addr[15:12];
                        data_to_chip[7:4] <= addr[15:12];
                        state <= WRITE_ADDR_11_8;
                    end

                WRITE_ADDR_11_8: begin
                        data_to_chip[3:0] <= addr[11:8];
                        data_to_chip[7:4] <= addr[11:8];
                        state <= WRITE_ADDR_7_4;
                    end

                WRITE_ADDR_7_4: begin
                        data_to_chip[3:0] <= addr[7:4];
                        data_to_chip[7:4] <= addr[7:4];
                        state <= WRITE_ADDR_3_0;
                    end

                WRITE_ADDR_3_0: begin
                        data_to_chip[3:0] <= addr[3:0];
                        data_to_chip[7:4] <= addr[3:0];
                        state <= WRITE_DATA_31_24;
                    end

                WRITE_DATA_31_24: begin
                        data_to_chip[7:0] <= i_din[31:24];
                        state <= WRITE_DATA_23_16;
                    end

                WRITE_DATA_23_16: begin
                        data_to_chip[7:0] <= i_din[23:16];
                        state <= WRITE_DATA_15_8;
                    end

                WRITE_DATA_15_8: begin
                        data_to_chip[7:0] <= i_din[15:8];
                        state <= WRITE_DATA_7_0;
                    end

                WRITE_DATA_7_0: begin
                        data_to_chip[7:0] <= i_din[7:0];
                        state <= WRITE_DESELECT;
                    end

                WRITE_DESELECT: begin
                        o_psram_csn <= 1; // deselect
                        out_enable <= 8'h00;
                        o_busy <= 0; // get this signal out a clock earlier
                        o_done <= 1;
                        state <= IDLE;
                    end
                default: state <= IDLE;
            endcase
        end
    end
endmodule
