module galaksija_keyboard(
    input        clk,
    input        reset,
    input  [5:0] addr,
    input [10:0] ps2_key,
    output reg   key_out
);

reg [63:0]keys;

wire pressed    = ps2_key[9];
wire [8:0] code = ps2_key[8:0];
reg old_state;

always @(posedge clk) begin            
    old_state <= ps2_key[10];
    
   if(old_state != ps2_key[10]) begin              
                case (code[8:0])                    
                    8'h1C : keys[8'd01] = pressed; // A
                    8'h32 : keys[8'd02] = pressed; // B
                    8'h21 : keys[8'd03] = pressed; // C
                    8'h23 : keys[8'd04] = pressed; // D
                    8'h24 : keys[8'd05] = pressed; // E
                    8'h2B : keys[8'd06] = pressed; // F
                    8'h34 : keys[8'd07] = pressed; // G
                    8'h33 : keys[8'd08] = pressed; // H
                    8'h43 : keys[8'd09] = pressed; // I
                    8'h3B : keys[8'd10] = pressed; // J
                    8'h42 : keys[8'd11] = pressed; // K
                    8'h4B : keys[8'd12] = pressed; // L
                    8'h3A : keys[8'd13] = pressed; // M
                    8'h31 : keys[8'd14] = pressed; // N
                    8'h44 : keys[8'd15] = pressed; // O
                    8'h4D : keys[8'd16] = pressed; // P
                    8'h15 : keys[8'd17] = pressed; // Q
                    8'h2D : keys[8'd18] = pressed; // R
                    8'h1B : keys[8'd19] = pressed; // S
                    8'h2C : keys[8'd20] = pressed; // T
                    8'h3C : keys[8'd21] = pressed; // U
                    8'h2A : keys[8'd22] = pressed; // V
                    8'h1D : keys[8'd23] = pressed; // W
                    8'h22 : keys[8'd24] = pressed; // X
                    8'h35 : keys[8'd25] = pressed; // Y
                    8'h1A : keys[8'd26] = pressed; // Z                
                                                            
                    8'h29 : keys[8'd31] = pressed; // SPACE                
                    8'h45 : keys[8'd32] = pressed; // 0
                    8'h16 : keys[8'd33] = pressed; // 1
                    8'h1E : keys[8'd34] = pressed; // 2
                    8'h26 : keys[8'd35] = pressed; // 3
                    8'h25 : keys[8'd36] = pressed; // 4
                    8'h2E : keys[8'd37] = pressed; // 5
                    8'h36 : keys[8'd38] = pressed; // 6
                    8'h3D : keys[8'd39] = pressed; // 7
                    8'h3E : keys[8'd40] = pressed; // 8
                    8'h46 : keys[8'd41] = pressed; // 9
                    
                    // NUM Block
                    8'h70 : keys[8'd32] = pressed; // 0
                    8'h69 : keys[8'd33] = pressed; // 1
                    8'h72 : keys[8'd34] = pressed; // 2
                    8'h7A : keys[8'd35] = pressed; // 3
                    8'h6B : keys[8'd36] = pressed; // 4
                    8'h73 : keys[8'd37] = pressed; // 5
                    8'h74 : keys[8'd38] = pressed; // 6
                    8'h6C : keys[8'd39] = pressed; // 7
                    8'h75 : keys[8'd40] = pressed; // 8
                    8'h7D : keys[8'd41] = pressed; // 9                
                    
                    8'h4C : keys[8'd42] = pressed; // ; 
                    8'h7C : keys[8'd43] = pressed; // : 
                    8'h41 : keys[8'd44] = pressed; // ,
                    8'h55 : keys[8'd45] = pressed; // = 
                    8'h49 : keys[8'd46] = pressed; // .
                    8'h4A : keys[8'd47] = pressed; // /                
                    8'h5A : keys[8'd48] = pressed; // ENTER
                    8'h76 : keys[8'd49] = pressed; // ESC
                    
                    8'h05 : keys[8'd50] = pressed; // F1 = Repeat
                    8'h71 : keys[8'd51] = pressed; // DELETE
                    8'h06 : keys[8'd52] = pressed; // F2 = List
                    
                    8'h12,                                 // SHIFT L
                    8'h59 : keys[8'd53] = pressed; // SHIFT R
                    
                endcase

					 // These accept extended codes as well
                case (code[7:0])     
                    8'h75 : keys[8'd27] = pressed; // UP
                    8'h72 : keys[8'd28] = pressed; // DOWN                    
                    8'h66,                         // BACKSPACE
						  
                    8'h6B : keys[8'd29] = pressed; // LEFT                    
                    8'h74 : keys[8'd30] = pressed; // RIGHT
                endcase
            
    end
    
    key_out <= keys[addr];
    
end        
endmodule  
