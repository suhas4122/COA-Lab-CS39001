`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a full adder

module full_adder (
    input A, 
    input B, 
    input Ci, 
    output wire S, 
    output wire Co
);
    
    /*
        A: Input bit to add
        B: Input bit to add
        Ci: Input carry bit 
        S: Output sum bit
        Co: Output carry bit
    */

    assign S = A ^ B ^ Ci;                         // Calulating sum bit by taking the XOR
    assign Co = (A & B) | (B & Ci) | (Ci & A);     // Calculating output carry bit by taking OR of pairwise ANDs

endmodule
