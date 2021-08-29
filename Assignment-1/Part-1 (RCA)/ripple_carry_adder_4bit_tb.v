/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

`timescale  1ns/1ps

module ripple_carry_adder_4bit_tb;

    /*
        A: 4-bit input to add 
        B: 4-bit input to add 
        Ci: Input carry bit 
        S: 4-bit output sum 
        Co: Output carry bit 
    */

    reg [3:0] A = 4'b0, B = 4'b0;
    reg Ci = 1'b0;
    wire [3:0] S;
    wire Co;

    ripple_carry_adder_4bit ripple_carry_adder(A, B, Ci, S, Co); //Connecting the registers and wires to actual 4-bit RCA design using structural modeling

    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);  
        // Printing the output after each iteration 
        // Assigning different values to input bits and testing the outputs
        #10
        A = 4'b0100;
        B = 4'b0101;
        Ci = 1'b0;
        #10
        A = 4'b0001;
        B = 4'b1110;
        Ci = 1'b1;
        #10
        A = 4'b0111;
        B = 4'b1100;
        Ci = 1'b1;
    end

endmodule 
