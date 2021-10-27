`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:57:29 10/15/2012
// Design Name:   BranchCheck
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/BranchCheckTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BranchCheck
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BranchCheckTest;

	// Inputs
	reg [31:0] X;
	reg [1:0] BrSel;

	// Outputs
	wire BrFlag;

	// Instantiate the Unit Under Test (UUT)
	BranchCheck uut (
		.X(X), 
		.BrSel(BrSel), 
		.BrFlag(BrFlag)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		BrSel = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial 
		begin
			X=32'b0; BrSel=2'b00; 
			#10 X=32'b01; BrSel=2'b01;
			#10 X=32'b0; BrSel=2'b10;
      end
		
endmodule

