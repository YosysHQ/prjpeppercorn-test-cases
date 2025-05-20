//-----------------------------------------------------------------------------
//
//                                 SID 6581
//
//     A fully functional SID chip implementation in VHDL
//
//-----------------------------------------------------------------------------
// to do:   - filter
//          - smaller implementation, use multiplexed channels
//
//
// "The Filter was a classic multi-mode (state variable) VCF design. There was
// no way to create a variable transconductance amplifier in our NMOS process,
// so I simply used FETs as voltage-controlled resistors to control the cutoff
// frequency. An 11-bit D/A converter generates the control voltage for the
// FETs (it's actually a 12-bit D/A, but the LSB had no audible affect so I
// disconnected it!)."
// "Filter resonance was controlled by a 4-bit weighted resistor ladder. Each
// bit would turn on one of the weighted resistors and allow a portion of the
// output to feed back to the input. The state-variable design provided
// simultaneous low-pass, band-pass and high-pass outputs. Analog switches
// selected which combination of outputs were sent to the final amplifier (a
// notch filter was created by enabling both the high and low-pass outputs
// simultaneously)."
// "The filter is the worst part of SID because I could not create high-gain
// op-amps in NMOS, which were essential to a resonant filter. In addition,
// the resistance of the FETs varied considerably with processing, so different
// lots of SID chips had different cutoff frequency characteristics. I knew it
// wouldn't work very well, but it was better than nothing and I didn't have
// time to make it better."
//
//-----------------------------------------------------------------------------

module sid6581
  (
   input         clk_1MHz,  // main SID clock signal
   input         clk32,     // main clock signal
   input         clk_DAC,   // DAC clock signal, must be as high as possible for the best results
   input         reset,     // high active signal (reset when reset = '1')
   input         cs,        // "chip select", when this signal is '1' this model can be accessed
   input         we,        // when '1' this model can be written to, otherwise access is considered as read

   input [4:0]   addr,      // address lines
   input [7:0]   di,        // data in (to chip)
   output [7:0]  dout,      // data out   (from chip)

   input         pot_x,     // paddle input-X
   input         pot_y,     // paddle input-Y
   output        audio_out, // this line holds the audio-signal in PWM format
   output [17:0] audio_data
   );

   reg [7:0] Voice_1_Freq_lo    = 0;
   reg [7:0] Voice_1_Freq_hi    = 0;
   reg [7:0] Voice_1_Pw_lo      = 0;
   reg [3:0] Voice_1_Pw_hi      = 0;
   reg [7:0] Voice_1_Control    = 0;
   reg [7:0] Voice_1_Att_dec    = 0;
   reg [7:0] Voice_1_Sus_Rel    = 0;
   wire [7:0] Voice_1_Osc;
   wire [7:0] Voice_1_Env;

   reg [7:0] Voice_2_Freq_lo    = 0;
   reg [7:0] Voice_2_Freq_hi    = 0;
   reg [7:0] Voice_2_Pw_lo      = 0;
   reg [3:0] Voice_2_Pw_hi      = 0;
   reg [7:0] Voice_2_Control    = 0;
   reg [7:0] Voice_2_Att_dec    = 0;
   reg [7:0] Voice_2_Sus_Rel    = 0;
   wire [7:0] Voice_2_Osc;
   wire [7:0] Voice_2_Env;

   reg [7:0] Voice_3_Freq_lo    = 0;
   reg [7:0] Voice_3_Freq_hi    = 0;
   reg [7:0] Voice_3_Pw_lo      = 0;
   reg [3:0] Voice_3_Pw_hi      = 0;
   reg [7:0] Voice_3_Control    = 0;
   reg [7:0] Voice_3_Att_dec    = 0;
   reg [7:0] Voice_3_Sus_Rel    = 0;

   reg [7:0] Filter_Fc_lo       = 0;
   reg [7:0] Filter_Fc_hi       = 0;
   reg [7:0] Filter_Res_Filt    = 0;
   reg [7:0] Filter_Mode_Vol    = 0;

   wire [7:0] Misc_PotX;
   wire [7:0] Misc_PotY;
   wire [7:0] Misc_Osc3_Random;
   wire [7:0] Misc_Env3;

   reg [7:0] do_buf             = 0;

   wire [11:0] voice_1;
   wire [11:0] voice_2;
   wire [11:0] voice_3;
   reg [13:0] voice_mixed       = 0;
   reg [35:0] voice_volume      = 0;

   reg [31:0] divide_0          = 0;


   wire       voice_1_PA_MSB;
   wire       voice_2_PA_MSB;
   wire       voice_3_PA_MSB;

   wire signed [12:0] voice1_signed;
   wire signed [12:0] voice2_signed;
   wire signed [12:0] voice3_signed;

   wire signed [12:0] ext_in_signed = 0;

   wire signed [18:0] filtered_audio;
   reg                tick_q1;
   reg                tick_q2;
   wire               input_valid;
   wire [17:0]        unsigned_audio;
   wire [18:0]        unsigned_filt;
   reg                ff1;

