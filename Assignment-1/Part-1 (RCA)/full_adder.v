/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module full_adder (A, B, Ci, S, Co);
    
    /*
        A: Input bit to add
        B: Input bit to add
        Ci: Input carry bit 
        S: Output sum bit
        Co: Output carry bit
    */

    input A, B, Ci;
    output S, Co;

    assign S = A ^ B ^ Ci;                         // Caalulating sum bit by taking the XOR
    assign Co = (A & B) | (B & Ci) | (Ci & A);     // Calculating output carry bit by taking OR of pairwise ANDs

endmodule