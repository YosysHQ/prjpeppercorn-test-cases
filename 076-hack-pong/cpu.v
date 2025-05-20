/**
 * The Hack CPU (Central Processing unit), consisting of an ALU,
 * two registers named A and D, and a program counter named PC.
 * The CPU is designed to fetch and execute instructions written in 
 * the Hack machine language. In particular, functions as follows:
 * Executes the inputted instruction according to the Hack machine 
 * language specification. The D and A in the language specification
 * refer to CPU-resident registers, while M refers to the external
 * memory location addressed by A, i.e. to Memory[A]. The inM input 
 * holds the value of this location. If the current instruction needs 
 * to write a value to M, the value is placed in outM, the address 
 * of the target location is placed in the addressM output, and the 
 * writeM control bit is asserted. (When writeM==0, any value may 
 * appear in outM). The outM and writeM outputs are combinational: 
 * they are affected instantaneously by the execution of the current 
 * instruction. The addressM and pc outputs are clocked: although they 
 * are affected by the execution of the current instruction, they commit 
 * to their new values only in the next time step. If reset==1 then the 
 * CPU jumps to address 0 (i.e. pc is set to 0 in next time step) rather 
 * than to the address resulting from executing the current instruction. 
 */

`default_nettype none
module cpu(
	input clk,
	input [15:0] inM,			// M value input  (M = contents of RAM[A])
	input [15:0] instruction,	// Instruction for execution
	input reset,				// Signals whether to re-start the current
								// program (reset==1) or continue executing
								// the current program (reset==0).
	output [15:0] outM,			// M value output
	output writeM,				// Write to M? 
	output [14:0] addressM,		// Address in data memory (of M) to read
	output [14:0] pc			// address of next instruction
);
	
	assign addressM = regA;
	wire c_instruction = instruction[15]&instruction[14]&instruction[13];
	wire a_instruction = ~c_instruction;
	reg [15:0] regA = 16'h0000;
	always @(posedge clk)
		if (reset) regA <= 16'h0000;
		else if (a_instruction) regA <= instruction;
		else if (c_instruction & instruction[5]) regA <= outM;

	wire [15:0] am = instruction[12] ? inM : regA;
	wire zr;
	wire ng;
	alu ALU(
		.x(regD),
		.y(am),
		.zx(instruction[11]),
		.nx(instruction[10]),
		.zy(instruction[9]),
		.ny(instruction[8]),
		.f(instruction[7]),
		.no(instruction[6]),
		.out(outM),
		.zr(zr),
		.ng(ng)
	);
	
	reg [15:0] regD = 16'h0000;
	always @(posedge clk)
		if (reset) regD <= 16'h0000;
		else if (c_instruction & instruction[4]) regD <= outM;
	assign writeM = c_instruction & instruction[3];

	wire jlt = instruction[2] & ng;
	wire jeq = instruction[1] & zr;
	wire jgt = instruction[0] & (~zr & ~ng);

	
	reg [14:0] pc = 15'h0000;
	always @(posedge clk)
		if (reset) pc <= 15'h0000;
		else if (instruction[15] & (jlt|jgt|jeq)) pc <= regA;
		else pc <= pc + 1;
	
endmodule
