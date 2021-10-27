`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:46:29 10/31/2012
// Design Name:   SignExtend_5to32
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/SignExtend_5to32Test.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtend_5to32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignExtend_5to32Test;

	// Inputs
	reg [4:0] In;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	SignExtend_5to32 uut (
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
			In = 5'b01100;
			#10; In = 5'b10110;
		end
      
endmodule

