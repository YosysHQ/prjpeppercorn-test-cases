module top(input rst, input btn0,input btn1,input btn2, input btn3,
       output wire led);
       //assign led = ~(btn0 & btn1 & btn2 &btn3);
       assign led = ~(btn0 & btn1);
       //assign led = ~(btn0 & btn1 & btn2 &btn3 & rst);
endmodule
