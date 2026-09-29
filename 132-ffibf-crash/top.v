module top
  (input  CLK12M,
   input  in0,
   output out0);
  wire s_in0_delayed1;
  wire s_in0_delayed2;
  wire s_in0;
  wire s_in0_delayed1_2;
  reg n8_q;
  reg n9_q;
  assign out0 = s_in0_delayed2; //(module output)
  /* top.vhd:97:16  */
  assign s_in0_delayed1 = n8_q; // (signal)
  /* top.vhd:98:16  */
  assign s_in0_delayed2 = n9_q; // (signal)
  /* top.vhd:99:16  */
  assign s_in0 = in0; // (signal)
  /* top.vhd:100:16  */
  assign s_in0_delayed1_2 = s_in0_delayed1; // (signal)
  /* top.vhd:111:17  */
  always @(posedge CLK12M)
    n8_q <= s_in0;
  /* top.vhd:111:17  */
  always @(posedge CLK12M)
    n9_q <= s_in0_delayed1_2;
endmodule

