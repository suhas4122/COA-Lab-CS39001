`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:24:51 10/16/2012
// Design Name:   RippleCarryAdder
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/RippleCarryAdderTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RippleCarryAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RippleCarryAdderTest;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] S;
	wire cout1;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	RippleCarryAdder uut (
		.A(A), 
		.B(B), 
		.S(S), 
		.cout1(cout1), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
   end
	
	initial
		begin
		A = 32'b011; B = 32'b010;
		#10; A = 32'b01; B = 32'b10;
		#10; A = 32'b0; B = 32'b0;
		#10; A = 32'b11111111111111111111111111111111; B = 32'b00000000000000000000000000000001;
		end
      
endmodule

