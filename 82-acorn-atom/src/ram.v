module ram (
                // Port A
                input            clk,
                input            we,
                input [15:0]     addr,
                input [7:0]      din,
                output reg [7:0] dout
            );

   reg [7:0] ram [0:65535];

   always @(posedge clk)
     begin
        if (we)
          ram[addr] <= din;
        dout <= ram[addr];
     end
endmodule