//-----------------------------------------------------------------------------

   pwm_sddac digital_to_analog
     (
     .clk_i             (clk_DAC),
     .reset             (reset),
     .dac_i             (unsigned_audio[17:8]),
     .dac_o             (audio_out)
      );

   pwm_sdadc paddle_x
     (
      .clk              (clk_1MHz),
      .reset            (reset),
      .ADC_out          (Misc_PotX),
      .ADC_in           (pot_x)
      );

   pwm_sdadc paddle_y
      (
       .clk             (clk_1MHz),
       .reset           (reset),
       .ADC_out         (Misc_PotY),
       .ADC_in          (pot_y)
       );

   sid_voice sid_voice_1
     (
     .clk_1MHz          (clk_1MHz),
     .reset             (reset),
     .Freq_lo           (Voice_1_Freq_lo),
     .Freq_hi           (Voice_1_Freq_hi),
     .Pw_lo             (Voice_1_Pw_lo),
     .Pw_hi             (Voice_1_Pw_hi),
     .Control           (Voice_1_Control),
     .Att_dec           (Voice_1_Att_dec),
     .Sus_Rel           (Voice_1_Sus_Rel),
     .PA_MSB_in         (voice_3_PA_MSB),
     .PA_MSB_out        (voice_1_PA_MSB),
     .Osc               (Voice_1_Osc),
     .Env               (Voice_1_Env),
     .voice             (voice_1)
   );

   sid_voice sid_voice_2
     (
     .clk_1MHz          (clk_1MHz),
     .reset             (reset),
     .Freq_lo           (Voice_2_Freq_lo),
     .Freq_hi           (Voice_2_Freq_hi),
     .Pw_lo             (Voice_2_Pw_lo),
     .Pw_hi             (Voice_2_Pw_hi),
     .Control           (Voice_2_Control),
     .Att_dec           (Voice_2_Att_dec),
     .Sus_Rel           (Voice_2_Sus_Rel),
     .PA_MSB_in         (voice_1_PA_MSB),
     .PA_MSB_out        (voice_2_PA_MSB),
     .Osc               (Voice_2_Osc),
     .Env               (Voice_2_Env),
     .voice             (voice_2)
     );

   sid_voice sid_voice_3
     (
     .clk_1MHz          (clk_1MHz),
     .reset             (reset),
     .Freq_lo           (Voice_3_Freq_lo),
     .Freq_hi           (Voice_3_Freq_hi),
     .Pw_lo             (Voice_3_Pw_lo),
     .Pw_hi             (Voice_3_Pw_hi),
     .Control           (Voice_3_Control),
     .Att_dec           (Voice_3_Att_dec),
     .Sus_Rel           (Voice_3_Sus_Rel),
     .PA_MSB_in         (voice_2_PA_MSB),
     .PA_MSB_out        (voice_3_PA_MSB),
     .Osc               (Misc_Osc3_Random),
     .Env               (Misc_Env3),
     .voice             (voice_3)
   );

//-----------------------------------------------------------------------------------
   assign dout = do_buf;

