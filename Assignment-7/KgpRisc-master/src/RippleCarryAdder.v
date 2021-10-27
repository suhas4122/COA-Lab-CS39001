`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:26 10/16/2012 
// Design Name: 
// Module Name:    RippleCarryAdder 
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
module RippleCarryAdder(
	input [31:0] A,
	input [31:0] B,
	output [31:0] S,
	output cout1,
	output overflow
    );

	wire [31:0] Cout;
	
	FullAdder fa0(A[0],B[0],1'b0,S[0],Cout[0]);
	FullAdder fa1(A[1],B[1],Cout[0],S[1],Cout[1]);
	FullAdder fa2(A[2],B[2],Cout[1],S[2],Cout[2]);
	FullAdder fa3(A[3],B[3],Cout[2],S[3],Cout[3]);
	FullAdder fa4(A[4],B[4],Cout[3],S[4],Cout[4]);
	FullAdder fa5(A[5],B[5],Cout[4],S[5],Cout[5]);
	FullAdder fa6(A[6],B[6],Cout[5],S[6],Cout[6]);
	FullAdder fa7(A[7],B[7],Cout[6],S[7],Cout[7]);
	FullAdder fa8(A[8],B[8],Cout[7],S[8],Cout[8]);
	FullAdder fa9(A[9],B[9],Cout[8],S[9],Cout[9]);
	FullAdder fa10(A[10],B[10],Cout[9],S[10],Cout[10]);
	FullAdder fa11(A[11],B[11],Cout[10],S[11],Cout[11]);
	FullAdder fa12(A[12],B[12],Cout[11],S[12],Cout[12]);
	FullAdder fa13(A[13],B[13],Cout[12],S[13],Cout[13]);
	FullAdder fa14(A[14],B[14],Cout[13],S[14],Cout[14]);
	FullAdder fa15(A[15],B[15],Cout[14],S[15],Cout[15]);
	FullAdder fa16(A[16],B[16],Cout[15],S[16],Cout[16]);
	FullAdder fa17(A[17],B[17],Cout[16],S[17],Cout[17]);
	FullAdder fa18(A[18],B[18],Cout[17],S[18],Cout[18]);
	FullAdder fa19(A[19],B[19],Cout[18],S[19],Cout[19]);
	FullAdder fa20(A[20],B[20],Cout[19],S[20],Cout[20]);
	FullAdder fa21(A[21],B[21],Cout[20],S[21],Cout[21]);
	FullAdder fa22(A[22],B[22],Cout[21],S[22],Cout[22]);
	FullAdder fa23(A[23],B[23],Cout[22],S[23],Cout[23]);
	FullAdder fa24(A[24],B[24],Cout[23],S[24],Cout[24]);
	FullAdder fa25(A[25],B[25],Cout[24],S[25],Cout[25]);
	FullAdder fa26(A[26],B[26],Cout[25],S[26],Cout[26]);
	FullAdder fa27(A[27],B[27],Cout[26],S[27],Cout[27]);
	FullAdder fa28(A[28],B[28],Cout[27],S[28],Cout[28]);
	FullAdder fa29(A[29],B[29],Cout[28],S[29],Cout[29]);
	FullAdder fa30(A[30],B[30],Cout[29],S[30],Cout[30]);
	FullAdder fa31(A[31],B[31],Cout[30],S[31],Cout[31]);
	
	assign cout1 = Cout[31];
	assign overflow = cout1 ^ Cout[30];

endmodule
