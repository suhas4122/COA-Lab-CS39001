/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module ripple_carry_adder_32bit(A, B, Ci, S, Co);
    
    /*
        A: 32-bit input to add 
        B: 32-bit input to add 
        Ci: Input carry bit 
        S: 32-bit output sum 
        Co: Output carry bit 
    */
    
    input [31:0] A, B;
    input Ci;
    output [31:0] S;
    output Co;
    wire w_temp;
    
    //Calculating sums by 2 individual 16-bit ripple carry adders and rippling in the carry via wire w_temp    
    ripple_carry_adder_16bit ripple_carry_adder1(.A(A[15:0]), .B(B[15:0]), .Ci(Ci), .S(S[15:0]), .Co(w_temp));
    ripple_carry_adder_16bit ripple_carry_adder2(.A(A[31:16]), .B(B[31:16]), .Ci(w_temp), .S(S[31:16]), .Co(Co));
    
endmodule
