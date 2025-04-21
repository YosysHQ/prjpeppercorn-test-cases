module keyboard
  (
   input            CLK,
   input            nRESET,
   input            PS2_CLK,
   input            PS2_DATA,
   output reg [5:0] KEYOUT,
   input [3:0]      ROW,
   output reg       SHIFT_OUT,
   output reg       CTRL_OUT,
   output reg       REPEAT_OUT,
   output reg       BREAK_OUT,
   output reg [1:0] TURBO = 2'b00
   );



   // ===============================================================
   // PS/2 keyboard interface
   // ===============================================================

   wire [7:0]       keyb_data;
   wire             keyb_valid;
   wire             keyb_error;

   ps2_intf ps2
     (
      .CLK    (CLK),
      .nRESET (nRESET),
      .PS2_CLK  (PS2_CLK),
      .PS2_DATA (PS2_DATA),
      .DATA  (keyb_data),
      .VALID (keyb_valid),
      .error (keyb_error)
      );

   // ===============================================================
   // Atom Matrix
   // ===============================================================

   reg             rel;
   reg             extended;
   reg [5:0]       keys [0:15];

   always @(*)
     begin
        KEYOUT <= keys[ROW];
     end

   always @(posedge CLK, negedge nRESET)
     begin
        if (!nRESET)
          begin
             rel        <= 1'b0;
             extended   <= 1'b0;
             BREAK_OUT  <= 1'b1;
             SHIFT_OUT  <= 1'b1;
             CTRL_OUT   <= 1'b1;
             REPEAT_OUT <= 1'b1;
             keys[0]    <= 6'b111111;
             keys[1]    <= 6'b111111;
             keys[2]    <= 6'b111111;
             keys[3]    <= 6'b111111;
             keys[4]    <= 6'b111111;
             keys[5]    <= 6'b111111;
             keys[6]    <= 6'b111111;
             keys[7]    <= 6'b111111;
             keys[8]    <= 6'b111111;
             keys[9]    <= 6'b111111;
             keys[10]   <= 6'b111111;
             keys[11]   <= 6'b111111;
             keys[12]   <= 6'b111111;
             keys[13]   <= 6'b111111;
             keys[14]   <= 6'b111111;
             keys[15]   <= 6'b111111;
             TURBO      <= 2'b00;
          end
        else
          begin
             if (keyb_valid)
               if (keyb_data == 8'he0)
                 extended <= 1'b1;
               else if (keyb_data == 8'hf0)
                 rel <= 1'b1;
               else
                 begin
                    rel  <= 1'b0;
                    extended <= 1'b0;
                    case (keyb_data)
                      8'h05: TURBO      <= 2'b00; // F1 (1MHz)
                      8'h06: TURBO      <= 2'b01; // F2 (2MMz)
                      8'h04: TURBO      <= 2'b10; // F3 (4MHz)
                      8'h0C: TURBO      <= 2'b11; // F4 (8MHz)
                      8'h09: BREAK_OUT  <= rel;  // F10 (BREAK)
                      8'h11: REPEAT_OUT <= rel;  // LEFT ALT (SHIFT LOCK)
                      8'h12, 8'h59:
                        if (!extended) // Ignore fake shifts
                          SHIFT_OUT  <= rel; // Left SHIFT // Right SHIFT
                      8'h14: CTRL_OUT   <= rel;  // LEFT/RIGHT CTRL (CTRL)

                      8'h29: keys[9][0] <= rel;  // SPACE
                      8'h54: keys[8][0] <= rel;  // [
                      8'h5D: keys[7][0] <= rel;  // \
                      8'h5B: keys[6][0] <= rel;  // ]
                      8'h0D: keys[5][0] <= rel;  // UP
                      8'h58: keys[4][0] <= rel;  // CAPS LOCK
                      8'h74: keys[3][0] <= rel;  // RIGHT
                      8'h75: keys[2][0] <= rel;  // UP

                      8'h5A: keys[6][1] <= rel;  // RETURN
                      8'h69: keys[5][1] <= rel;  // END (COPY)
                      8'h66: keys[4][1] <= rel;  // BACKSPACE (DELETE)
                      8'h45: keys[3][1] <= rel;  // 0
                      8'h16: keys[2][1] <= rel;  // 1
                      8'h1E: keys[1][1] <= rel;  // 2
                      8'h26: keys[0][1] <= rel;  // 3

                      8'h25: keys[9][2] <= rel;  // 4
                      8'h2E: keys[8][2] <= rel;  // 5
                      8'h36: keys[7][2] <= rel;  // 6
                      8'h3D: keys[6][2] <= rel;  // 7
                      8'h3E: keys[5][2] <= rel;  // 8
                      8'h46: keys[4][2] <= rel;  // 9
                      8'h52: keys[3][2] <= rel;  // '   full colon substitute
                      8'h4C: keys[2][2] <= rel;  // ;
                      8'h41: keys[1][2] <= rel;  // ,
                      8'h4E: keys[0][2] <= rel;  // -

                      8'h49: keys[9][3] <= rel;  // .
                      8'h4A: keys[8][3] <= rel;  // /
                      8'h55: keys[7][3] <= rel;  // @ (TAB)
                      8'h1C: keys[6][3] <= rel;  // A
                      8'h32: keys[5][3] <= rel;  // B
                      8'h21: keys[4][3] <= rel;  // C
                      8'h23: keys[3][3] <= rel;  // D
                      8'h24: keys[2][3] <= rel;  // E
                      8'h2B: keys[1][3] <= rel;  // F
                      8'h34: keys[0][3] <= rel;  // G

                      8'h33: keys[9][4] <= rel;  // H
                      8'h43: keys[8][4] <= rel;  // I
                      8'h3B: keys[7][4] <= rel;  // J
                      8'h42: keys[6][4] <= rel;  // K
                      8'h4B: keys[5][4] <= rel;  // L
                      8'h3A: keys[4][4] <= rel;  // M
                      8'h31: keys[3][4] <= rel;  // N
                      8'h44: keys[2][4] <= rel;  // O
                      8'h4D: keys[1][4] <= rel;  // P
                      8'h15: keys[0][4] <= rel;  // Q

                      8'h2D: keys[9][5] <= rel;  // R
                      8'h1B: keys[8][5] <= rel;  // S
                      8'h2C: keys[7][5] <= rel;  // T
                      8'h3C: keys[6][5] <= rel;  // U
                      8'h2A: keys[5][5] <= rel;  // V
                      8'h1D: keys[4][5] <= rel;  // W
                      8'h22: keys[3][5] <= rel;  // X
                      8'h35: keys[2][5] <= rel;  // Y
                      8'h1A: keys[1][5] <= rel;  // Z
                      8'h76: keys[0][5] <= rel;  // ESCAPE

                    endcase

                 end
          end
     end

endmodule



