module top(input wire btn0, input wire btn1, output wire led);
    reg counter;
    always @(posedge btn0) begin
       counter <= btn1;
    end
    assign led = counter;
endmodule
