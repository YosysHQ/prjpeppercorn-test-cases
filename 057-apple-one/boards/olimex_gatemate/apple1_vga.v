// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//
// Description: Apple 1 implementation for the Olimex GateMate
//
// Author.....: Lawrie Griffiths and Alan Garfield
// Gatemate by Goran Mahovlić
// Date.......: 20-3-2024
//

module apple1_top #(
    parameter BASIC_FILENAME      = "roms/basic.hex",
    parameter FONT_ROM_FILENAME   = "roms/vga_font_bitreversed.hex",
    parameter RAM_FILENAME        = "roms/ram.hex",
    parameter VRAM_FILENAME       = "roms/vga_vram.bin",
    parameter WOZMON_ROM_FILENAME = "roms/wozmon.hex"
) (
    input  clk_i,       // 10 MHz board clock

    // I/O interface to computer
    input  i_uart_rx,         // asynchronous serial data input from computer
    output o_uart_tx,         // asynchronous serial data output to computer

    // I/O interface to keyboard
    input ps2clk,          // PS/2 keyboard serial clock input
    input ps2data,          // PS/2 keyboard serial data input

    // Outputs to VGA display
    output o_hsync,      // hozizontal VGA sync pulse
    output o_vsync,      // vertical VGA sync pulse

    output [3:0] o_r,     // red VGA signal
    output [3:0] o_g,     // green VGA signal
    output [3:0] o_b,     // blue VGA signal
    
    // Debugging ports
    output o_led,
    input rstn_i      // one btn for all
);

    wire vga_bit, clk_25mhz, lock;

    // set the monochrome base colour here..
    assign o_r[3:0] = vga_bit ? 4'b1000 : 4'b0000;
    assign o_g[3:0] = vga_bit ? 4'b1111 : 4'b0000;
    assign o_b[3:0] = vga_bit ? 4'b1000 : 4'b0000;

/* 10 MHz to 25MHz */
pll pll_inst (
    .clock_in(clk_i), // 10 MHz
    .rst_in(~rstn_i),
    .clock_out(clk_25mhz), // 25 MHz
    .locked(lock)
);

    // debounce reset button
    wire reset_n;
    debounce reset_button (
        .clk25(clk_25mhz),
        .rst(1'b0),
        .sig_in(rstn_i),
        .sig_out(reset_n)
    );

    // debounce clear screen button
    wire clr_screen_n;
    debounce clr_button (
        .clk25(clk_25mhz),
        .rst(~reset_n),
        .sig_in(1'b1),
        .sig_out(clr_screen_n)
    );

    wire [15:0] pc_monitor;

    wire uart_cts;

    // apple one main system

    apple1 #(
        .BASIC_FILENAME (BASIC_FILENAME),
        .FONT_ROM_FILENAME (FONT_ROM_FILENAME),
        .RAM_FILENAME (RAM_FILENAME),
        .VRAM_FILENAME (VRAM_FILENAME),
        .WOZMON_ROM_FILENAME (WOZMON_ROM_FILENAME)
    ) my_apple1(
        .clk25(clk_25mhz),
        .rst_n(reset_n),

        .uart_rx(i_uart_rx),
        .uart_tx(o_uart_tx),
        .uart_cts(uart_cts),

        .ps2_clk(ps2clk),
        .ps2_din(ps2data),
        .ps2_select(1'b0),

        .vga_h_sync(o_hsync),
        .vga_v_sync(o_vsync),
        .vga_red(vga_bit),
        .pc_monitor(pc_monitor),
        .vga_cls(~clr_screen_n),
    );

    assign o_led = pc_monitor[7];

/*
reg [31:0]count;

always @(posedge clk_25mhz) begin

if(count == 24999999) begin //Time is up
    count <= 0;             //Reset count register
    o_led <= ~o_led;            //Toggle led (in each second)
end else begin
    count <= count + 1;     //Counts 25MHz clock
    end

end
*/

endmodule
