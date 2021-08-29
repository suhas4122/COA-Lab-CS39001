/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module carry_look_ahead_4bit_aug(A, B, Ci, S, Co, PG, GG);
    
     /*
        A: 3-bit input to add 
        B: 3-bit input to add 
        Ci: Input carry bit 
        S: 3-bit output sum 
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
