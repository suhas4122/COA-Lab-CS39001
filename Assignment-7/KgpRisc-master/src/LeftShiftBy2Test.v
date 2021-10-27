`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:28:41 11/01/2012
// Design Name:   LeftShiftBy2
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/LeftShiftBy2Test.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LeftShiftBy2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LeftShiftBy2Test;

	// Inputs
	reg [31:0] In;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	LeftShiftBy2 uut (
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
			In = 32'b10;
			#10; In = 32'b1010;
			#10; In = 32'b11110000111100001111000011110000;
		end
      
endmodule

