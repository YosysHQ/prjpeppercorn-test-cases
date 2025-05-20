module top(input wire rst, output wire led);
       assign led = ~rst;
endmodule
