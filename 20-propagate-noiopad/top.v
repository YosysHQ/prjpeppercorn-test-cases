module top(input rst, output led);
  wire temp;

  CC_OBUF #(
    .SLEW("FAST"),
    .DRIVE("6"),
    .DELAY_OBF(4'b0100),
  ) out_buffer (
    .A(temp),
    .O(led)
  );
  CC_IBUF #(
    .PULLUP(1)
  ) in_buffer (
    .I(rst),
    .Y(temp)
  );
endmodule
