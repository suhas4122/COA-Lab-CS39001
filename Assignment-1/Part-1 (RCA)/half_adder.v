/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module half_adder (A, B, S, Co);

    /*
        A: Input bit to add
        B: Input bit to add
        Ci: Input carry bit 
        S: Output sum bit
        Co: Output carry bit
    */
    input A, B;
    output S, Co;

    assign S = A ^ B;           // Calulating sum bit by taking the XOR
    assign Co = A & B;          // Calculating output carry bit by taking AND of the input bits

endmodule 
