/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

`timescale 1ns/1ps

module half_adder_tb;
 
    reg A = 1'b0;
    reg B = 1'b0;
    wire S;
    wire Co;
    
    half_adder half_adder_inst(A, B, S, Co);
    
    initial begin
        $monitor("A = %b, B = %b, S = %b, Co = %b", A, B, S, Co);
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