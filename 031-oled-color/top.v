`default_nettype none

module top (
    input wire clk,

    output wire oled_csn,
    output wire oled_clk,
    output wire oled_mosi,
    output wire oled_dc,
    output wire oled_resn,
);
    wire [7:0] x;
    wire [5:0] y;
    wire [7:0] color;

    spi_video video(
        .clk(clk),
        .oled_csn(oled_csn),
        .oled_clk(oled_clk),
        .oled_mosi(oled_mosi),
        .oled_dc(oled_dc),
        .oled_resn(oled_resn),
        .x(x),
        .y(y),
        .color(color)
    );
    // Color encoding
    // RRR GGG BB 
    assign color = 8'h02;

endmodule
