module CLA4(A, B, Ci, S, PG, GG);

    input [3:0] A;
    input [3:0] B;
    input Ci;
    output [3:0] S;
    //output Co;
    output PG;
    output GG;
    wire Ci;
    wire [3:0] G;
    wire [3:0] P;
    wire [3:1] C;

    CLALogic CarryLogic (G, P, Ci, C, Co, PG, GG);
    GPFullAdder FA0 (A[0], B[0], Ci, G[0], P[0], S[0]);
    GPFullAdder FA1 (A[1], B[1], C[1], G[1], P[1], S[1]);
    GPFullAdder FA2 (A[2], B[2], C[2], G[2], P[2], S[2]);
    GPFullAdder FA3 (A[3], B[3], C[3], G[3], P[3], S[3]);

endmodule

module CLALogic (G, P, Ci, C, Co, PG, GG);

    input [3:0] G;
    input [3:0] P;
    input Ci;
    output [3:1] C;
    output Co;
    output PG;
    output GG;

    wire GG_int;
    wire PG_int;

    assign C[1] = G[0] | (P[0] & Ci);
    assign C[2] = G[1] | (P[1] & G[0])| (P[1] & P[0] & Ci);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0])| (P[2] & P[1] & P[0] & Ci);


    assign PG_int = P[3] & P[2] & P[1] & P[0];
    assign GG_int = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    assign Co = GG_int | (PG_int & Ci);
    assign PG = PG_int;
    assign GG = GG_int;

endmodule

module GPFullAdder(X, Y, Cin, G, P, Sum);

    input X;
    input Y;
    input Cin;
    output G;
    output P;
    output Sum;

    wire P_int;

    assign G = X & Y;
    assign P = P_int;
    assign P_int = X ^ Y;
    assign Sum = P_int ^ Cin;

endmodule