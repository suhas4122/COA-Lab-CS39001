`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:51:26 11/12/2019
// Design Name:   instructionDecoder
// Module Name:   C:/Users/Rajat Kumar Jenamani/Desktop/KGP_RISC (2)/KGP_RISC/instructionDecoder_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instructionDecoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instructionDecoder_testbench;

	// Inputs
	reg [31:0] instruction;

	// Outputs
	wire [1:0] op;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [3:0] func;
	wire [15:0] offset;

	// Instantiate the Unit Under Test (UUT)
	instructionDecoder uut (
		.instruction(instruction), 
		.op(op), 
		.rs(rs), 
		.rt(rt), 
		.func(func), 
		.offset(offset)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("instruction = %b | op = %b | rs = %b | rt = %b | func = %b | offset = %b",instruction,op,rs,rt,func,offset);
		
		#10 instruction = 32'b00001110000001000000000000001010;
		#10 instruction = 32'b00101100000001001111111111100111;
		#10 instruction = 32'b00001111011000000000000000000000;

	end
      
endmodule

