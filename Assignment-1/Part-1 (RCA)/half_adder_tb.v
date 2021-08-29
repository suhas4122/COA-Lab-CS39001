/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

`timescale 1ns/1ps

module half_adder_tb;

   /*
        A: Input bit to add
        B: Input bit to add
        Ci: Input carry bit 
        S: Output sum bit
        Co: Output carry bit
    */
 
    reg A = 1'b0;
    reg B = 1'b0;
    wire S;
    wire Co;
    
   half_adder half_adder_inst(A, B, S, Co); 
   //Connecting the registers and wires to half adder design using structural modeling
   
    
    initial begin
        $monitor("A = %b, B = %b, S = %b, Co = %b", A, B, S, Co);
        // Printing the output after each iteration
        // Assigning different values to input bits and testing the outputs
        #10
        A = 1'b0;
        B = 1'b0;
        #10;
        A = 1'b0;
        B = 1'b1;
        #10;
        A = 1'b1;
        B = 1'b0;
        #10;
        A = 1'b1;
        B = 1'b1;
    end 
 
endmodule
