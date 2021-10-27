`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:41:11 10/15/2012
// Design Name:   Mux_4_1
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/Mux_4_1Test.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_4_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_4_1Test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [31:0] C;
	reg [31:0] D;
	reg [1:0] Sel;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Mux_4_1 uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.Sel(Sel), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		Sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial 
		begin
			A = 32'b00; B = 32'b01; C = 32'b10; D = 32'b11; Sel = 2'b00;
			#10; A = 32'b00; B = 32'b01; C = 32'b10; D = 32'b11; Sel = 2'b01;
			#10; A = 32'b00; B = 32'b01; C = 32'b10; D = 32'b11; Sel = 2'b10;
			#10; A = 32'b00; B = 32'b01; C = 32'b10; D = 32'b11; Sel = 2'b11;
		end
      
endmodule

