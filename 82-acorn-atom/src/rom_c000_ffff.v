module rom_c000_ffff (output reg [7:0] dout, input[12:0] address, input clk);

   parameter MEM_INIT_FILE = "../mem/rom_c000_f000.mem";

   reg [7:0] rom [0:8191];

   initial
     if (MEM_INIT_FILE != "")
       $readmemh(MEM_INIT_FILE, rom);
   
   always @(posedge clk)
     dout <= rom[address];

endmodule
