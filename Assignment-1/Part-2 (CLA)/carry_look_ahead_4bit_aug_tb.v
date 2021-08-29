/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

`timescale  1ns/1ps

module carry_look_ahead_4bit_aug_tb;
    
    /*
        A: 3-bit input to add 
        B: 3-bit input to add 
        Ci: Input carry bit 
        S: 3-bit output sum 
        Co: Output carry bit 
        PG: Output Group Propagate bit
        GG: Output Group Generate bit
    */
    reg [3:0] A = 4'b0, B = 4'b0;
    reg Ci = 1'b0;
    wire [3:0] S;
    wire Co, PG, GG;

    carry_look_ahead_4bit_aug carry_look_ahead(A, B, Ci, S, Co, PG, GG);
    //Connecting the registers and wires to actual 4-bit augmented CLA design using structural modeling

    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b, PG = %b, GG = %b", A, B, Ci, S, Co, PG, GG);
        // Printing the output after each iteration 
        // Assigning different values to input bits and testing the outputs
        #10
        A = 4'b0100;
        B = 4'b0101;
        Ci = 1'b0;
        #10
        A = 4'b0101;
        B = 4'b1010;
        Ci = 1'b1;
        #10
        A = 4'b0111;
        B = 4'b1100;
        Ci = 1'b1;
        #10
        A = 4'b1011;
        B = 4'b1001;
        Ci = 1'b1;
    end

endmodule
