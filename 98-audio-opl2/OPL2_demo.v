// more info at https://www.fpga4fun.com/OPL.html

// specify your FPGA board clock speed here (needs to be at least 8MHz)
`define clkHz 25000000	// for example 25MHz

////////////////////////
module OPL2_demo(
	input clk_10m,
	input uart_rx,
	output reg led,
	output [3:0] audio_r,
	output [3:0] audio_l
);
	wire clk;
	pll pll25(.clock_in(clk_10m), .clock_out(clk));

	// first receive the RS232 data
	wire [7:0] RxD_data;
	wire RxD_data_ready, RxD_endofpacket;
	async_receiver #(`clkHz, 115200) RX(
		.clk(clk),
		.RxD(uart_rx),
		.RxD_data_ready(RxD_data_ready),
		.RxD_data(RxD_data),
		.RxD_idle(),
		.RxD_endofpacket(RxD_endofpacket)
	);

	// catpure the RS232 data
	reg [7:0] OPL_din;  always @(posedge clk) if(RxD_data_ready) OPL_din <= RxD_data;

	// we receive the OPL addresses and data alternatively from the RS232
	// so we use a flipflop to keep track
	reg OPL_addrT;  always @(posedge clk) OPL_addrT <= ~RxD_endofpacket & (OPL_addrT ^ RxD_data_ready);

	// the OPL works in a different clock domain so we need two additional signals
	// first save the OPL cycle address/data type to use in the OPL clock domain
	reg OPL_addr;  always @(posedge clk) if(RxD_data_ready) OPL_addr <= OPL_addrT;

	// and toggle a flip-flop to send across the clock domain that data is available
	reg OPL_DT;  always @(posedge clk) OPL_DT <= OPL_DT ^ RxD_data_ready;

	////////////////////////
	// now generate the 3.579545MHz OPL clock (to match Sound Blaster PC boards)
	wire OPL_clk, clkdiv;
	clock_divider #(3579545, `clkHz) OPL_clkgen(.clk(clk), .clkdiv(clkdiv));
	CC_BUFG OPL_clk_buf(.O(OPL_clk), .I(clkdiv));

	////////////////////////
	// let's work in the OPL_clk clock domain

	// detect if a data is available
	reg [2:0] OPL_DTr;  always @(posedge OPL_clk) OPL_DTr <= {OPL_DTr[1:0], OPL_DT};
	wire OPL_cs = OPL_DTr[2] ^ OPL_DTr[1];

	// and send it to the OPL right away
	// (the OPL needs some clock cycles between writes but RS232 at 115200 bauds is slow enough that it's satisfied by design)
	wire signed [15:0] OPL_snd;
	jtopl #(.OPL_TYPE(2)) myOPL(.rst(1'b0), .clk(OPL_clk), .cen(1'b1), .cs_n(~OPL_cs), .wr_n(1'b0), .din(OPL_din), .addr(OPL_addr), .snd(OPL_snd));

	// generate the PWM pulses from the OPL audio sample output
	wire [15:0] OPL_snd_unsigned = (OPL_snd ^ 16'h8000);
	reg [16:0] PWM_acc= 16'b0;
	always @(posedge OPL_clk) PWM_acc <= PWM_acc[15:0] + OPL_snd_unsigned;
	assign audio_r = { PWM_acc[16], 3'b0 };
	assign audio_l = { PWM_acc[16], 3'b0 };

	// Input: 16-bit signed audio sample
	//wire [15:0] OPL_snd_unsigned = OPL_snd ^ 16'h8000;  // Convert signed to unsigned
//
	//reg [23:0] PWM_acc = 24'b0;  // Wider accumulator for resolution
	//always @(posedge OPL_clk)
	//	PWM_acc <= PWM_acc[19:0] + {OPL_snd_unsigned, 4'b0};
//
	//// Output: Top 4 bits for 4-bit DAC-style output
	//assign audio_r = { PWM_acc[20], PWM_acc[21], PWM_acc[22], PWM_acc[23] };
	//assign audio_l = audio_r;

	// and light up the activity LED
	wire activity_detected = OPL_cs & ~OPL_addr & OPL_din[7:4]==4'hA;  // detect note frequency changes
	reg [13:0] activity_cnt;  always @(posedge OPL_clk) activity_cnt <= activity_cnt + (activity_detected | |activity_cnt);
	always @(posedge OPL_clk) led <= |activity_cnt;
endmodule


////////////////////////////////////////////////////////////////////////////////
// clock divider
module clock_divider #(parameter N=17, D=114) (input clk, output reg clkdiv);
	function integer clog2; input integer value; integer temp; begin temp=value-1; for (clog2=0; temp>0; clog2=clog2+1) begin temp=temp>>1; end end endfunction
	localparam W = clog2(D/2-N);
	reg [W-1:0] cnt;
	wire [W-1:0] cnt_next1 = cnt + N;
	wire [W:0] cnt_next2 = cnt + (N-D/2);
	wire ovf = ~cnt_next2[W];
	always @(posedge clk) cnt <= ovf ? cnt_next2[W-1:0] : cnt_next1;
	always @(posedge clk) clkdiv <= clkdiv ^ ovf;
endmodule
