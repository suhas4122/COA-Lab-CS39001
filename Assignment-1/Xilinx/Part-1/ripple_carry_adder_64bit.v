/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module  ripple_carry_adder_64bit (A, B, Ci, S, Co);

    input [63:0] A, B;
    input Ci;
    output [63:0] S;
    output Co;
    wire w_temp;

    ripple_carry_adder_32bit ripple_carry_adder1(.A(A[31:0]), .B(B[31:0]), .Ci(Ci), .S(S[31:0]), .Co(w_temp));
    ripple_carry_adder_32bit ripple_carry_adder2(.A(A[63:32]), .B(B[63:32]), .Ci(w_temp), .S(S[63:32]), .Co(Co));
    
endmodule