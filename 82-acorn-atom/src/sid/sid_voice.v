// ============================================================================
//
//                                 SID 6581 (voice)
//
//     This piece of VHDL code describes a single SID voice (sound channel)
//
// ============================================================================
// to do:   - better resolution of result signal voice, this is now only 12bits
// but it could be 20 !! Problem, it does not fit the PWM-dac
// ============================================================================

module sid_voice
  (
     input         clk_1MHz , // this line drives the oscilator
     input         reset , // active high signal (i.e. registers are reset when reset=1)
     input [7:0]   Freq_lo , // low-byte of frequency register
     input [7:0]   Freq_hi , // high-byte of frequency register
     input [7:0]   Pw_lo , // low-byte of PuleWidth register
     input [3:0]   Pw_hi , // high-nibble of PuleWidth register
     input [7:0]   Control , // control register
     input [7:0]   Att_dec , // attack-deccay register
     input [7:0]   Sus_Rel , // sustain-release register
     input         PA_MSB_in , // Phase Accumulator MSB input
     output        PA_MSB_out , // Phase Accumulator MSB output
     output [7:0]  Osc , // Voice waveform register
     output [7:0]  Env , // Voice envelope register
     output [11:0] voice
     );

// ============================================================================
// Altera multiplier
// COMPONENT lpm_mult
// GENERIC
// (
//    lpm_hint    : STRING;
//    lpm_representation      : STRING;
//    lpm_type    : STRING;
//    lpm_widtha     : NATURAL;
//    lpm_widthb     : NATURAL;
//    lpm_widthp     : NATURAL;
//    lpm_widths     : NATURAL
// );
// PORT
// (
//    dataa    : IN  STD_LOGIC_VECTOR (11 DOWNTO 0);
//    datab    : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
//    result   : OUT STD_LOGIC_VECTOR (19 DOWNTO 0)
// );
// END COMPONENT;

// ============================================================================

   reg [23:0]      accumulator              = 0;
   reg             accu_bit_prev            = 1'b0;
   reg             PA_MSB_in_prev           = 1'b0;

   // this type of signal has only two states 0 or 1 (so no more bits are required)
   reg             pulse                    = 1'b0;
   reg [11:0]      sawtooth                 = 0;
   reg [11:0]      triangle                 = 0;
   wire [11:0]     noise;
   reg [22:0]      LFSR                     = 0;

   wire [15:0]     frequency;
   wire [11:0]     pulsewidth;

   // Envelope Generator
   `define st_idle          3'd0
   `define st_attack        3'd1
   `define st_attack_lp     3'd2
   `define st_decay         3'd3
   `define st_decay_lp      3'd4
   `define st_sustain       3'd5
   `define st_release       3'd6
   `define st_release_lp    3'd7

   reg [2:0]   cur_state;
   reg [2:0]   next_state;

   reg [14:0]  divider_value           = 0;
   reg [14:0]  divider_attack          = 0;
   reg [14:0]  divider_dec_rel         = 0;
   reg [17:0]  divider_counter         = 0;
   reg [17:0]  exp_table_value         = 0;
   reg         exp_table_active        = 1'b0;
   reg         divider_rst             = 1'b0;
   reg [3:0]   Dec_rel                 = 0;
   reg         Dec_rel_sel             = 1'b0;

   reg [7:0]   env_counter             = 0;
   reg         env_count_hold_A        = 1'b0;
   reg         env_count_hold_B        = 1'b0;
   reg         env_cnt_up              = 1'b0;
   reg         env_cnt_clear           = 1'b0;

   reg [11:0]  signal_mux              = 0;
   reg [19:0]  signal_vol              = 0;

   ////////////////////////////////////////////////////////////////////////////////////-

   // stop the oscillator when test = 1'b1
   wire    test                   = Control[3];
   // Ring Modulation was accomplished by substituting the accumulator MSB of an
   // oscillator in the EXOR function of the triangle waveform generator with the
   // accumulator MSB of the previous oscillator. That is why the triangle waveform
   // must be selected to use Ring Modulation.
   wire    ringmod                 = Control[2];
   // Hard Sync was accomplished by clearing the accumulator of an Oscillator
   // based on the accumulator MSB of the previous oscillator.
   wire    sync                    = Control[1];
   //
   wire    gate                    = Control[0];

