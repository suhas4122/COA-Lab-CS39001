/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

`timescale  1ns/1ps

module ripple_carry_adder_8bit_tb;
    
    reg [7:0] A = 8'b00000000, B = 8'b00000000;
    reg Ci = 1'b0;
    wire [7:0] S;
    wire Co;

    ripple_carry_adder_8bit ripple_carry_adder(A, B, Ci, S, Co);

    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);
        #10
        A = 8'b01001010;
        B = 8'b01011011;
        Ci = 1'b0;
        #10
        A = 8'b00011111;
        B = 8'b11100000;
        Ci = 1'b1;
        #10
        A = 8'b01111010;
        B = 8'b11000110;
        Ci = 1'b1;
    end

endmodule 