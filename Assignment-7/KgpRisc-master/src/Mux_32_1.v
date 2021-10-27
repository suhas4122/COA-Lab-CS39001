`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:46 10/27/2012 
// Design Name: 
// Module Name:    Mux_32_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux_32_1(
	input [31:0] A,
	input [31:0] B,
	input [31:0] C,
	input [31:0] D,
	input [31:0] E,
	input [31:0] F,
	input [31:0] G,
	input [31:0] H,
	input [31:0] I,
	input [31:0] J,
	input [31:0] K,
	input [31:0] L,
	input [31:0] M,
	input [31:0] N,
	input [31:0] O,
	input [31:0] P,
	input [31:0] Q,
	input [31:0] R,
	input [31:0] S,
	input [31:0] T,
	input [31:0] U,
	input [31:0] V,
	input [31:0] W,
	input [31:0] X,
	input [31:0] Y,
	input [31:0] Z,
	input [31:0] AA,
	input [31:0] AB,
	input [31:0] AC,
	input [31:0] AD,
	input [31:0] AE,
	input [31:0] AF,
	input [4:0] Sel,
	output [31:0] Out
    );
	 
	 wire [31:0] out;
	 wire [31:0] MuxOut1;
	 wire [31:0] MuxOut2;
	 wire [3:0] S1;
	 wire S2;
	 
	 assign S1[0] = Sel[0];
	 assign S1[1] = Sel[1];
	 assign S1[2] = Sel[2];
	 assign S1[3] = Sel[3];
	 assign S2 = Sel[4];
	 
	 Mux_16_1 m1(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,S1,MuxOut1);
	 Mux_16_1 m2(Q,R,S,T,U,V,W,X,Y,Z,AA,AB,AC,AD,AE,AF,S1,MuxOut2);
	 Mux_2_1 m3(MuxOut1,MuxOut2,S2,out);
	 
	 assign Out = out;
	 
endmodule
