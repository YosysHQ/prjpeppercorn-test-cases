module tone_generator
  (
   input       clk,
   input       clk_div16_en,
   input       reset,
   input [9:0] freq,
   output      audio_out
   );

   reg [9:0]   count;
   reg         tone;

   parameter init = 0;
   
   // the datasheet suggests that the frequency register is loaded
   // into a 10-bit counter and decremented until it hits 0
   // however, this results in a half-period of FREQ+1!
   always @(posedge clk or posedge reset)
     if(reset)
       begin
          count <= init;
          tone  <= 1'b0;
       end
     else if (clk_div16_en)
       begin
          if (count == 0)
            begin
               count <= freq;
               tone  <= !tone;
            end
          else
            begin
               count <= count - 1'b1;
            end
       end

   // assign output
   assign audio_out = tone;

endmodule
