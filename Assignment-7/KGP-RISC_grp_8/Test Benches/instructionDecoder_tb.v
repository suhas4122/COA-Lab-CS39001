`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for instructionDecoder module
module instructionDecoder_testbench;

	// Inputs
	reg [31:0] instruction;

	// Outputs
	wire [5:0] op_code;
    wire [4:0] reg_1; 
    wire [4:0] reg_2; 
    wire [4:0] shift_amount; 
    wire [10:0] func_code;
    wire [15:0] imm_constant; 
    wire [20:0] offset;

	// Instantiate the Unit Under Test (UUT)
	instructionDecoder uut (
		.instruction(instruction), 
		.op_code(op_code), 
		.reg_1(reg_1), 
		.reg_2(reg_2), 
		.shift_amount(shift_amount), 
		.func_code(func_code), 
		.imm_constant(imm_constant), 
		.offset(offset)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("instruction = %b | op_code = %b | reg_1 = %b | reg_2 = %b | shift_amount = %b | func_code = %b | imm_constant = %b | offset = %b",instruction, op_code, reg_1, reg_2, shift_amount, func_code, imm_constant, offset);
		
		#10 instruction = 32'b00001110000001000000000000001010;
		#10 instruction = 32'b00101100000001001111111111100111;
		#10 instruction = 32'b00001111011000000000000000000000;

	end
      
endmodule