module top(input wire rst, output wire led);
    reg counter;
    always @(posedge rst) begin
       counter <= ~counter;
    end
    assign led = counter;
endmodule
