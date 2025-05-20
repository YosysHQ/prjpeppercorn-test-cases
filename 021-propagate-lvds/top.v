module top(input rst, 
  output lvds_a0,
  output lvds_b0,

  input lvds_a8,
  input lvds_b8,
  output led);

  CC_LVDS_OBUF lvds_o (
    .O_P(lvds_a0),
    .O_N(lvds_b0),
    .A(rst)
  );

  CC_LVDS_IBUF lvds_i (
    .I_P(lvds_a8),
    .I_N(lvds_b8),
    .Y(led)
  );
endmodule
