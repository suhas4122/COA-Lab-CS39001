`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a test bench for full adder


module full_adder_tb;
    /*
        A: Input bit to add
        B: Input bit to add
        Ci: Input carry bit 
        S: Output sum bit
        Co: Output carry bit
    */

    reg A = 1'b0, B = 1'b0;
    reg Ci = 1'b0;
    wire S;
    wire Co;
    
    full_adder full_adder_inst(A, B, Ci, S, Co);  //Connecting the registers and wires to actual full adder design using structural modeling
    
    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);  // Printing the output after each iteration
        // Assigning different values to input bits and testing the outputs
        #10;
        A = 1'b0;
        B = 1'b0;
        Ci = 1'b1;
        #10;
        A = 1'b0;
        B = 1'b1;
        Ci = 1'b0;
        #10;
        A = 1'b0;
        B = 1'b1;
        Ci = 1'b1;
        #10;
        A = 1'b1;
        B = 1'b0;
        Ci = 1'b0;
        #10;
        A = 1'b1;
        B = 1'b0;
        Ci = 1'b1;
        #10;
        A = 1'b1;
        B = 1'b1;
        Ci = 1'b0;
        #10;
        A = 1'b1;
        B = 1'b1;
        Ci = 1'b1;
    end 
 
endmodule
