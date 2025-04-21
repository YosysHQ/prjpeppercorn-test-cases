module charrom ( output reg [7:0] dout, input[8:0] address, input clk);

   parameter MEM_INIT_FILE = "../mem/charrom.mem";

   // 64 characters x 8 bytes per character
   reg [7:0] rom [0:511];

   initial
     if (MEM_INIT_FILE != "")
       $readmemh(MEM_INIT_FILE, rom);
   
   always @(posedge clk)
     dout <= rom[address];

endmodule
