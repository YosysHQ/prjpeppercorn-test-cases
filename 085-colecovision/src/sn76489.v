module sn76489
  (
   input                          clk,
   input                          clk_en,
   input                          reset,

   input [0:7]                    d, // D0 is MSB!
   output                         ready,
   input                          we_n,
   input                          ce_n,

   output reg [AUDIO_RES - 1 : 0] audio_out
   );

   parameter AUDIO_RES = 16;
   parameter T1_FREQ      = 0;
   parameter T1_ATTN      = 1;
   parameter T2_FREQ      = 2;
   parameter T2_ATTN      = 3;
   parameter T3_FREQ      = 4;
   parameter T3_ATTN      = 5;
   parameter NOISE_CTL    = 6;
   parameter NOISE_ATTN   = 7;

   reg [9:0]                      regs  [0 : 7];
   reg                        clk_div16_en;
   wire [0:3]                 audio_d;

   // the channel used to control the noise shifter frequency
   wire noise_f_ref = audio_d[2];

   reg [2:0] reg_a;
   reg [3:0] div_count = 0;
   
   always @(posedge clk or posedge reset)
     if (reset)
       begin
          div_count <= 0;
       end
     else
       begin
          clk_div16_en <= 1'b0;
          if (clk_en)
            begin
               if (div_count == 0)
                 clk_div16_en <= 1'b1;
               div_count <= div_count + 1;
            end
       end

   // NOTE: on the SN76489, D0 is the MSB

   // register interface
   always @(posedge clk or posedge reset)
     if (reset)
       begin
          // attenutation registers are the important bits
          regs[0] <= 1023;
          regs[1] <= 0;
          regs[2] <= 1023;
          regs[3] <= 0;
          regs[4] <= 1023;
          regs[5] <= 0;
          regs[6] <= 0;
          regs[7] <= 0;
       end // if (reset)
     else
       begin
          if (clk_en)
            begin
               // data is strobed in on WE_n
               if (!ce_n & !we_n)
                 begin
                    if (d[0])
                      begin
                         // latch the register address for later
                         reg_a <= d[1:3];
                         // always latch high nibble into R(3:0)
                         regs[d[1:3]][3:0] = d[4:7];
                      end
                    else if (reg_a == T1_FREQ | reg_a == T2_FREQ | reg_a == T3_FREQ)
                      begin
                         regs[reg_a][9:4] <= d[2:7];
                      end
                    else
                      begin
                         // apparently writing a 'data' byte to non-Freq registers
                         // does actually work!
                         regs[reg_a][3:0] <= d[4:7];
                      end
                 end
            end
       end


   tone_generator #(0) tone_inst0
     (
      .clk(clk),
      .clk_div16_en(clk_div16_en),
      .reset(reset),
      .freq(regs[0]),
      .audio_out(audio_d[0])
      );

   tone_generator #(313) tone_inst1
     (
      .clk(clk),
      .clk_div16_en(clk_div16_en),
      .reset(reset),
      .freq(regs[2]),
      .audio_out(audio_d[1])
      );

   tone_generator #(717) tone_inst2
     (
      .clk(clk),
      .clk_div16_en(clk_div16_en),
      .reset(reset),
      .freq(regs[4]),
      .audio_out(audio_d[2])
      );

   reg [14:0] noise_r;
   reg [6:0]  count;
   reg        noise_f_ref_r;
   reg        shift;
   
   always @(posedge clk or posedge reset)
     if (reset)
       begin
          noise_r <= 15'b100000000000000;
          count <= 0;
//        shift <= 1'b0;
       end
     else
       begin
          shift = 1'b0;
          if (clk_div16_en)
            begin
               case (regs[NOISE_CTL][1:0])
               2'b00:
                  shift = count[4:0] == 0;
               2'b01:
                  shift = count[5:0] == 0;
               2'b10:
                  shift = count[6:0] == 0;
               default:
                 // shift rate governed by reference tone output
                 shift = noise_f_ref & !noise_f_ref_r;
               endcase
               if (shift)
                 // for periodic noise, don't use bit 0 tap
                 noise_r <= { (noise_r[1] ^ (regs[NOISE_CTL][2] & noise_r[0])), noise_r[14:1] };
               count <= count + 1;
               noise_f_ref_r <= noise_f_ref;
            end
          // writing to the NOISE_CTL register reloads the noise shift register
          if (clk_en)
            if (!ce_n & !we_n & reg_a == NOISE_CTL)
              noise_r <= 15'b100000000000000;
       end

   assign audio_d[3] = !noise_r[0];

   reg [13:0] scale [0:15];

   initial
     begin
        // fixed-point scaled by 2^14
        scale[ 0] <= 14'b11111111111111;
        scale[ 1] <= 14'b11001011010110; // -2dB
        scale[ 2] <= 14'b10100001100010; // -4dB
        scale[ 3] <= 14'b10000000010011; // -6dB
        scale[ 4] <= 14'b01100101111011; // -8dB
        scale[ 5] <= 14'b01010000111101; // -10dB
        scale[ 6] <= 14'b01000000010011; // -12dB
        scale[ 7] <= 14'b00110011000101; // -14dB
        scale[ 8] <= 14'b00101000100101; // -16dB
        scale[ 9] <= 14'b00100000001111; // -18dB
        scale[10] <= 14'b00011001100110; // -20dB
        scale[11] <= 14'b00010100010101; // -22dB
        scale[12] <= 14'b00010000001010; // -24dB
        scale[13] <= 14'b00001100110101; // -26dB
        scale[14] <= 14'b00001010001100; // -28dB
        scale[15] <= 14'b00000000000000;
     end

   reg [15:0] ch[0 : 3];
   reg [15:0] audio_out_v;
   always @*
     begin
        ch[0] = audio_d[0] ? { 2'b00, scale[regs[1][3:0]] } : 16'b0;
        ch[1] = audio_d[1] ? { 2'b00, scale[regs[3][3:0]] } : 16'b0;
        ch[2] = audio_d[2] ? { 2'b00, scale[regs[5][3:0]] } : 16'b0;
        ch[3] = audio_d[3] ? { 2'b00, scale[regs[7][3:0]] } : 16'b0;
        audio_out_v = ch[0] + ch[1] + ch[2] + ch[3];
        audio_out = audio_out_v[15 : 15 - (AUDIO_RES - 1)];
     end

endmodule
