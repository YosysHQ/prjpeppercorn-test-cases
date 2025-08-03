module top (
    input wire rst,
    output  wire  [7:0] led         // to LEDs
);

  wire [15:0] P;
  CC_MULT #(
    .A_WIDTH(8),
    .B_WIDTH(8),
    .P_WIDTH(16)
  ) mult_inst (
    .A(8'b00101010),
    .B(8'b00101010),
    .P(P)
  );

    // 00000110 11100100
    assign led = rst ? ~P[7:0] : ~P[15:8];
endmodule

