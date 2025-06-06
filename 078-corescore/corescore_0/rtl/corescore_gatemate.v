`default_nettype none
module corescore_gatemate
(input wire i_clk,
 input wire btn0,
 output wire o_uart_tx,
 output wire q);

   wire      clk;
   wire      rst;

   assign q = o_uart_tx;

   corescore_gatemate_clock_gen pll 
    (.i_clk(i_clk),
     .i_rst(!btn0),
     .o_clk(clk),
     .o_rst(rst));

   parameter memfile_emitter = "emitter.hex";

   wire [7:0]  tdata;
   wire        tlast;
   wire        tvalid;
   wire        tready;

   corescorecore corescorecore
     (.i_clk     (clk),
      .i_rst     (rst),
      .o_tdata   (tdata),
      .o_tlast   (tlast),
      .o_tvalid  (tvalid),
      .i_tready  (tready));

   emitter_uart #(.clk_freq_hz (16_000_000)) emitter
     (.i_clk     (clk),
      .i_rst     (rst),
      .i_tdata   (tdata),
      .i_tvalid  (tvalid),
      .o_tready  (tready),
      .o_uart_tx (o_uart_tx));

endmodule
