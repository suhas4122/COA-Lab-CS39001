/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

`timescale  1ns/1ps

module ripple_carry_adder_32bit_tb;
    
    /*
        A: 32-bit input to add 
        B: 32-bit input to add 
        Ci: Input carry bit 
        S: 32-bit output sum 
        Co: Output carry bit 
    */
    
    reg [31:0] A = 32'b0, B = 32'b0;
    reg Ci = 1'b0;
    wire [31:0] S;
    wire Co;

    ripple_carry_adder_32bit ripple_carry_adder(A, B, Ci, S, Co);
    //Connecting the registers and wires to actual 32-bit RCA design using structural modeling
    
    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);
        // Printing the output after each iteration 
        // Assigning different values to input bits and testing the outputs
        #10
        A = 32'b01001010010010100100101001001010;
        B = 32'b01011011010110110101101101011011;
        Ci = 1'b0;
        #10
        A = 32'b00011111000111110001111100011111;
        B = 32'b11100000111000001110000011100000;
        Ci = 1'b1;
        #10
        A = 32'b01111010011110100111101001111010;
        B = 32'b11000110110001101100011011000110;
        Ci = 1'b1;
    end

endmodule 
