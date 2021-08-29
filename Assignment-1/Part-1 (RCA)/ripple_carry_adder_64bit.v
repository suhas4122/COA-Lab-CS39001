/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module ripple_carry_adder_64bit(A, B, Ci, S, Co);
    
    /*
        A: 63-bit input to add 
        B: 63-bit input to add 
        Ci: Input carry bit 
        S: 63-bit output sum 
        Co: Output carry bit 
    */
    
    input [63:0] A, B;
    input Ci;
    output [63:0] S;
    output Co;
    wire w_temp;

    //Calculating sums by 2 individual 32-bit ripple carry adders and rippling in the carry via wire w_temp    
    ripple_carry_adder_32bit ripple_carry_adder1(.A(A[31:0]), .B(B[31:0]), .Ci(Ci), .S(S[31:0]), .Co(w_temp));
    ripple_carry_adder_32bit ripple_carry_adder2(.A(A[63:32]), .B(B[63:32]), .Ci(w_temp), .S(S[63:32]), .Co(Co));
    
endmodule
