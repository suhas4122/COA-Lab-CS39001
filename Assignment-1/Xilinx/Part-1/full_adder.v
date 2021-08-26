`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:48 08/26/2021 
// Design Name: 
// Module Name:    full_adder 
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
module full_adder (
    A, 
    B, 
    Ci,
    S, 
    Co
);
    
    input A, B, Ci;
    output S, Co;

    assign S = A ^ B ^ Ci;
    assign Co = (A & B) | (B & Ci) | (Ci & A);

endmodule
