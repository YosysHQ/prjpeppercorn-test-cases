module vid_ram (
                // Port A
                input            clk_a,
                input            we_a,
                input [12:0]     addr_a,
                input [7:0]      din_a,
		output reg [7:0]     dout_a,
                // Port B
                input            clk_b,
                input [12:0]     addr_b,
                output reg [7:0] dout_b            
            );

   parameter MEM_INIT_FILE = "../mem/vid_ram.mem";
   
   reg [7:0]                     ram [0:6143];

   initial
     if (MEM_INIT_FILE != "")
       $readmemh(MEM_INIT_FILE, ram);
   
   always @(posedge clk_a)
     begin
        if (we_a)
          ram[addr_a] <= din_a;
        dout_a <= ram[addr_a];
     end

   always @(posedge clk_b)
     begin
        dout_b <= ram[addr_b];
     end
   
endmodule
