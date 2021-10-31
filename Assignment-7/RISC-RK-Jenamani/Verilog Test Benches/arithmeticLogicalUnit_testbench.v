`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:25:39 11/12/2019
// Design Name:   arithmeticLogicalUnit
// Module Name:   C:/Users/Rajat Kumar Jenamani/Desktop/KGP_RISC (2)/KGP_RISC/arithmeticLogicalUnit_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arithmeticLogicalUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module arithmeticLogicalUnit_testbench;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] selector;

	// Outputs
	wire [31:0] out;
	wire [31:0] out_extension;
	wire carry;
	wire zero;
	wire sign;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	arithmeticLogicalUnit uut (
		.A(A), 
		.B(B), 
		.selector(selector), 
		.out(out), 
		.out_extension(out_extension), 
		.carry(carry), 
		.zero(zero), 
		.sign(sign), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		selector = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("selector=%b,A=%b,B=%b,out=%b,out_extension=%b,carry=%b,zero=%b,sign=%b,overflow=%b",selector,A,B,out,out_extension,carry,zero,sign,overflow);
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 0;
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 1; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 2; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 3; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 4; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 5; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 6; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 7; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 8; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; selector = 9; 
		#10;

		$finish;
	end
      
endmodule

