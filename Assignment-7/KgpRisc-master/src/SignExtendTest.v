`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:40:32 10/31/2012
// Design Name:   SignExtend
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/SignExtendTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignExtendTest;

	// Inputs
	reg [15:0] In;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.In(In), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		In = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial
		begin
			In = 16'b0000000000001010;
			#10; In = 16'b1100001110000101;
		end
      
endmodule

