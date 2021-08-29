/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

`timescale  1ns/1ps

module ripple_carry_adder_64bit_tb;
    
    reg [63:0] A = 64'b0, B = 64'b0;
    reg Ci = 1'b0;
    wire [63:0] S;
    wire Co;

    ripple_carry_adder_64bit ripple_carry_adder(A, B, Ci, S, Co);

    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);
        #10
        A = 64'b0100101001001010010010100100101001001010010010100100101001001010;
        B = 64'b0101101101011011010110110101101101011011010110110101101101011011;
        Ci = 1'b0;
        #10
        A = 64'b0001111100011111000111110001111100011111000111110001111100011111;
        B = 64'b1110000011100000111000001110000011100000111000001110000011100000;
        Ci = 1'b1;
        #10
        A = 64'b0111101001111010011110100111101001111010011110100111101001111010;
        B = 64'b1100011011000110110001101100011011000110110001101100011011000110;
        Ci = 1'b1;
    end

endmodule 