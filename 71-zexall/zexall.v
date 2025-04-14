module zexall(
	input clk,
	input reset,
	input rx,
	output tx,
	output mreq_n
);
	reg [7:0] idata;
	wire [15:0] addr;
	wire [7:0] odata;

	wire m1_n;
	wire mreq_n;
	wire iorq_n;
	wire rd_n;
	wire wr_n;
	wire rfsh_n;
	wire halt_n;
	wire busak_n;
	wire wait_n = 1'b1;
	wire int_n = 1'b1;
	wire nmi_n = 1'b1;
	wire busrq_n = 1'b1;
	
	wire [7:0] ram1_out;
	wire [7:0] ram2_out;	
	
	reg wr_ram1;	
	reg wr_ram2;	
	reg rd_ram1;
	reg rd_ram2;

	reg wr_uart;
	reg rd_uart;
	
	reg [7:0] r_ack;
	reg [7:0] r_req;
	reg [7:0] r_req_last;
	reg [7:0] r_data;
	
	wire [7:0] uart_out;

	wire dat_wait;
	wire valid;
	wire tdre;
	simpleuart uart
	(
		.clk(clk),
		.resetn(~reset),

		.ser_tx(tx),
		.ser_rx(rx),

		.cfg_divider(10000000/115200),

		.reg_dat_we(wr_uart),
		.reg_dat_re(rd_uart),
		.reg_dat_di(r_data),
		.reg_dat_do(uart_out),
		.reg_dat_wait(dat_wait),
		.recv_buf_valid(valid),
		.tdre(tdre)
	);


	always @(*)
	begin
		rd_ram1 = 0;
		rd_ram2 = 0;
		rd_uart = 0;
		wr_ram1 = 0;
		wr_ram2 = 0;
		wr_uart = 0;
		casex ({~wr_n,~rd_n,mreq_n,addr[15:0]})
			// MEM MAP
			{3'b010,16'b000xxxxxxxxxxxxx}: begin idata = ram1_out; rd_ram1 = 1; end         // 0x0000-0x1fff
			{3'b010,16'b0010xxxxxxxxxxxx}: begin idata = ram2_out; rd_ram2 = 1; end         // 0x2000-0x2fff
			{3'b010,16'hfffd}: idata = ~tdre;    // 0xfffd
			{3'b010,16'hffff}: begin idata = uart_out;  rd_uart = 1; end         // 0xffff
			// MEM MAP
			{3'b100,16'b000xxxxxxxxxxxxx}: wr_ram1= 1; // 0x0000-0x1fff
			{3'b100,16'b0010xxxxxxxxxxxx}: wr_ram2= 1; // 0x2000-0x2fff
			{3'b100,16'hffff}: begin 
									r_data = odata;
									wr_uart = 1;
								end         // 0xffff
		endcase
	end
	
	tv80n cpu (
		.m1_n(m1_n), .mreq_n(mreq_n), .iorq_n(iorq_n), 
		.rd_n(rd_n), .wr_n(wr_n), .rfsh_n(rfsh_n), .halt_n(halt_n), .busak_n(busak_n),
		.A(addr), .do(odata), 
		.reset_n(~reset), .clk(clk), .wait_n(wait_n), .int_n(int_n), .nmi_n(nmi_n), .busrq_n(busrq_n), .di(idata)
	);
	
	ram_memory #(.ADDR_WIDTH(13),.FILENAME("roms/zexall/zexall-1.bin.mem")) ram1(.clk(clk),.addr(addr[12:0]),.data_in(odata),.rd(rd_ram1),.we(wr_ram1),.data_out(ram1_out));
	ram_memory #(.ADDR_WIDTH(12),.FILENAME("roms/zexall/zexall-2.bin.mem")) ram2(.clk(clk),.addr(addr[11:0]),.data_in(odata),.rd(rd_ram2),.we(wr_ram2),.data_out(ram2_out));
endmodule
