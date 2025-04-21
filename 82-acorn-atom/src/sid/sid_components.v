
// =================================================================
//
// Delta-Sigma DAC
//
// Refer to Xilinx Application Note XAPP154.
//
// This DAC requires an external RC low-pass filter:
//
//   dac_o 0//-XXXXX//-+//-0 analog audio
//              3k3    |
//                    === 4n7
//                     |
//                    GND
//
// =================================================================
//Implementation Digital to Analog converter

module pwm_sddac
  (
   input            clk_i,
   input            reset,
   input [msbi_g:0] dac_i,
   output           dac_o
   );

   parameter msbi_g = 9;

   reg [msbi_g+2 : 0] sig_in = 0;
   reg                dac_o_int;

   always @(posedge clk_i)
     begin
        // Disabling reset as the DC offset causes a noticable click
        // if reset = '1' then
        //   sig_in <= to_unsigned(2**(msbi_g+1), sig_in'length);
        //   dac_o_int  <= not dac_o_int;
        // else
        sig_in <= sig_in + { sig_in[msbi_g+2], sig_in[msbi_g+2] , dac_i};
        dac_o_int <= sig_in[msbi_g+2];
     end

  assign dac_o = dac_o_int;

endmodule

// =================================================================

module pwm_sdadc
  (
   input clk, // main clock signal (the higher the better)
   input reset,
   output reg [7:0] ADC_out, // binary input of signal to be converted
   input ADC_in // "analog" paddle input pin
   );

   // Dummy implementation (no real A/D conversion performed)
   always @(posedge clk)
	  if (ADC_in)
		 ADC_out <= 8'hff;
	  else
		 ADC_out <= 8'h00;
endmodule // pwm_sdadc
