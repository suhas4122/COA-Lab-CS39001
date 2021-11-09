`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	wire [31:0] a;
	wire [31:0] b;
	wire [3:0] control;
    wire ab_set;

	// Outputs
	wire [31:0] result;
	wire carry_flag;
    wire zero_flag;
	wire sign_flag;

	// Instantiate the Unit Under Test (UUT)
	arithmeticLogicalUnit uut (
		.a(a), 
		.b(b), 
		.control(control), 
		.result(result), 
		.zero_flag(zero_flag), 
		.carry_flag(carry_flag), 
		.sign_flag(sign_flag), 
		.overflow_flag(overflow_flag)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		control = 0;
        ab_set = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here

		
	end
      
endmodule