// SID filters

   always @(posedge clk_1MHz, posedge reset)
     begin
        if (reset)
          ff1 <= 1'b0;
        else
          ff1 <= !ff1;
     end

   always @(posedge clk32)
     begin
        tick_q1 <= ff1;
        tick_q2 <= tick_q1;
     end

   assign input_valid = (tick_q1 != tick_q2);

   assign voice1_signed = {1'b0, voice_1} - 12'd2048;
   assign voice2_signed = {1'b0, voice_2} - 12'd2048;
   assign voice3_signed = {1'b0, voice_3} - 12'd2048;

   sid_filters filters
     (
      .clk         (clk32),
      .rst         (reset),
      // SID registers.
      .Fc_lo       (Filter_Fc_lo),
      .Fc_hi       (Filter_Fc_hi),
      .Res_Filt    (Filter_Res_Filt),
      .Mode_Vol    (Filter_Mode_Vol),
      // Voices - resampled to 13 bit
      .voice1      (voice1_signed),
      .voice2      (voice2_signed),
      .voice3      (voice3_signed),
      //
      .input_valid (input_valid),
      .ext_in      (ext_in_signed),

      .sound       (filtered_audio),
      .valid       ()
      );

   assign unsigned_filt  = filtered_audio + 19'b1000000000000000000;
   assign unsigned_audio = unsigned_filt[18:1];
   assign audio_data     = unsigned_audio;

// Register decoding
   always @(posedge clk32)
     if (reset)
       begin
          //------------------------------------- Voice-1
          Voice_1_Freq_lo   <= 0;
          Voice_1_Freq_hi   <= 0;
          Voice_1_Pw_lo     <= 0;
          Voice_1_Pw_hi     <= 0;
          Voice_1_Control   <= 0;
          Voice_1_Att_dec   <= 0;
          Voice_1_Sus_Rel   <= 0;
          //------------------------------------- Voice-2
          Voice_2_Freq_lo   <= 0;
          Voice_2_Freq_hi   <= 0;
          Voice_2_Pw_lo     <= 0;
          Voice_2_Pw_hi     <= 0;
          Voice_2_Control   <= 0;
          Voice_2_Att_dec   <= 0;
          Voice_2_Sus_Rel   <= 0;
          //------------------------------------- Voice-3
          Voice_3_Freq_lo   <= 0;
          Voice_3_Freq_hi   <= 0;
          Voice_3_Pw_lo     <= 0;
          Voice_3_Pw_hi     <= 0;
          Voice_3_Control   <= 0;
          Voice_3_Att_dec   <= 0;
          Voice_3_Sus_Rel   <= 0;
          //------------------------------------- Filter & volume
          Filter_Fc_lo      <= 0;
          Filter_Fc_hi      <= 0;
          Filter_Res_Filt   <= 0;
          Filter_Mode_Vol   <= 0;
       end
     else
       begin
          Voice_1_Freq_lo   <= Voice_1_Freq_lo;
          Voice_1_Freq_hi   <= Voice_1_Freq_hi;
          Voice_1_Pw_lo     <= Voice_1_Pw_lo;
          Voice_1_Pw_hi     <= Voice_1_Pw_hi;
          Voice_1_Control   <= Voice_1_Control;
          Voice_1_Att_dec   <= Voice_1_Att_dec;
          Voice_1_Sus_Rel   <= Voice_1_Sus_Rel;
          Voice_2_Freq_lo   <= Voice_2_Freq_lo;
          Voice_2_Freq_hi   <= Voice_2_Freq_hi;
          Voice_2_Pw_lo     <= Voice_2_Pw_lo;
          Voice_2_Pw_hi     <= Voice_2_Pw_hi;
          Voice_2_Control   <= Voice_2_Control;
          Voice_2_Att_dec   <= Voice_2_Att_dec;
          Voice_2_Sus_Rel   <= Voice_2_Sus_Rel;
          Voice_3_Freq_lo   <= Voice_3_Freq_lo;
          Voice_3_Freq_hi   <= Voice_3_Freq_hi;
          Voice_3_Pw_lo     <= Voice_3_Pw_lo;
          Voice_3_Pw_hi     <= Voice_3_Pw_hi;
          Voice_3_Control   <= Voice_3_Control;
          Voice_3_Att_dec   <= Voice_3_Att_dec;
          Voice_3_Sus_Rel   <= Voice_3_Sus_Rel;
          Filter_Fc_lo      <= Filter_Fc_lo;
          Filter_Fc_hi      <= Filter_Fc_hi;
          Filter_Res_Filt   <= Filter_Res_Filt;
          Filter_Mode_Vol   <= Filter_Mode_Vol;
          do_buf            <= 0;

          if (cs)
            begin
               if (we)   // Write to SID-register
                 begin
                    //----------------------
                    case (addr)
                      //------------------------------------ Voice-1
                      5'b00000:   Voice_1_Freq_lo   <= di;
                      5'b00001:   Voice_1_Freq_hi   <= di;
                      5'b00010:   Voice_1_Pw_lo     <= di;
                      5'b00011:   Voice_1_Pw_hi     <= di[3:0];
                      5'b00100:   Voice_1_Control   <= di;
                      5'b00101:   Voice_1_Att_dec   <= di;
                      5'b00110:   Voice_1_Sus_Rel   <= di;
                      //------------------------------------- Voice-2
                      5'b00111:   Voice_2_Freq_lo   <= di;
                      5'b01000:   Voice_2_Freq_hi   <= di;
                      5'b01001:   Voice_2_Pw_lo     <= di;
                      5'b01010:   Voice_2_Pw_hi     <= di[3:0];
                      5'b01011:   Voice_2_Control   <= di;
                      5'b01100:   Voice_2_Att_dec   <= di;
                      5'b01101:   Voice_2_Sus_Rel   <= di;
                      //------------------------------------- Voice-3
                      5'b01110:   Voice_3_Freq_lo   <= di;
                      5'b01111:   Voice_3_Freq_hi   <= di;
                      5'b10000:   Voice_3_Pw_lo     <= di;
                      5'b10001:   Voice_3_Pw_hi     <= di[3:0];
                      5'b10010:   Voice_3_Control   <= di;
                      5'b10011:   Voice_3_Att_dec   <= di;
                      5'b10100:   Voice_3_Sus_Rel   <= di;
                      //------------------------------------- Filter & volume
                      5'b10101:   Filter_Fc_lo      <= di;
                      5'b10110:   Filter_Fc_hi      <= di;
                      5'b10111:   Filter_Res_Filt   <= di;
                      5'b11000:   Filter_Mode_Vol   <= di;
                    endcase
                 end
               else
                 begin
                    // Read from SID-register
                    //-----------------------
                    //case CONV_INTEGER(addr) is
                    case (addr)
                      //------------------------------------ Misc
                      5'b11001:   do_buf   <= Misc_PotX;
                      5'b11010:   do_buf   <= Misc_PotY;
                      5'b11011:   do_buf   <= Misc_Osc3_Random;
                      5'b11100:   do_buf   <= Misc_Env3;
                      //------------------------------------
                      default: do_buf <= 0;
                    endcase
                 end
            end
       end
endmodule
