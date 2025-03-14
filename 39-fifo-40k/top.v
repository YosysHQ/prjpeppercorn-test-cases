module uart_rx (
    input clk,
    input resetn,

    input  ser_rx,

    input  [31:0] cfg_divider,

    output [7:0]  data,
    output 	reg   valid
);

    reg [3:0] recv_state;
    reg [31:0] recv_divcnt;
    reg [7:0] recv_pattern;
    reg [7:0] recv_buf_data;

    assign data = valid ? recv_buf_data : ~0;

    always @(posedge clk) begin
        if (!resetn) begin
            recv_state <= 0;
            recv_divcnt <= 0;
            recv_pattern <= 0;
            recv_buf_data <= 0;
            valid <= 0;
        end else begin
            recv_divcnt <= recv_divcnt + 1;

            valid <= 0;

            case (recv_state)
                0: begin
                    if (!ser_rx)
                        recv_state <= 1;
                    recv_divcnt <= 0;
                end
                1: begin
                    if (2*recv_divcnt > cfg_divider) begin
                        recv_state <= 2;
                        recv_divcnt <= 0;
                    end
                end
                10: begin
                    if (recv_divcnt > cfg_divider) begin
                        recv_buf_data <= recv_pattern;
                        valid <= 1;
                        recv_state <= 0;
                    end
                end
                default: begin
                    if (recv_divcnt > cfg_divider) begin
                        recv_pattern <= {ser_rx, recv_pattern[7:1]};
                        recv_state <= recv_state + 1;
                        recv_divcnt <= 0;
                    end
                end
            endcase
        end
    end
endmodule

module uart_tx (
    input clk,
    input resetn,

    output ser_tx,

    input  [31:0] cfg_divider,

    input         data_we,
    input  [7:0]  data,
    output        data_wait
);
    reg [9:0] send_pattern;
    reg [3:0] send_bitcnt;
    reg [31:0] send_divcnt;

    assign data_wait = data_we && (send_bitcnt);

    assign ser_tx = send_pattern[0];

    always @(posedge clk) begin
        send_divcnt <= send_divcnt + 1;
        if (!resetn) begin
            send_pattern <= ~0;
            send_bitcnt <= 0;
            send_divcnt <= 0;
        end else begin
            if (data_we && !send_bitcnt) begin
                send_pattern <= {1'b1, data, 1'b0};
                send_bitcnt <= 10;
                send_divcnt <= 0;
            end else
            if (send_divcnt > cfg_divider && send_bitcnt) begin
                send_pattern <= {1'b1, send_pattern[9:1]};
                send_bitcnt <= send_bitcnt - 1;
                send_divcnt <= 0;
            end
        end
    end
endmodule

module top (
    input clk,
    output uart_tx,
    input uart_rx
);

    wire rx_valid;
    wire [7:0] uart_in;

    reg [5:0] reset_cnt = 0;
    wire resetn = &reset_cnt;

    always @(posedge clk) begin
        reset_cnt <= reset_cnt + !resetn;
    end

    localparam cfg_divider = 10000000 / 115200;

    uart_rx uart_receive (
        .clk(clk),
        .resetn(resetn),
        .ser_rx(uart_rx),
        .cfg_divider(cfg_divider),
        .data(uart_in),
        .valid(rx_valid)
    );

    uart_tx uart_transmit (
        .clk(clk),
        .resetn(resetn),
        .ser_tx(uart_tx),
        .cfg_divider(cfg_divider),
        .data(uart_out),
        .data_we(tx_valid)
    );

    // FIFO signals
    localparam tx_cycles = cfg_divider * 10;

    wire F_FULL, F_EMPTY;
    wire fifo_wr_en = rx_valid && ~F_FULL;
    wire [7:0] uart_out;

    wire tx_valid;
    reg [$clog2(tx_cycles - 1):0] tx_counter = 0;

    wire tx_ready = (tx_counter == 0);
    wire fifo_rd_en = ~F_EMPTY && tx_ready;
    assign tx_valid = fifo_rd_en;

    always @(posedge clk) begin
        if (~resetn) begin
            tx_counter <= 0;
        end else begin
            if (tx_valid) begin
                tx_counter <= tx_cycles - 1;
            end else if (tx_counter > 0) begin
                tx_counter <= tx_counter - 1;
            end
        end
    end

    CC_FIFO_40K #(
        .LOC("UNPLACED"),
        .ALMOST_EMPTY_OFFSET(15'h0),
        .ALMOST_FULL_OFFSET(15'h0),
        .A_WIDTH(8),
        .B_WIDTH(8),
        .RAM_MODE("TDP"),
        .FIFO_MODE("SYNC"),
        .A_CLK_INV(1'b0),
        .B_CLK_INV(1'b0),
        .A_EN_INV(1'b0),
        .B_EN_INV(1'b0),
        .A_WE_INV(1'b0),
        .B_WE_INV(1'b0),
        .A_DO_REG(1'b0),
        .B_DO_REG(1'b0),
        .A_ECC_EN(1'b0),
        .B_ECC_EN(1'b0)
    ) fifo_inst (
        .A_ECC_1B_ERR(),
        .B_ECC_1B_ERR(),
        .A_ECC_2B_ERR(),
        .B_ECC_2B_ERR(),
        .A_DO(uart_out),
        .B_DO(),
        .A_CLK(clk),
        .A_EN(fifo_rd_en),
        .A_DI(8'h0),
        .B_DI(uart_in),
        .A_BM(8'h0),
        .B_BM(8'hFF),
        .B_CLK(clk),
        .B_EN(fifo_wr_en),
        .B_WE(fifo_wr_en),
        .F_RST_N(resetn),
        .F_ALMOST_FULL_OFFSET(15'h0),
        .F_ALMOST_EMPTY_OFFSET(15'h0),
        .F_FULL(F_FULL),
        .F_EMPTY(F_EMPTY),
        .F_ALMOST_FULL(),
        .F_ALMOST_EMPTY(),
        .F_RD_ERROR(),
        .F_WR_ERROR(),
        .F_RD_PTR(),
        .F_WR_PTR()
  );
endmodule
