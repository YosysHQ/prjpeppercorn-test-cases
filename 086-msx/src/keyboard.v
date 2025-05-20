`default_nettype none
module keyboard (
  input clk,
  input reset,
  input clk_ena,
  input k_map,
  output pause,
  output scroll,
  output reso,
  // | b7  | b6   | b5   | b4   | b3  | b2  | b1  | b0  |
  // | SHI | --   | PgUp | PgDn | F9  | F10 | F11 | F12 |
  output [7:0] f_keys,
  input [10:0] ps2_key,
  input [7:0] ppi_port_c,
  output reg [7:0] p_key_x,
  output [7:0] diag
);

  reg [2:0]  mtx_state;
  reg        r_pause;
  reg        r_scroll;
  reg        r_reso;
  reg [7:0]  o_f_keys;
  reg        ps2_shift;
  reg        ps2_ctrl;
  wire [7:0]  o_key_col;
  reg [7:0]  i_key_col;

  assign reso = r_reso;
  assign pause = r_pause;
  assign scroll = r_scroll;
  assign f_keys = o_f_keys;

  wire ps2_ext = ps2_key[8];
  wire ps2_brk = ps2_key[9];
  wire [7:0] ps2_dat = ps2_key[7:0];
  wire [8:0] key_id = ps2_key[8:0];
  reg ps2_chg = 0;
  reg [10:0] mtx_idx = 0;
  wire [7:0]  mtx_ptr;
  reg [7:0] key_row = 0;
  reg       key_we = 0;

  assign diag = o_key_col;

  integer i;

  localparam Mtx_Idle = 0,
	     Mtx_Settle = 1,
	     Mtx_Clean = 2,
	     Mtx_Read = 3,
	     Mtx_Write = 4,
	     Mtx_End = 5;

  always @(posedge clk) begin
    if (reset) begin
      mtx_state <= Mtx_Idle;
      r_pause <= 1'b0;
      r_scroll <= 1'b0;
      r_reso <= 1'b0;
      o_f_keys <= 8'd0;
      ps2_shift <= 1'b0;
      ps2_ctrl <= 1'b0;
      i_key_col <= 8'd0;
      ps2_chg <= 1'b0;
      mtx_idx <= 11'd0;
      key_row <= 8'd0;
      key_we <= 1'b0;
      p_key_x <= 8'hff;
    end else if (clk_ena) begin
      // Key matrix state machine
      case (mtx_state) 
        Mtx_Idle:
	  begin
            if (ps2_chg) begin
              if (k_map) begin // English
                mtx_state <= Mtx_Settle;
		mtx_idx <= {2'b00, key_id};
              end else begin // Japanese
                mtx_state <= Mtx_Read;
		mtx_idx <= {2'b10, key_id};
              end
	      p_key_x <= 8'hff;
            end else begin
              // Return the matrix when in idle state
	      for (i=0; i<8; i=i+1) begin
	        p_key_x[i] <= !o_key_col[i];
	      end
	      // Special case for shift key
              if (k_map && ppi_port_c[3:0] == 4'b0110)
                 p_key_x[0] <= !ps2_shift;  
              if (k_map && ppi_port_c[3:0] == 4'b0110)
                 p_key_x[1] <= !ps2_ctrl;  
	      key_row <= {4'b0, ppi_port_c[3:0]};
            end
          end
        Mtx_Settle:
          begin
            mtx_state <= Mtx_Clean;
            key_we <= 0;
	    // mtx_ptr now has col, row
	    key_row <= {4'b0, mtx_ptr[3:0]};
          end
        Mtx_Clean:
          begin
            mtx_state <= Mtx_Read;
	    // Unset bit for selected column
	    key_we <= 1;
	    i_key_col <= o_key_col;
	    i_key_col[mtx_ptr[6:4]] <= 0;
	    mtx_idx <= {2'b0, key_id};
          end
	Mtx_Read:
          begin
            mtx_state <= Mtx_Write;
	    // Read current row value into o_key_col
	    key_we <= 0;
	    key_row <= {4'b0, mtx_ptr[3:0]};
          end
	Mtx_Write:
          begin
            mtx_state <= Mtx_End;
	    // Set bit into i_key_col and write it back
	    key_we <= 1;
	    i_key_col <= o_key_col;
	    i_key_col[mtx_ptr[6:4]] <= !ps2_brk;
          end
	Mtx_End:
          begin
            mtx_state <= Mtx_Idle;
	    key_we <= 0;
	    key_row <= {4'b0, ppi_port_c[3:0]};
	    ps2_chg <= 0;
          end
      endcase
    end

    if (ps2_key[10]) begin
      ps2_chg <= 1;

      // Keys available to control the core
      if (ps2_dat == 8'h77 && ps2_ext) begin // pause/break (not working)
        if (!ps2_brk)
          r_pause <= !r_pause;
        ps2_chg <= 0;
      end else if (ps2_dat == 8'h7c && ps2_ext) begin // print screen
        if (!ps2_brk) 
	  r_reso <= !r_reso;
      end else if (ps2_dat == 8'h7d && ps2_ext) begin // PgUp
        if (!ps2_brk) 
          o_f_keys[5] <= !o_f_keys[5];
      end else if (ps2_dat == 8'h7a && ps2_ext) begin // PgDn
        if (!ps2_brk) 
          o_f_keys[4] <= !o_f_keys[4];
      end else if (ps2_dat == 8'h01 && !ps2_ext) begin // F9
        if (!ps2_brk) 
          o_f_keys[3] <= !o_f_keys[3];
      end else if (ps2_dat == 8'h09 && !ps2_ext) begin // F10
        if (!ps2_brk) 
          o_f_keys[2] <= !o_f_keys[2];
      end else if (ps2_dat == 8'h78 && !ps2_ext) begin // F11
        if (!ps2_brk) 
          o_f_keys[1] <= !o_f_keys[1];
      end else if (ps2_dat == 8'h07 && !ps2_ext) begin // F12
        if (!ps2_brk) 
          o_f_keys[0] <= !o_f_keys[0];
      end else if (ps2_dat == 8'h7e && !ps2_ext) begin // Scroll lock
        if (!ps2_brk) 
          r_scroll <= !r_scroll;
      end else if ((ps2_dat == 8'h12 || ps2_dat == 8'h59) && !ps2_ext) begin // Shift
	o_f_keys[7] <= !ps2_brk;
	ps2_shift <= !ps2_brk;
	ps2_chg <= 0;
      end else if (ps2_dat == 8'h14) begin // Ctrl
	ps2_ctrl <= !ps2_brk;
	ps2_chg <= 0;
      end 
    end
  end

  keymap map (
    .clk(clk),
    .addr(mtx_idx),
    .dbi(mtx_ptr)
  );

  keyram ram (
    .clk(clk),
    .addr(key_row),
    .we(key_we),
    .din(i_key_col),
    .dout(o_key_col)
  );

endmodule

