module carry_look_ahead_4bit (
    A,
    B,
    Ci,
    S,
    Co
);
    input [3:0] A, B;
    input Ci;
    output [3:0] S;
    output Co;
    wire [3:0] p, g;
    wire [4:0] c;

    assign p = A ^ B;
    assign g = A & B;

    assign c[0] = Ci;
    assign c[1] = g[0] | (p[0] & Ci);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & Ci);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & Ci);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & Ci);

    assign S = p ^ c;

    assign Co = c[4];

endmodule 

