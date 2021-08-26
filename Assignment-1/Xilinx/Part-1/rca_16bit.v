`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:01 08/26/2021 
// Design Name: 
// Module Name:    rca_16bit 
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
module  rca_16bit (
    A,
    B,
    Ci,
    S,
    Co
);

    input [15:0] A, B;
    input Ci;
    output [15:0] S;
    output Co;
    wire w_temp;

    rca_8bit ripple_carry_adder1(.A(A[7:0]), .B(B[7:0]), .Ci(Ci), .S(S[7:0]), .Co(w_temp));
    rca_8bit ripple_carry_adder2(.A(A[15:8]), .B(B[15:8]), .Ci(w_temp), .S(S[15:8]), .Co(Co));
    
endmodule