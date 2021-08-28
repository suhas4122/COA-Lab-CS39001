/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module carry_look_ahead_16bit(A, B, Ci, S, Co, PG1, GG1);

    input [15:0] A, B;
    input Ci;
    output [15:0] S;
    output Co, PG1, GG1;
    wire [3:0] GG, PG, Cdummy;
    wire [3:1] C;
    wire Ci;

    assign C[1] = GG[0] | (PG[0] & Ci);
    assign C[2] = GG[1] | (PG[1] & GG[0])| (PG[1] & PG[0] & Ci);
    assign C[3] = GG[2] | (PG[2] & GG[1]) | (PG[2] & PG[1] & GG[0])| (PG[2] & PG[1] & PG[0] & Ci);

    carry_look_ahead_4bit_aug carry_look_ahead1 (A[3:0], B[3:0], Ci, S[3:0], Cdummy[0], PG[0], GG[0]);
    carry_look_ahead_4bit_aug carry_look_ahead2 (A[7:4], B[7:4], C[1],  S[7:4], Cdummy[1], PG[1], GG[1]);
    carry_look_ahead_4bit_aug carry_look_ahead3 (A[11:8], B[11:8], C[2], S[11:8], Cdummy[2], PG[2], GG[2]);
    carry_look_ahead_4bit_aug carry_look_ahead4 (A[15:12], B[15:12], C[3], S[15:12], Cdummy[3], PG[3], GG[3]);

    assign PG_int = PG[3] & PG[2] & PG[1] & PG[0];
    assign GG_int = GG[3] | (PG[3] & GG[2]) | (PG[3] & PG[2] & GG[1]) | (PG[3] & PG[2] & PG[1] & GG[0]);
    assign Co = GG_int | (PG_int & Ci);
    assign PG1 = PG_int;
    assign GG1 = GG_int;

endmodule
