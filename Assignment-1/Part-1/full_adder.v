/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module full_adder (A, B, Ci, S, Co);
    
    input A, B, Ci;
    output S, Co;

    assign S = A ^ B ^ Ci;
    assign Co = (A & B) | (B & Ci) | (Ci & A);

endmodule