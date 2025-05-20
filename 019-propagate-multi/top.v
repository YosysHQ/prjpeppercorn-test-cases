module top(input wire rst, output wire [7:0] led);
       assign led= {rst, rst, rst, rst, rst, rst, rst, rst}; 
endmodule
