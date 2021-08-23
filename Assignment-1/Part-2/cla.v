module CLA4(A, B, Ci, S, Co, PG, GG);

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

    assign C[0] = Ci;
    assign C[1] = G[0] | (P[0] & Ci);
    assign C[2] = G[1] | (P[1] & G[0])| (P[1] & P[0] & Ci);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0])| (P[2] & P[1] & P[0] & Ci);

    assign G = A & B;
    assign P = A ^ B;
    assign S = A ^ B ^ C;

    assign PG_int = P[3] & P[2] & P[1] & P[0];
    assign GG_int = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    assign Co = GG_int | (PG_int & Ci);
    assign PG = PG_int;
    assign GG = GG_int;

endmodule

// module CLALogic (G, P, Ci, C, Co, PG, GG);

//     input [3:0] G;
//     input [3:0] P;
//     input Ci;
//     output [3:0] C;
//     output Co;
//     output PG;
//     output GG;

//     wire GG_int;
//     wire PG_int;
    
//     assign C[1] = G[0] | (P[0] & Ci);
//     assign C[2] = G[1] | (P[1] & G[0])| (P[1] & P[0] & Ci);
//     assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0])| (P[2] & P[1] & P[0] & Ci);


//     assign PG_int = P[3] & P[2] & P[1] & P[0];
//     assign GG_int = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
//     assign Co = GG_int | (PG_int & Ci);
//     assign PG = PG_int;
//     assign GG = GG_int;

// endmodule

// module GPFullAdder(X, Y, Cin, G, P, Sum);

//     input X;
//     input Y;
//     input Cin;
//     output G;
//     output P;
//     output Sum;

//     wire P_int;

//     assign G = X & Y;
//     assign P = P_int;
//     assign P_int = X ^ Y;
//     assign Sum = P_int ^ Cin;

// endmodule