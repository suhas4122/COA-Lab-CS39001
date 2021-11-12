`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module carry_look_ahead_4bit_aug(A, B, Ci, S, Co, PG, GG);
    
     /*
        A: 4-bit input to add 
        B: 4-bit input to add 
        Ci: Input carry bit 
        S: 4-bit output sum 
        Co: Output carry bit 
        PG: Output Group Propagate bit
        GG: Output Group Generate bit
    */
    
    input [3:0] A;
    input [3:0] B;
    input Ci;
    output [3:0] S;
    output Co;
    output PG;
    output GG;
    wire Ci;
    wire [3:0] G;
    wire [3:0] P;
    wire [3:0] C;

    assign G = A & B;
    assign P = A ^ B;
    assign S = A ^ B ^ C;  //calculating the sum bit by taking the XOR

    assign C[0] = Ci;
    assign C[1] = G[0] | (P[0] & Ci);
    assign C[2] = G[1] | (P[1] & G[0])| (P[1] & P[0] & Ci);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0])| (P[2] & P[1] & P[0] & Ci);
    
    //calculating the group propagate (PG) and group generate (GG) values to further use the CLA in higher-level circuits
    assign PG_int = P[3] & P[2] & P[1] & P[0];
    assign GG_int = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    assign Co = GG_int | (PG_int & Ci);   // Calculating output carry bit by taking OR
    assign PG = PG_int;
    assign GG = GG_int;

endmodule

module carry_look_ahead_16bit(A, B, Ci, S, Co);
    
    /*
        A: 16-bit input to add 
        B: 16-bit input to add 
        Ci: Input carry bit 
        S: 16-bit output sum 
        Co: Output carry bit 
        PG1: Output PG bits
        GG1: Output GG bits
    */

    input [15:0] A, B;
    input Ci;
    output [15:0] S;
    output Co;
    wire PG1, GG1;
    wire [3:0] GG, PG, Cdummy;
    wire [3:1] C;
    wire Ci;

    assign C[1] = GG[0] | (PG[0] & Ci);
    assign C[2] = GG[1] | (PG[1] & GG[0])| (PG[1] & PG[0] & Ci);
    assign C[3] = GG[2] | (PG[2] & GG[1]) | (PG[2] & PG[1] & GG[0])| (PG[2] & PG[1] & PG[0] & Ci);
    
    //calculates sums by 4 individual carry look ahead adders that return PG and GG values 
    carry_look_ahead_4bit_aug carry_look_ahead1 (A[3:0], B[3:0], Ci, S[3:0], Cdummy[0], PG[0], GG[0]);
    carry_look_ahead_4bit_aug carry_look_ahead2 (A[7:4], B[7:4], C[1],  S[7:4], Cdummy[1], PG[1], GG[1]);
    carry_look_ahead_4bit_aug carry_look_ahead3 (A[11:8], B[11:8], C[2], S[11:8], Cdummy[2], PG[2], GG[2]);
    carry_look_ahead_4bit_aug carry_look_ahead4 (A[15:12], B[15:12], C[3], S[15:12], Cdummy[3], PG[3], GG[3]);
    
    //calculates output  PG  and  GG  bits that can be further used in higher-level circuits
    assign PG_int = PG[3] & PG[2] & PG[1] & PG[0];
    assign GG_int = GG[3] | (PG[3] & GG[2]) | (PG[3] & PG[2] & GG[1]) | (PG[3] & PG[2] & PG[1] & GG[0]);
    assign Co = GG_int | (PG_int & Ci);
    assign PG1 = PG_int;
    assign GG1 = GG_int;

endmodule


module carry_look_ahead_32bit(A, B, Ci, S, Co);
    
    /*
        A: 32-bit input to add 
        B: 32-bit input to add 
        Ci: Input carry bit 
        S: 32-bit output sum 
        Co: Output carry bit 
    */
    
    input [31:0] A, B;
    input Ci;
    output [31:0] S;
    output Co;
    wire w_temp;
    
    //Calculating sums by 4 individual 4-bit carry look ahead adders and rippling in the carry via wire w_temp    
    carry_look_ahead_16bit carry_look_ahead1 (A[15:0], B[15:0], Ci, S[15:0], w_temp);
    carry_look_ahead_16bit carry_look_ahead2 (A[31:16], B[31:16], w_temp, S[31:16], Co);

endmodule