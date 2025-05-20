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

    reg [7:0] pos_x;
    reg [5:0] pos_y;

    initial
    begin
      pos_x <= 0;
      pos_y <= 0;
    end

    wire [7:0] sprite_rgb;

    wire [7:0] sprite_x;
    wire [5:0] sprite_y;

    assign sprite_x = x - pos_x;
    assign sprite_y = y - pos_y;

    sprite_rom sprite(
        .clk(clk),
        .addr({ sprite_y[5:0], sprite_x[5:0] }),
        .data_out(sprite_rgb));

    assign color = (x > pos_x && x < pos_x + 64 && y > pos_y && y < pos_y + 64) ? sprite_rgb : 8'hff;

endmodule
