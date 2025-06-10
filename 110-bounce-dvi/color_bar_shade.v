/*
 * bounce.v
 */

`default_nettype none

module color_bar #(
    parameter H_RES = 640,
    parameter V_RES = 480,
    parameter PIX_SZ = 8
) (
	input  wire              i_clk,
	input  wire              i_rst,
	input  wire              i_blank,
	input  wire              i_vsync,
	input  wire              i_hsync,
	output reg              o_blank,
	output reg              o_vsync,
	output reg              o_hsync,
	output wire [PIX_SZ-1:0] o_r,
	output wire [PIX_SZ-1:0] o_g,
	output wire [PIX_SZ-1:0] o_b
);

    localparam CORDW = 10;
    localparam LINE = 799;
    localparam SCREEN = 524;

    // calculate horizontal and vertical screen position
    reg [CORDW-1:0] sx = 0, sy = 0;
    always_ff @(posedge i_clk) begin
        if (i_rst) begin
            sx <= 0;
            sy <= 0;
        end
        else begin
            if (sx == LINE) begin  // last pixel on line?
                sx <= 0;
                sy <= (sy == SCREEN) ? 0 : sy + 1;  // last line on screen?
            end else begin
                sx <= sx + 1;
            end
        end
    end

    logic frame;  // high for one clock tick at the start of vertical blanking
    always_comb frame = (sy == V_RES && sx == 0);

    // frame counter lets us to slow down the action
    localparam FRAME_NUM = 1;  // slow-mo: animate every N frames
    logic [$clog2(FRAME_NUM):0] cnt_frame = 0;  // frame counter
    always_ff @(posedge i_clk) begin
        if (i_rst) begin
            cnt_frame <= 0;
        end
        else begin
            if (frame) cnt_frame <= (cnt_frame == FRAME_NUM-1) ? 0 : cnt_frame + 1;
        end
    end

    // square parameters
    localparam Q_SIZE = 200;   // size in pixels
    logic [CORDW-1:0] qx = 400, qy = 200;  // position (origin at top left)
    logic qdx = 0, qdy = 0;            // direction: 0 is right/down
    logic [CORDW-1:0] qs = 2;  // speed in pixels/frame

    // update square position once per frame
    always_ff @(posedge i_clk) begin
        if (i_rst) begin
            qx <= 400;
            qy <= 200;
            qdx <= 0;
            qdy <= 0;
        end
        else begin
            if (frame && cnt_frame == 0) begin
                // horizontal position
                if (qdx == 0) begin  // moving right
                    if (qx + Q_SIZE + qs >= H_RES-1) begin  // hitting right of screen?
                        qx <= H_RES - Q_SIZE - 1;  // move right as far as we can
                        qdx <= 1;  // move left next frame
                    end else qx <= qx + qs;  // continue moving right
                end else begin  // moving left
                    if (qx < qs) begin  // hitting left of screen?
                        qx <= 0;  // move left as far as we can
                        qdx <= 0;  // move right next frame
                    end else qx <= qx - qs;  // continue moving left
                end

                // vertical position
                if (qdy == 0) begin  // moving down
                    if (qy + Q_SIZE + qs >= V_RES-1) begin  // hitting bottom of screen?
                        qy <= V_RES - Q_SIZE - 1;  // move down as far as we can
                        qdy <= 1;  // move up next frame
                    end else qy <= qy + qs;  // continue moving down
                end else begin  // moving up
                    if (qy < qs) begin  // hitting top of screen?
                        qy <= 0;  // move up as far as we can
                        qdy <= 0;  // move down next frame
                    end else qy <= qy - qs;  // continue moving up
                end
            end
        end
    end

    // define a square with screen coordinates
    logic square;
    always_comb begin
        square = (sx >= qx) && (sx < qx + Q_SIZE) && (sy >= qy) && (sy < qy + Q_SIZE);
    end

    // paint colours with shade effect
    logic [7:0] paint_r, paint_g, paint_b;
    always_comb begin
        paint_r   = (square) ?   8'hFF : 8'hFF;
        paint_g   = (square) ? sy[7:0] : 8'hFF;
        paint_b   = (square) ? sx[7:0] : 8'hFF;
    end

    reg  [PIX_SZ-1:0] bd_s, gd_s, rd_s;

	always @(posedge i_clk) begin
		bd_s    = paint_b;
		gd_s    = paint_g;
		rd_s    = paint_r;
		o_blank = i_blank;
		o_vsync = i_vsync;
		o_hsync = i_hsync;
	end

	assign o_b = (o_blank) ? {PIX_SZ{1'b0}} : bd_s;
	assign o_g = (o_blank) ? {PIX_SZ{1'b0}} : gd_s;
	assign o_r = (o_blank) ? {PIX_SZ{1'b0}} : rd_s;

endmodule
