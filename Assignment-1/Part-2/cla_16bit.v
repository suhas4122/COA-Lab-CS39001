module CLA16(A, B, Ci, S, Co, PG1, GG1);

    input [15:0] A;
    input [15:0] B;
    input Ci;
    output [15:0] S;
    output Co;
    output PG1;
    output GG1;

    wire [3:0] GG;
    wire [3:0] PG;
    wire [3:1] C;
    wire Ci;

    CLALogic CarryLogic_2 (GG[3:0], PG[3:0], Ci, C[3:1], Co, PG1, GG1);

    // 4bit    A     B       Ci     S   PG        GG    Co
    CLA4 u0 (A[3:0], B[3:0], Ci, S[3:0], PG[0], GG[0]);
    CLA4 u1 (A[7:4], B[7:4], C[1],  S[7:4], PG[1], GG[1]);
    CLA4 u2 (A[11:8], B[11:8], C[2], S[11:8], PG[2], GG[2]);
    CLA4 u3 (A[15:12], B[15:12], C[3], S[15:12], PG[3], GG[3]);

endmodule