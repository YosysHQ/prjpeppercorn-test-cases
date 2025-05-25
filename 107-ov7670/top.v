module top
(
  input clk,
  input [7:0] cam_data,
  input cam_PCLK,
  input cam_HREF,
  input cam_VSYNC,
  output cam_RESET,
  output cam_XCLK,
  output cam_PWON,
  output cam_SOIC,
  inout  cam_SOID,

  output vga_hsync,
  output vga_vsync,
  output [3:0] vga_R,
  output [3:0] vga_G,
  output [3:0] vga_B
);

wire clk_25MHz;

pll pll_i(
	.clock_in(clk),             // 10 MHz input
	.clock_out(clk_25MHz),      // 25 MHz output 
);

// You do not need to connect PWON and RESET pins, but if you do you need this
assign cam_PWON = 1'b0;  // constant camera Power ON
assign cam_RESET = 1'b1; // camera reset to HIGH

wire inDisplayArea;
wire [9:0] CounterX;
wire [8:0] CounterY;
wire frame_done;

hvsync_generator hvsync_gen(
  .clk(clk_25MHz), //Input
  .vga_h_sync(vga_hsync), //Output
  .vga_v_sync(vga_vsync),//Output
  .inDisplayArea(inDisplayArea), //Output
  .CounterX(CounterX), //Output
  .CounterY(CounterY) //Output
);

wire [11:0] pixin;
wire [15:0] pixout;
wire [7:0] xout;
wire [7:0] yout;
reg we;

assign vga_R = inDisplayArea? pixin[11:8]:0;
assign vga_G = inDisplayArea? pixin[7:4]:0;
assign vga_B = inDisplayArea? pixin[3:0]:0;

wire [7:0] xin = CounterX[9:2];
wire [7:0] yin = CounterY[8:1];

wire [15:0] raddr = { yin, xin };
wire [15:0] waddr = { yout, xout };

vgabuff vgab (
        .clk(cam_PCLK), // Input
        .raddr(raddr),   // Input
        .pixin(pixin),  // Output
        .we(we),        // Input
        .waddr(waddr),  // Input
        .rclk(clk_25MHz),
        .pixout(pixout[11:0]) // Input
        );

wire [15:0] pixel_data;
wire [9:0] row, col;

assign yout = 255 - row[8:1] + 31;
assign xout = 150 - col[9:2];

assign pixout = pixel_data;

assign cam_XCLK =  clk_25MHz;

camera_read cam_read(
    .clk(clk_25MHz),           // 25MHz INPUT
    .x_clock(),                // OUTPUT
    .p_clock(cam_PCLK),        // Input
    .vsync(cam_VSYNC),         // Input
    .href(cam_HREF),           // Input
    .p_data(cam_data),         // Input
    .pixel_data(pixel_data),   // Input
    .pixel_valid(we),          // Input
    .frame_done(frame_done),
    .row(row),
    .col(col)
);

	reg [5:0] reset_cnt = 0;
	wire resetn = &reset_cnt;

	always @(posedge clk_25MHz) begin
		reset_cnt <= reset_cnt + !resetn;
	end

camera_configure cam_configure
(
    .clk(clk_25MHz),    // 25MHz
    .start(!resetn),       // Input
    .sioc(cam_SOIC),    // Output
    .siod(cam_SOID),    // Output
    .done()             // Output
);

endmodule
