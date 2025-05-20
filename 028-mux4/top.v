module top(
  input wire btn0,
  input wire btn1,
  input wire btn2,
  input wire btn3,
  input wire rst,
  output wire led
);
  wire w;
  CC_MX4 mux (
    .D0(btn0),
    .D1(btn1),
    .D2(rst),
    .D3(),
    .S0(btn2),
    .S1(btn3),
    .Y(w)
  );

  assign led = ~w;
endmodule
