module CLA16(A, B, Ci, S, Co, PG, GG);

    input [15:0] A;
    input [15:0] B;
    input Ci;
    output [15:0] S;
    output Co;

    output [3:0] GG;
    output [3:0] PG;
    wire [3:1] C;
    wire Ci;
    wire [3:0] Cdummy;

    assign C[1] = GG[0] | (PG[0] & Ci);
    assign C[2] = GG[1] | (PG[1] & GG[0])| (PG[1] & PG[0] & Ci);
    assign C[3] = GG[2] | (PG[2] & GG[1]) | (PG[2] & PG[1] & GG[0])| (PG[2] & PG[1] & PG[0] & Ci);

    CLA4 u0 (A[3:0], B[3:0], Ci, S[3:0], Cdummy[0], PG[0], GG[0]);
    CLA4 u1 (A[7:4], B[7:4], C[1],  S[7:4], Cdummy[1], PG[1], GG[1]);
    CLA4 u2 (A[11:8], B[11:8], C[2], S[11:8], Cdummy[2], PG[2], GG[2]);
    CLA4 u3 (A[15:12], B[15:12], C[3], S[15:12], Cdummy[3], PG[3], GG[3]);

    assign PG_int = PG[3] & PG[2] & PG[1] & PG[0];
    assign GG_int = GG[3] | (PG[3] & GG[2]) | (PG[3] & PG[2] & GG[1]) | (PG[3] & PG[2] & PG[1] & GG[0]);
    assign Co = GG_int | (PG_int & Ci);

endmodule
