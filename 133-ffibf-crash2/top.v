// Minimal repro for nextpnr 3c42800d (#1814, gatemate): CC_IOBUF with FF_IBF/FF_OBF (registered in + out in the IOSEL)
// and a fabric-driven output enable, as LiteX's GateMate SDR tristate (SDRAM DQ) generates.
module top(input clk, input d, input oe, inout io, output q);
  reg a_q, t_q, r;
  wire y;
  always @(posedge clk) begin a_q <= d; t_q <= ~oe; r <= y; end
  CC_IOBUF #(.FF_IBF(1'b1), .FF_OBF(1'b1)) u_io (.A(a_q), .T(t_q), .Y(y), .IO(io));
  assign q = r;
endmodule
