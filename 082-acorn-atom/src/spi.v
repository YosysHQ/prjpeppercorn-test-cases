// 0x0  read data
// 0x0  write data
// 0x01 write dummy 0xff
// 0x02 write dummy 0x00
// 0x03 set cs
// 0x04 clr cs 

module spi
  (
   input            clk,
   input            reset,
   input            enable,
   input            rnw,
   input [2:0]      addr,
   input [7:0]      din,
   output reg [7:0] dout,
   input            miso,
   output reg       mosi,
   output reg       ss,
   output reg       sclk
   );

`define spi_init  5'b00000
`define spi_s0    5'b00001
`define spi_s1    5'b00010
`define spi_s2    5'b00011
`define spi_s3    5'b00100
`define spi_s4    5'b00101
`define spi_s5    5'b00110
`define spi_s6    5'b00111
`define spi_s7    5'b01000
`define spi_s8    5'b01001
`define spi_s9    5'b01010
`define spi_s10   5'b01011
`define spi_s11   5'b01100
`define spi_s12   5'b01101
`define spi_s13   5'b01110
`define spi_s14   5'b01111
`define spi_s15   5'b10000
`define spi_s16   5'b10001
`define spi_s17   5'b10010

   reg [4:0] state;
   reg [7:0] serial_out;
   reg [7:0] serial_in;
   reg [17:0] count;

//------------------------------------------------------------
// Process Copies SPI port word to appropriate ctrl register
//------------------------------------------------------------
   always @(posedge clk, posedge reset)
     begin
        if (reset)
          begin
             state      <= `spi_init;
             ss         <= 1'b1;
             mosi       <= 1'b1;
             sclk       <= 1'b0;
             serial_out <= 8'hff;
             count      <= 0;
          end
        else
          begin             
             if (state == `spi_init)
               begin
                  if (count == 180255) // 32 * 88 * 64 + 31
                    begin
                       state <= `spi_s0;
                       sclk  <= 1'b0;
                       ss    <= 1'b0;
                    end
                  else
                    begin
                       sclk  <= count[5]; // 250 KHz
                       count <= count + 1;
                    end
               end
             else if (enable && !rnw )
               begin
                  if (addr == 3'b010)
                    begin
                       serial_out <= 8'h00;
                       state <= `spi_s1;
                    end
                  else if (addr == 3'b001)
                    begin
                       serial_out <= 8'hff;                       
                       state <= `spi_s1;
                    end
                  else if (addr == 3'b000)
                    begin
                       serial_out <= din;
                       state <= `spi_s1;
                    end
                  else if (addr == 3'b011)
                    begin
                       ss <= 1'b1;
                    end
                  else if (addr == 3'b100)
                    begin
                       ss <= 1'b0;
                    end
                  else if (addr == 3'b101)
                    begin
                       sclk <= 1'b1;
                    end
                  else if (addr == 3'b110)
                    begin
                       sclk <= 1'b0;
                    end
                  else if (addr == 3'b111)
                    begin
                       state      <= `spi_init;
                       ss         <= 1'b1;
                       mosi       <= 1'b1;
                       sclk       <= 1'b0;
                       serial_out <= 8'hff;
                       count       <= 0;
                    end
               end
             else
               case (state)  // Address state machine                 
                 `spi_s1  : begin state <= `spi_s2;  sclk <= 1'b0; mosi <= serial_out[7]; end
                 `spi_s2  : begin state <= `spi_s3;  sclk <= 1'b1; end
                 `spi_s3  : begin state <= `spi_s4;  sclk <= 1'b0; mosi <= serial_out[6]; serial_in[7] <= miso; end //serial_in
                 `spi_s4  : begin state <= `spi_s5;  sclk <= 1'b1; end
                 `spi_s5  : begin state <= `spi_s6;  sclk <= 1'b0; mosi <= serial_out[5]; serial_in[6] <= miso; end
                 `spi_s6  : begin state <= `spi_s7;  sclk <= 1'b1; end
                 `spi_s7  : begin state <= `spi_s8;  sclk <= 1'b0; mosi <= serial_out[4]; serial_in[5] <= miso; end
                 `spi_s8  : begin state <= `spi_s9;  sclk <= 1'b1; end
                 `spi_s9  : begin state <= `spi_s10; sclk <= 1'b0; mosi <= serial_out[3]; serial_in[4] <= miso; end
                 `spi_s10 : begin state <= `spi_s11; sclk <= 1'b1; end
                 `spi_s11 : begin state <= `spi_s12; sclk <= 1'b0; mosi <= serial_out[2]; serial_in[3] <= miso; end
                 `spi_s12 : begin state <= `spi_s13; sclk <= 1'b1; end
                 `spi_s13 : begin state <= `spi_s14; sclk <= 1'b0; mosi <= serial_out[1]; serial_in[2] <= miso; end
                 `spi_s14 : begin state <= `spi_s15; sclk <= 1'b1; end
                 `spi_s15 : begin state <= `spi_s16; sclk <= 1'b0; mosi <= serial_out[0]; serial_in[1] <= miso; end
                 `spi_s16 : begin state <= `spi_s17; sclk <= 1'b1; end
                 `spi_s17 : begin state <= `spi_s0;  sclk <= 1'b0; mosi <= 1'b0; serial_in[0] <= miso; end
                 default  : begin state <= `spi_s0; end // return to idle state
               endcase

             dout <= serial_in;

          end

     end // always @ (posedge clk, posedge reset)

endmodule // spi



