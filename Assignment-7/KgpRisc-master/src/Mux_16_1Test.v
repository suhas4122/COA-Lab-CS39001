`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:37:27 10/27/2012
// Design Name:   Mux_16_1
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/Mux_16_1Test.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_16_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_16_1Test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [31:0] C;
	reg [31:0] D;
	reg [31:0] E;
	reg [31:0] F;
	reg [31:0] G;
	reg [31:0] H;
	reg [31:0] I;
	reg [31:0] J;
	reg [31:0] K;
	reg [31:0] L;
	reg [31:0] M;
	reg [31:0] N;
	reg [31:0] O;
	reg [31:0] P;
	reg [3:0] Sel;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Mux_16_1 uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.E(E), 
		.F(F), 
		.G(G), 
		.H(H), 
		.I(I), 
		.J(J), 
		.K(K), 
		.L(L), 
		.M(M), 
		.N(N), 
		.O(O), 
		.P(P), 
		.Sel(Sel), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		E = 0;
		F = 0;
		G = 0;
		H = 0;
		I = 0;
		J = 0;
		K = 0;
		L = 0;
		M = 0;
		N = 0;
		O = 0;
		P = 0;
		Sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
 
	initial 
		begin
			A = 32'b0; B = 32'b01; C = 32'b10; D = 32'b11; E = 32'b100; F = 32'b101; G = 32'b110; H = 32'b111; I = 32'b1000; J = 32'b1001; K = 32'b1010; L = 32'b1011; M = 32'b1100; N = 32'b1101; O = 32'b1110; P = 32'b1111; Sel = 4'b1001;
			#10; A = 32'b0; B = 32'b01; C = 32'b10; D = 32'b11; E = 32'b100; F = 32'b101; G = 32'b110; H = 32'b111; I = 32'b1000; J = 32'b1001; K = 32'b1010; L = 32'b1011; M = 32'b1100; N = 32'b1101; O = 32'b1110; P = 32'b1111; Sel = 4'b0110;
		end
 
endmodule

