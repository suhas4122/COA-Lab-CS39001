`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:43:50 10/15/2012
// Design Name:   Mux_2_1
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/Mux_2_1Test.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_2_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_2_1Test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg Sel;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Mux_2_1 uut (
		.A(A), 
		.B(B), 
		.Sel(Sel), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial
		begin
			A = 32'b01; B = 32'b10; Sel = 1'b0;
			#10; A = 32'b01; B = 32'b10; Sel = 1'b1;
      end
		
endmodule

