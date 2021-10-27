`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:53:09 10/27/2012
// Design Name:   Mux_32_1
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/Mux_32_1Test.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_32_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_32_1Test;

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
	reg [31:0] Q;
	reg [31:0] R;
	reg [31:0] S;
	reg [31:0] T;
	reg [31:0] U;
	reg [31:0] V;
	reg [31:0] W;
	reg [31:0] X;
	reg [31:0] Y;
	reg [31:0] Z;
	reg [31:0] AA;
	reg [31:0] AB;
	reg [31:0] AC;
	reg [31:0] AD;
	reg [31:0] AE;
	reg [31:0] AF;
	reg [4:0] Sel;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Mux_32_1 uut (
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
		.Q(Q), 
		.R(R), 
		.S(S), 
		.T(T), 
		.U(U), 
		.V(V), 
		.W(W), 
		.X(X), 
		.Y(Y), 
		.Z(Z), 
		.AA(AA), 
		.AB(AB), 
		.AC(AC), 
		.AD(AD), 
		.AE(AE), 
		.AF(AF), 
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
		Q = 0;
		R = 0;
		S = 0;
		T = 0;
		U = 0;
		V = 0;
		W = 0;
		X = 0;
		Y = 0;
		Z = 0;
		AA = 0;
		AB = 0;
		AC = 0;
		AD = 0;
		AE = 0;
		AF = 0;
		Sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial
		begin
		A = 32'b0; B = 32'b01; C = 32'b10; D = 32'b11; E = 32'b100; F = 32'b101; G = 32'b110; H = 32'b111; I = 32'b1000; J = 32'b1001; K = 32'b1010; L = 32'b1011; M = 32'b1100; N = 32'b1101; O = 32'b1110; P = 32'b1111; Q = 32'b10000; R = 32'b10001; S = 32'b10010; T = 32'b10011; U = 32'b10100; V = 32'b10101; W = 32'b10110; X = 32'b10111; Y = 32'b11000; Z = 32'b11001; AA = 32'b11010; AB = 32'b11011; AC = 32'b11100; AD = 32'b11101; AE = 32'b11110; AF = 32'b11111; Sel = 5'b10011;
		#10; A = 32'b0; B = 32'b01; C = 32'b10; D = 32'b11; E = 32'b100; F = 32'b101; G = 32'b110; H = 32'b111; I = 32'b1000; J = 32'b1001; K = 32'b1010; L = 32'b1011; M = 32'b1100; N = 32'b1101; O = 32'b1110; P = 32'b1111; Q = 32'b10000; R = 32'b10001; S = 32'b10010; T = 32'b10011; U = 32'b10100; V = 32'b10101; W = 32'b10110; X = 32'b10111; Y = 32'b11000; Z = 32'b11001; AA = 32'b11010; AB = 32'b11011; AC = 32'b11100; AD = 32'b11101; AE = 32'b11110; AF = 32'b11111; Sel = 5'b01010;
		end
      
endmodule

