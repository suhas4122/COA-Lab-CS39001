`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module carry_look_ahead_16bit_tb;
    
    reg [31:0] A = 32'b0, B = 32'b0;
    reg Ci = 1'b0;
    wire [31:0] S;
    wire Co;

    carry_look_ahead_32bit uut(A, B, Ci, S, Co); 

    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);
        #10
        A = 32'b01001010010010100100101001001010;
        B = 32'b01011011010110110100101001001010;
        Ci = 1'b0;
        #10
        A = 32'b00011111000111110100101001001010;
        B = 32'b11100000111000001110000011100000;
        Ci = 1'b1;
        #10
        A = 32'b01111010011110101110000011100000;
        B = 32'b11000110110001100101101101011011;
        Ci = 1'b1;
    end

endmodule 