////////////////////////////////////////////////////////////////////////////////////-

   // output the Phase accumulator's MSB for sync and ringmod purposes
   assign PA_MSB_out              = accumulator[23];
   // output the upper 8-bits of the waveform.
   // Useful for random numbers (noise must be selected)
   assign Osc                     = signal_mux[11:4];
   // output the envelope register, for special sound effects when connecting this
   // signal to the input of other channels/voices
   assign Env                     = env_counter;
   // use the register value to fill the variable
   assign frequency               = { Freq_hi, Freq_lo };
   // use the register value to fill the variable
   assign pulsewidth              = { Pw_hi, Pw_lo };
   //
   assign voice                   = signal_vol[19:8];

   // Phase accumulator :
   // "As I recall, the Oscillator is a 24-bit phase-accumulating design of which
   // the lower 16-bits are programmable for pitch control. The output of the
   // accumulator goes directly to a D/A converter through a waveform selector.
   // Normally, the output of a phase-accumulating oscillator would be used as an
   // address into memory which contained a wavetable, but SID had to be entirely
   // self-contained and there was no room at all for a wavetable on the chip."
   // "Hard Sync was accomplished by clearing the accumulator of an Oscillator
   // based on the accumulator MSB of the previous oscillator."
   always @(posedge clk_1MHz)
     begin
        PA_MSB_in_prev <= PA_MSB_in;
        // the reset and test signal can stop the oscillator,
        // stopping the oscillator is very useful when you want to play "samples"
        if ((reset == 1'b1) | (test == 1'b1) | ((sync == 1'b1) & (PA_MSB_in_prev != PA_MSB_in) & (PA_MSB_in == 1'b0)))
          accumulator <= 0;
        else
          // accumulate the new phase (i.o.w. increment env_counter with the freq. value)
          accumulator <= accumulator + {1'b0, frequency};
     end // always @ (posedge clk_1MHz)

   // Sawtooth waveform :
   // "The Sawtooth waveform was created by sending the upper 12-bits of the
   // accumulator to the 12-bit Waveform D/A."
   always @(posedge clk_1MHz)
     begin
        sawtooth <= accumulator[23:12];
     end

   //Pulse waveform :
   // "The Pulse waveform was created by sending the upper 12-bits of the
   // accumulator to a 12-bit digital comparator. The output of the comparator was
   // either a one or a zero. This single output was then sent to all 12 bits of
   // the Waveform D/A. "
   always @(posedge clk_1MHz)
     begin
        if ((accumulator[23:12]) >= pulsewidth)
          pulse <= 1'b1;
        else
          pulse <= 1'b0;
     end

   //Triangle waveform :
   // "The Triangle waveform was created by using the MSB of the accumulator to
   // invert the remaining upper 11 accumulator bits using EXOR gates. These 11
   // bits were then left-shifted (throwing away the MSB) and sent to the Waveform
   // D/A (so the resolution of the triangle waveform was half that of the sawtooth,
   // but the amplitude and frequency were the same). "
   // "Ring Modulation was accomplished by substituting the accumulator MSB of an
   // oscillator in the EXOR function of the triangle waveform generator with the
   // accumulator MSB of the previous oscillator. That is why the triangle waveform
   // must be selected to use Ring Modulation."
   always @(posedge clk_1MHz)
     begin
        if (ringmod == 1'b0)
          begin
             // no ringmodulation
             triangle[11]<= accumulator[23] ^ accumulator[22];
             triangle[10]<= accumulator[23] ^ accumulator[21];
             triangle[9] <= accumulator[23] ^ accumulator[20];
             triangle[8] <= accumulator[23] ^ accumulator[19];
             triangle[7] <= accumulator[23] ^ accumulator[18];
             triangle[6] <= accumulator[23] ^ accumulator[17];
             triangle[5] <= accumulator[23] ^ accumulator[16];
             triangle[4] <= accumulator[23] ^ accumulator[15];
             triangle[3] <= accumulator[23] ^ accumulator[14];
             triangle[2] <= accumulator[23] ^ accumulator[13];
             triangle[1] <= accumulator[23] ^ accumulator[12];
             triangle[0] <= accumulator[23] ^ accumulator[11];
          end
        else
          // ringmodulation by the other voice [previous voice]
          begin
             triangle[11]<= PA_MSB_in ^ accumulator[22];
             triangle[10]<= PA_MSB_in ^ accumulator[21];
             triangle[9] <= PA_MSB_in ^ accumulator[20];
             triangle[8] <= PA_MSB_in ^ accumulator[19];
             triangle[7] <= PA_MSB_in ^ accumulator[18];
             triangle[6] <= PA_MSB_in ^ accumulator[17];
             triangle[5] <= PA_MSB_in ^ accumulator[16];
             triangle[4] <= PA_MSB_in ^ accumulator[15];
             triangle[3] <= PA_MSB_in ^ accumulator[14];
             triangle[2] <= PA_MSB_in ^ accumulator[13];
             triangle[1] <= PA_MSB_in ^ accumulator[12];
             triangle[0] <= PA_MSB_in ^ accumulator[11];
          end
     end

   //Noise (23-bit Linear Feedback Shift Register, max combinations = 8388607) :
   // "The Noise waveform was created using a 23-bit pseudo-random sequence
   // generator (i.e., a shift register with specific outputs fed back to the input
   // through combinatorial logic). The shift register was clocked by one of the
   // intermediate bits of the accumulator to keep the frequency content of the

   // noise waveform relatively the same as the pitched waveforms.
   // The upper 12-bits of the shift register were sent to the Waveform D/A."
   assign noise = LFSR[22:11];

   always @(posedge clk_1MHz)
     begin
        // the test signal can stop the oscillator,
        // stopping the oscillator is very useful when you want to play "samples"
        if ((reset == 1'b1) | (test == 1'b1))
          begin
             accu_bit_prev <= 1'b0;
             // the "seed" value (the value that eventually determines the output
             // pattern) may never be 1'b0 otherwise the generator "locks up"
             LFSR <= 23'b00000000000000000000001;
          end
        else
          begin
             accu_bit_prev <= accumulator[19];
             // when not equal to ...
             if (accu_bit_prev != accumulator[19])
               begin
                  LFSR[22:1] <= LFSR[21:0];
                  LFSR[0]    <= LFSR[17] ^ LFSR[22];  // see Xilinx XAPP052 for maximal LFSR taps
               end
             else
               begin
                  LFSR <= LFSR;
               end
          end
     end

   // Waveform Output selector (MUX):
   // "Since all of the waveforms were just digital bits, the Waveform Selector
   // consisted of multiplexers that selected which waveform bits would be sent
   // to the Waveform D/A. The multiplexers were single transistors and did not
   // provide a "lock-out", allowing combinations of the waveforms to be selected.
   // The combination was actually a logical ANDing of the bits of each waveform,
   // which produced unpredictable results, so I didn't encourage this, especially
   // since it could lock up the pseudo-random sequence generator by filling it
   // with zeroes."
   always @(posedge clk_1MHz)
     begin
         signal_mux[11] <= (triangle[11] & Control[4]) | (sawtooth[11] & Control[5]) | (pulse & Control[6]) | (noise[11] & Control[7]);
         signal_mux[10] <= (triangle[10] & Control[4]) | (sawtooth[10] & Control[5]) | (pulse & Control[6]) | (noise[10] & Control[7]);
         signal_mux[9]  <= (triangle[9]  & Control[4]) | (sawtooth[9]  & Control[5]) | (pulse & Control[6]) | (noise[9]  & Control[7]);
         signal_mux[8]  <= (triangle[8]  & Control[4]) | (sawtooth[8]  & Control[5]) | (pulse & Control[6]) | (noise[8]  & Control[7]);
         signal_mux[7]  <= (triangle[7]  & Control[4]) | (sawtooth[7]  & Control[5]) | (pulse & Control[6]) | (noise[7]  & Control[7]);
         signal_mux[6]  <= (triangle[6]  & Control[4]) | (sawtooth[6]  & Control[5]) | (pulse & Control[6]) | (noise[6]  & Control[7]);
         signal_mux[5]  <= (triangle[5]  & Control[4]) | (sawtooth[5]  & Control[5]) | (pulse & Control[6]) | (noise[5]  & Control[7]);
         signal_mux[4]  <= (triangle[4]  & Control[4]) | (sawtooth[4]  & Control[5]) | (pulse & Control[6]) | (noise[4]  & Control[7]);
         signal_mux[3]  <= (triangle[3]  & Control[4]) | (sawtooth[3]  & Control[5]) | (pulse & Control[6]) | (noise[3]  & Control[7]);
         signal_mux[2]  <= (triangle[2]  & Control[4]) | (sawtooth[2]  & Control[5]) | (pulse & Control[6]) | (noise[2]  & Control[7]);
         signal_mux[1]  <= (triangle[1]  & Control[4]) | (sawtooth[1]  & Control[5]) | (pulse & Control[6]) | (noise[1]  & Control[7]);
         signal_mux[0]  <= (triangle[0]  & Control[4]) | (sawtooth[0]  & Control[5]) | (pulse & Control[6]) | (noise[0]  & Control[7]);
      end

   // Waveform envelope (volume) control :
   // "The output of the Waveform D/A (which was an analog voltage at this point)
   // was fed into the reference input of an 8-bit multiplying D/A, creating a DCA
   // (digitally-controlled-amplifier). The digital control word which modulated
   // the amplitude of the waveform came from the Envelope Generator."
   // "The 8-bit output of the Envelope Generator was then sent to the Multiplying
   // D/A converter to modulate the amplitude of the selected Oscillator Waveform
   // (to be technically accurate, actually the waveform was modulating the output
   // of the Envelope Generator, but the result is the same)."
   always @(posedge clk_1MHz)
     begin
        //calculate the resulting volume (due to the envelope generator) of the
        //voice, signal_mux(12bit) * env_counter(8bit), so the result will
        //require 20 bits !!
        signal_vol  <= signal_mux * env_counter;
     end

   // Envelope generator :
   // "The Envelope Generator was simply an 8-bit up/down counter which, when
   // triggered by the Gate bit, counted from 0 to 255 at the Attack rate, from
   // 255 down to the programmed Sustain value at the Decay rate, remained at the
   // Sustain value until the Gate bit was cleared then counted down from the
   // Sustain value to 0 at the Release rate."
   //
   //          /\
   //         /  \
   //        / |  \________
   //       /  |   |       \
   //      /   |   |       |\
   //     /    |   |       | \
   //    attack|dec|sustain|rel

   // this process controls the state machine "current-state"-value
   always @(posedge clk_1MHz, posedge reset)
     begin
        if (reset == 1'b1)
          cur_state <= `st_idle;
        else
          cur_state <= next_state;
     end

   // this process controls the envelope (in other words, the volume control)
   always @(*)
     begin
        if (reset == 1'b1)
          begin
             next_state       <= `st_idle;
             env_cnt_clear    <= 1'b1;
             env_cnt_up       <= 1'b1;
             env_count_hold_B <= 1'b1;
             divider_rst      <= 1'b1;
             divider_value    <= 0;
             exp_table_active <= 1'b0;
             Dec_rel_sel      <= 1'b0;      // select decay as input for decay/release table
          end
        else
          begin
             env_cnt_clear    <= 1'b0;      // use this statement unless stated otherwise
             env_cnt_up       <= 1'b1;      // use this statement unless stated otherwise
             env_count_hold_B <= 1'b1;      // use this statement unless stated otherwise
             divider_rst      <= 1'b0;      // use this statement unless stated otherwise
             divider_value    <= 0;       // use this statement unless stated otherwise
             exp_table_active <= 1'b0;      // use this statement unless stated otherwise

             case (cur_state)

               // IDLE
               `st_idle:
                 begin
                    env_cnt_clear  <= 1'b1;     // clear envelope env_counter
                    divider_rst    <= 1'b1;
                    Dec_rel_sel    <= 1'b0;     // select decay as input for decay/release table
                    if (gate == 1'b1)
                      next_state   <= `st_attack;
                    else
                      next_state   <= `st_idle;
                 end

               `st_attack:
                 begin
                    env_cnt_clear  <= 1'b1;        // clear envelope env_counter
                    divider_rst    <= 1'b1;
                    divider_value  <= divider_attack;
                    next_state     <= `st_attack_lp;
                    Dec_rel_sel    <= 1'b0;        // select decay as input for decay/release table
                 end
               `st_attack_lp:
                 begin
                    env_count_hold_B  <= 1'b0;     // enable envelope env_counter
                    env_cnt_up        <= 1'b1;     // envelope env_counter must count up (increment)
                    divider_value     <= divider_attack;
                    Dec_rel_sel       <= 1'b0;     // select decay as input for decay/release table
                    if (env_counter == 8'hff)
                      next_state      <= `st_decay;
                    else
                      if (gate == 1'b0)
                        next_state    <= `st_release;
                      else
                        next_state    <= `st_attack_lp;
                 end

               `st_decay:
                 begin
                    divider_rst       <= 1'b1;
                    exp_table_active  <= 1'b1;     // activate exponential look-up table
                    env_cnt_up        <= 1'b0;     // envelope env_counter must count down (decrement)
                    divider_value     <= divider_dec_rel;
                    next_state        <= `st_decay_lp;
                    Dec_rel_sel       <= 1'b0;     // select decay as input for decay/release table
                 end

               `st_decay_lp:
                 begin
                    exp_table_active  <= 1'b1;     // activate exponential look-up table
                    env_count_hold_B  <= 1'b0;     // enable envelope env_counter
                    env_cnt_up        <= 1'b0;     // envelope env_counter must count down (decrement)
                    divider_value     <= divider_dec_rel;
                    Dec_rel_sel       <= 1'b0;     // select decay as input for decay/release table
                    if (env_counter[7:4] == Sus_Rel[7:4])
                      next_state      <= `st_sustain;
                    else
                      if (gate == 1'b0)
                        next_state    <= `st_release;
                      else
                        next_state    <= `st_decay_lp;
                 end

               // "A digital comparator was used for the Sustain function. The upper
               // four bits of the Up/Down counter were compared to the programmed
               // Sustain value and would stop the clock to the Envelope Generator when
               // the counter counted down to the Sustain value. This created 16 linearly
               // spaced sustain levels without havingto go through a look-up table
               // translation between the 4-bit register value and the 8-bit Envelope
               // Generator output. It also meant that sustain levels were adjustable
               // in steps of 16. Again, more register bits would have provided higher
               // resolution."
               // "When the Gate bit was cleared, the clock would again be enabled,
               // allowing the counter to count down to zero. Like an analog envelope
               // generator, the SID Envelope Generator would track the Sustain level
               // if it was changed to a lower value during the Sustain portion of the
               // envelope, however, it would not count UP if the Sustain level were set
               // higher." Instead it would count down to 1'b0.
               `st_sustain:
                 begin
                    divider_value     <= 0;
                    Dec_rel_sel          <=1'b1;         // select release as input for decay/release table
                    if (gate == 1'b0)
                      next_state      <= `st_release;
                    else
                      if (env_counter[7:4] == Sus_Rel[7:4])
                        next_state    <= `st_sustain;
                      else
                        next_state    <= `st_decay;
                 end

               `st_release:
                 begin
                    divider_rst       <= 1'b1;
                    exp_table_active  <= 1'b1;     // activate exponential look-up table
                    env_cnt_up        <= 1'b0;     // envelope env_counter must count down (decrement)
                    divider_value     <= divider_dec_rel;
                    Dec_rel_sel       <= 1'b1;     // select release as input for decay/release table
                    next_state        <= `st_release_lp;
                 end

               `st_release_lp:
                 begin
                    exp_table_active  <= 1'b1;     // activate exponential look-up table
                    env_count_hold_B  <= 1'b0;     // enable envelope env_counter
                    env_cnt_up        <= 1'b0;     // envelope env_counter must count down (decrement)
                    divider_value     <= divider_dec_rel;
                    Dec_rel_sel       <= 1'b1;     // select release as input for decay/release table
                    if (env_counter == 8'h00)
                      next_state      <= `st_idle;
                    else
                      if (gate == 1'b1)
                        next_state    <= `st_idle;
                      else
                        next_state    <= `st_release_lp;
                 end

            default:
              begin
                 divider_value  <= 0;
                 Dec_rel_sel       <= 1'b0;     // select decay as input for decay/release table
                 next_state        <= `st_idle;
              end
             endcase
          end
     end

   // 8 bit up/down env_counter
   always @(posedge clk_1MHz)
     begin
        if ((reset == 1'b1) | (env_cnt_clear == 1'b1))
          env_counter <= 0;
        else
          if ((env_count_hold_A == 1'b1) | (env_count_hold_B == 1'b1))
            env_counter <= env_counter;
          else
            if (env_cnt_up == 1'b1)
              env_counter <= env_counter + 1'b1;
            else
              env_counter <= env_counter - 1'b1;
     end

   // Divider  :
   // "A programmable frequency divider was used to set the various rates
   // (unfortunately I don't remember how many bits the divider was, either 12
   // or 16 bits). A small look-up table translated the 16 register-programmable
   // values to the appropriate number to load into the frequency divider.
   // Depending on what state the Envelope Generator was in (i.e. ADS or R), the
   // appropriate register would be selected and that number would be translated
   // and loaded into the divider. Obviously it would have been better to have
   // individual bit control of the divider which would have provided great
   // resolution for each rate, however I did not have enough silicon area for a
   // lot of register bits. Using this approach, I was able to cram a wide range
   // of rates into 4 bits, allowing the ADSR to be defined in two bytes instead
   // of eight. The actual numbers in the look-up table were arrived at
   // subjectively by setting up typical patches on a Sequential Circuits Pro-1
   // and measuring the envelope times by ear (which is why the available rates
   // seem strange)!"
   always @(posedge clk_1MHz)
     begin
        if ((reset == 1'b1) | (divider_rst == 1'b1))
          begin
             env_count_hold_A <= 1'b1;
             divider_counter   <= 0;
          end
        else
          begin
             if (divider_counter == 0)
               begin
                  env_count_hold_A  <= 1'b0;
                  if (exp_table_active == 1'b1)
                    divider_counter   <= exp_table_value;
                  else
                    divider_counter   <= divider_value;
               end
             else
               begin
                  env_count_hold_A  <= 1'b1;
                  divider_counter   <= divider_counter - 1'b1;
               end
          end
     end

   // Piese-wise linear approximation of an exponential :
   // "In order to more closely model the exponential decay of sounds, another
   // look-up table on the output of the Envelope Generator would sequentially
   // divide the clock to the Envelope Generator by two at specific counts in the
   // Decay and Release cycles. This created a piece-wise linear approximation of
   // an exponential. I was particularly happy how well this worked considering
   // the simplicity of the circuitry. The Attack, however, was linear, but this
   // sounded fine."
   // The clock is divided by two at specific values of the envelope generator to
   // create an exponential.
   always @(posedge clk_1MHz)
     begin
        if (reset == 1'b1)
          exp_table_value   <= 0;
        else
          if (env_counter < 52)
            exp_table_value <= divider_value * 16;
          else if (env_counter < 102)
            exp_table_value <= divider_value * 8;
          else if (env_counter < 153)
            exp_table_value <= divider_value * 4;
          else if (env_counter < 204)
            exp_table_value <= divider_value * 2;
          else
            exp_table_value <= divider_value;
     end

   // Attack Lookup table :
   // It takes 255 clock cycles from zero to peak value. Therefore the divider
   // equals (attack rate / clockcycletime of 1MHz clock) / 254;
   always @(posedge clk_1MHz)
     begin
        if (reset == 1'b1)
          divider_attack <= 0;
        else
          case (Att_dec[7:4])
               4'b0000: divider_attack <= 8;       //attack rate: (   2mS / 1uS per clockcycle) /254 steps
               4'b0001: divider_attack <= 31;         //attack rate: (   8mS / 1uS per clockcycle) /254 steps
               4'b0010: divider_attack <= 63;         //attack rate: (  16mS / 1uS per clockcycle) /254 steps
               4'b0011: divider_attack <= 94;         //attack rate: (  24mS / 1uS per clockcycle) /254 steps
               4'b0100: divider_attack <= 150;     //attack rate: (  38mS / 1uS per clockcycle) /254 steps
               4'b0101: divider_attack <= 220;     //attack rate: (  56mS / 1uS per clockcycle) /254 steps
               4'b0110: divider_attack <= 268;     //attack rate: (  68mS / 1uS per clockcycle) /254 steps
               4'b0111: divider_attack <= 315;     //attack rate: (  80mS / 1uS per clockcycle) /254 steps
               4'b1000: divider_attack <= 394;     //attack rate: ( 100mS / 1uS per clockcycle) /254 steps
               4'b1001: divider_attack <= 984;     //attack rate: ( 250mS / 1uS per clockcycle) /254 steps
               4'b1010: divider_attack <= 1968;    //attack rate: ( 500mS / 1uS per clockcycle) /254 steps
               4'b1011: divider_attack <= 3150;    //attack rate: ( 800mS / 1uS per clockcycle) /254 steps
               4'b1100: divider_attack <= 3937;    //attack rate: (1000mS / 1uS per clockcycle) /254 steps
               4'b1101: divider_attack <= 11811;   //attack rate: (3000mS / 1uS per clockcycle) /254 steps
               4'b1110: divider_attack <= 19685;   //attack rate: (5000mS / 1uS per clockcycle) /254 steps
               4'b1111: divider_attack <= 31496;   //attack rate: (8000mS / 1uS per clockcycle) /254 steps
               default: divider_attack <= 0;       //
            endcase
     end

   always @(Dec_rel_sel, Att_dec, Sus_Rel)
     begin
        if (Dec_rel_sel == 1'b0)
          Dec_rel  <= Att_dec[3:0];
        else
          Dec_rel  <= Sus_Rel[3:0];
     end

   // Decay Lookup table :
   // It takes 32 * 51 == 1632 clock cycles to fall from peak level to zero.
   // Release Lookup table :
   // It takes 32 * 51 == 1632 clock cycles to fall from peak level to zero.
   always @(posedge clk_1MHz)
     begin
        if (reset == 1'b1)
          divider_dec_rel <= 0;
        else
          case (Dec_rel)
               4'b0000: divider_dec_rel <= 3;         //release rate: (    6mS / 1uS per clockcycle) / 1632
               4'b0001: divider_dec_rel <= 15;     //release rate: (   24mS / 1uS per clockcycle) / 1632
               4'b0010: divider_dec_rel <= 29;     //release rate: (   48mS / 1uS per clockcycle) / 1632
               4'b0011: divider_dec_rel <= 44;     //release rate: (   72mS / 1uS per clockcycle) / 1632
               4'b0100: divider_dec_rel <= 70;     //release rate: (  114mS / 1uS per clockcycle) / 1632
               4'b0101: divider_dec_rel <= 103;    //release rate: (  168mS / 1uS per clockcycle) / 1632
               4'b0110: divider_dec_rel <= 125;    //release rate: (  204mS / 1uS per clockcycle) / 1632
               4'b0111: divider_dec_rel <= 147;    //release rate: (  240mS / 1uS per clockcycle) / 1632
               4'b1000: divider_dec_rel <= 184;    //release rate: (  300mS / 1uS per clockcycle) / 1632
               4'b1001: divider_dec_rel <= 459;    //release rate: (  750mS / 1uS per clockcycle) / 1632
               4'b1010: divider_dec_rel <= 919;    //release rate: ( 1500mS / 1uS per clockcycle) / 1632
               4'b1011: divider_dec_rel <= 1471;   //release rate: ( 2400mS / 1uS per clockcycle) / 1632
               4'b1100: divider_dec_rel <= 1838;   //release rate: ( 3000mS / 1uS per clockcycle) / 1632
               4'b1101: divider_dec_rel <= 5515;   //release rate: ( 9000mS / 1uS per clockcycle) / 1632
               4'b1110: divider_dec_rel <= 9191;   //release rate: (15000mS / 1uS per clockcycle) / 1632
               4'b1111: divider_dec_rel <= 14706;  //release rate: (24000mS / 1uS per clockcycle) / 1632
               default:  divider_dec_rel <= 0;         //
            endcase
     end

endmodule
