/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module carry_look_ahead_4bit (A, B, Ci, S, Co);
    
    /*
        A: 4-bit input to add 
        B: 4-bit input to add 
        Ci: Input carry bit 
        S: 4-bit output sum 
        Co: Output carry bit 
    */

    input [3:0] A, B;
    input Ci;
    output [3:0] S;
    output Co;
    wire [3:0] P, G;
    wire [4:0] C;
    
    //calculating Generate and Propagate signals 
    assign P = A ^ B;
    assign G = A & B;

    //calculating the carry output Boolean function of each stage in a 4 stage carry look-ahead adder
    assign C[0] = Ci;
    assign C[1] = G[0] | (P[0] & Ci);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Ci);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Ci);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Ci);

    assign S = P ^ C;   // Calulating sum bit by taking the XOR

    assign Co = C[4];   // Calculating output carry bit

endmodule 

