module top(input wire btn0, input wire btn1, input wire btn2, output wire led);
  wire w;
  CC_MX2 mux (
    .D0(btn0),
    .D1(btn1),
    .S0(btn2),
    .Y(w)
  );

  assign led = ~w;
endmodule
