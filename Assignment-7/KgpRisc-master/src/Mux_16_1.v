`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:42 10/27/2012 
// Design Name: 
// Module Name:    Mux_16_1 
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
module Mux_16_1(
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
	input [3:0] Sel,
	output [31:0] Out
    );
	 
	 wire [31:0] out;
	 wire [31:0] MuxOut1;
	 wire [31:0] MuxOut2;
	 wire [31:0] MuxOut3;
	 wire [31:0] MuxOut4;
	 wire [1:0] S1;
	 wire [1:0] S2;
	
	 assign S1[0] = Sel[0];
	 assign S1[1] = Sel[1];
	 assign S2[0] = Sel[2];
	 assign S2[1] = Sel[3];
	 
	 Mux_4_1 m1(A,B,C,D,S1,MuxOut1);
	 Mux_4_1 m2(E,F,G,H,S1,MuxOut2);
	 Mux_4_1 m3(I,J,K,L,S1,MuxOut3);
	 Mux_4_1 m4(M,N,O,P,S1,MuxOut4);
	 Mux_4_1 m5(MuxOut1,MuxOut2,MuxOut3,MuxOut4,S2,out);
	 
	 assign Out = out;
	 
endmodule
