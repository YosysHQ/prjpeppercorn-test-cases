// Project F: Framebuffers - Mono David (Arty Pmod VGA)
// (C)2023 Will Green, open source hardware released under the MIT License
// Learn more at https://projectf.io/posts/framebuffers/

`default_nettype none
`timescale 1ns / 1ps

module top_david_mono (
    input  wire logic clk_10m,      // 10 MHz clock
    input  wire logic btn_rst_n,    // reset button
    output      logic vga_hsync,    // horizontal sync
    output      logic vga_vsync,    // vertical sync
    output      logic [3:0] vga_r,  // 4-bit VGA red
    output      logic [3:0] vga_g,  // 4-bit VGA green
    output      logic [3:0] vga_b   // 4-bit VGA blue
    );

    // generate pixel clock
    logic clk_pix;
    logic clk_pix_locked;
    logic rst_pix;
    clock_480p clock_pix_inst (
       .clk_10m,
       .rst(!btn_rst_n),  // reset button is active low
       .clk_pix,
       /* verilator lint_off PINCONNECTEMPTY */
       .clk_pix_5x(),  // not used for VGA output
       /* verilator lint_on PINCONNECTEMPTY */
       .clk_pix_locked
    );
    always_ff @(posedge clk_pix) rst_pix <= !clk_pix_locked;  // wait for clock lock

    // display sync signals and coordinates
    localparam CORDW = 16;  // signed coordinate width (bits)
    logic signed [CORDW-1:0] sx, sy;
    logic hsync, vsync;
    logic de, frame;
    display_480p #(.CORDW(CORDW)) display_inst (
        .clk_pix,
        .rst_pix,
        .sx,
        .sy,
        .hsync,
        .vsync,
        .de,
        .frame,
        /* verilator lint_off PINCONNECTEMPTY */
        .line()
        /* verilator lint_on PINCONNECTEMPTY */
    );

    // colour parameters
    localparam CHANW = 4;        // colour channel width (bits)
    localparam COLRW = 3*CHANW;  // colour width: three channels (bits)
    localparam BG_COLR = 'h137;  // background colour

    // framebuffer (FB)
    localparam FB_WIDTH  = 160;  // framebuffer width in pixels
    localparam FB_HEIGHT = 120;  // framebuffer width in pixels
    localparam FB_PIXELS = FB_WIDTH * FB_HEIGHT;  // total pixels in buffer
    localparam FB_ADDRW  = $clog2(FB_PIXELS);  // address width
    localparam FB_DATAW  = 1;  // colour bits per pixel
    localparam FB_IMAGE  = "res/david/david_1bit.mem";  // bitmap file
    // localparam FB_IMAGE  = "test_box_mono_160x120.mem";  // bitmap file

    // pixel read address and colour
    logic [FB_ADDRW-1:0] fb_addr_read;
    logic [FB_DATAW-1:0] fb_colr_read;

    // framebuffer memory
    bram_sdp #(
        .WIDTH(FB_DATAW),
        .DEPTH(FB_PIXELS),
        .INIT_F(FB_IMAGE)
    ) bram_inst (
        .clk_write(clk_pix),
        .clk_read(clk_pix),
        /* verilator lint_off PINCONNECTEMPTY */
        .we(),
        .addr_write(),
        /* verilator lint_on PINCONNECTEMPTY */
        .addr_read(fb_addr_read),
        /* verilator lint_off PINCONNECTEMPTY */
        .data_in(),
        /* verilator lint_on PINCONNECTEMPTY */
        .data_out(fb_colr_read)
    );

    // calculate framebuffer read address for display output
    localparam LAT = 2;  // read_fb+1, BRAM+1
    logic read_fb;
    always_ff @(posedge clk_pix) begin
        read_fb <= (sy >= 0 && sy < FB_HEIGHT && sx >= -LAT && sx < FB_WIDTH-LAT);
        if (frame) begin  // reset address at start of frame
            fb_addr_read <= 0;
        end else if (read_fb) begin  // increment address in painting area
            fb_addr_read <= fb_addr_read + 1;
        end
    end

    // paint screen
    logic paint_area;  // area of framebuffer to paint
    logic [CHANW-1:0] paint_r, paint_g, paint_b;  // colour channels
    always_comb begin
        paint_area = (sy >= 0 && sy < FB_HEIGHT && sx >= 0 && sx < FB_WIDTH);
        {paint_r, paint_g, paint_b} = paint_area ? {COLRW{fb_colr_read}} : BG_COLR;
    end

    // display colour: paint colour but black in blanking interval
    logic [CHANW-1:0] display_r, display_g, display_b;
    always_comb {display_r, display_g, display_b} = (de) ? {paint_r, paint_g, paint_b} : 0;

    // VGA Pmod output
    always_ff @(posedge clk_pix) begin
        vga_hsync <= hsync;
        vga_vsync <= vsync;
        vga_r <= display_r;
        vga_g <= display_g;
        vga_b <= display_b;
    end
endmodule
