`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:29:37 08/26/2021 
// Design Name: 
// Module Name:    rca_4bit 
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
module rca_4bit(
	A,
    B,
    Ci,
    S,
    Co
);

    input [3:0] A, B;
    input Ci;
    output [3:0] S;
    output Co;
    wire [2:0] w_temp;

    full_adder full_adder1(.A(A[0]), .B(B[0]), .Ci(Ci), .S(S[0]), .Co(w_temp[0]));
    full_adder full_adder2(.A(A[1]), .B(B[1]), .Ci(w_temp[0]), .S(S[1]), .Co(w_temp[1]));
    full_adder full_adder3(.A(A[2]), .B(B[2]), .Ci(w_temp[1]), .S(S[2]), .Co(w_temp[2]));
    full_adder full_adder4(.A(A[3]), .B(B[3]), .Ci(w_temp[2]), .S(S[3]), .Co(Co));
  
endmodule
