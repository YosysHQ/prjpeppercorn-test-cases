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
  reg tx_valid = 0;
  reg tx_ready = 0;
  wire [7:0] uart_in;
  reg [7:0] uart_out = 0;

  reg [5:0] reset_cnt = 0;
  wire resetn = &reset_cnt;

  always @(posedge clk) begin
    reset_cnt <= reset_cnt + !resetn;
  end
  
  uart_rx uart_receive(
    .clk(clk),
    .resetn(resetn),
    .ser_rx(uart_rx),
    .cfg_divider(10000000/115200),
    .data(uart_in),
    .valid(rx_valid)
  );

  uart_tx uart_transmit(
    .clk(clk),
    .resetn(resetn),
    .ser_tx(uart_tx),
    .cfg_divider(10000000/115200),
    .data(uart_out),
    .data_we(tx_valid)
  );

//reg memory [0:32767];
reg memory [0:65535];

reg [11:0] rom_address = 0;
reg val = 0;
always @(posedge clk) begin
    if (tx_ready) begin
        val <= memory[rom_address];
        uart_out <= val ? 8'd49 : 8'd48;
        tx_valid <= 1;
        tx_ready <= 0;
    end
    else if (tx_valid) begin
        tx_valid <= 0;
        rom_address <= rom_address + 1;
    end
    else if (rx_valid) begin
        memory[rom_address] <= uart_in[0];
        tx_ready <= 1;
    end
end


endmodule