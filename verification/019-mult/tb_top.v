`timescale 1ns / 1ps

module tb_top;
  reg  [1:0] A;
  reg  [1:0] B;
  wire [3:0] P;

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

    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin
        A = i;
        B = j;
        #10; // wait 10 ns
      end
    end

    $finish;
  end

endmodule
