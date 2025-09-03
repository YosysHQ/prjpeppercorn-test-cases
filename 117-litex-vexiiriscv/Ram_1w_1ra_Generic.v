`timescale 1ns/1ps

module Ram_1w_1ra #(
        parameter integer wordCount = 0,
        parameter integer wordWidth = 0,
        parameter technology = "auto",
        parameter readUnderWrite = "dontCare",
        parameter integer wrAddressWidth = 0,
        parameter integer wrDataWidth = 0,
        parameter integer wrMaskWidth = 0,
        parameter wrMaskEnable = 1'b0,
        parameter integer rdAddressWidth = 0,
        parameter integer rdDataWidth  = 0
    )(
        input wire clk,
        input wire wr_en,
        input wire [wrMaskWidth-1:0] wr_mask,
        input wire [wrAddressWidth-1:0] wr_addr,
        input wire [wrDataWidth-1:0] wr_data,
        input wire [rdAddressWidth-1:0] rd_addr,
        output wire [rdDataWidth-1:0] rd_data
    );

    (* ramstyle = "MLAB, no_rw_check", ram_style = "distributed" *) reg [wrDataWidth-1:0] ram_block [(2**wrAddressWidth)-1:0];
    always @ (posedge clk) begin
        if(wr_en) begin
           ram_block[wr_addr] <= wr_data;
        end
    end

    assign rd_data = ram_block[rd_addr];
endmodule
