`timescale 1ns / 1ps

module tb_top;
  reg signed [1:0] A;
  reg signed [1:0] B;
  wire signed [3:0] P;

  top uut (
    .A(A),
    .B(B),
    .P(P)
  );

  integer i, j;

  initial begin
    $display("    A    B |    P");
    $display("===================");
    $monitor(" %4d %4d | %4d", A, B, P);

    for (i = -2; i < 2; i = i + 1) begin
      for (j = -2; j < 2; j = j + 1) begin
        A = i[1:0];
        B = j[1:0];
        #10; // wait 10 ns
      end
    end

    $finish;
  end

endmodule
