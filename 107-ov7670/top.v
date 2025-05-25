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
reg [4:0] fudge = 31;
wire vga_blank,frame_done;

assign vga_blank = (~inDisplayArea); // vga is blank if pixel is not in Display area

hvsync_generator hvsync_gen(
  .clk(clk_25MHz), //Input
  .vga_h_sync(vga_hsync), //Output
  .vga_v_sync(vga_vsync),//Output
  .inDisplayArea(inDisplayArea), //Output
  .CounterX(CounterX), //Output
  .CounterY(CounterY) //Output
);

wire [15:0] pixin;

wire [7:0] R = { pixin[15:11], 3'b000};
wire [7:0] G = { pixin[10:5], 2'b00};
wire [7:0] B = { pixin[4:0] , 3'b000};

wire [15:0] pixout;
wire [7:0] xout;
wire [6:0] yout;
reg we;

assign vga_R = inDisplayArea?R[7:4]:0;
assign vga_G = inDisplayArea?G[7:4]:0;
assign vga_B = inDisplayArea?B[7:4]:0;

wire [7:0] xin = (inDisplayArea ? (CounterX[9:2]) : 0);
wire [6:0] yin = (inDisplayArea ? (CounterY[8:2]) : 0);

wire [14:0] raddr = (yin << 7) + (yin << 5) + xin;
wire [14:0] waddr = (yout << 7) + (yout << 5) + xout;

vgabuff vgab (
        .clk(clk_25MHz), // Input
        .raddr(raddr),   // Input
        .pixin(pixin),  // Output
        .we(we),        // Input
        .waddr(waddr),  // Input
        .pixout(pixout) // Input
        );

wire [15:0] pixel_data;
wire [9:0] row, col;

assign yout = 119 - row[8:2] + fudge;
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
