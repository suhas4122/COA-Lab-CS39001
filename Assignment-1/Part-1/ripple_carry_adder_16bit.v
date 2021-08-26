/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module  ripple_carry_adder_16bit (
    A,
    B,
    Ci,
    S,
    Co
);

    input [15:0] A, B;
    input Ci;
    output [15:0] S;
    output Co;
    wire w_temp;

    ripple_carry_adder_8bit ripple_carry_adder1(.A(A[7:0]), .B(B[7:0]), .Ci(Ci), .S(S[7:0]), .Co(w_temp));
    ripple_carry_adder_8bit ripple_carry_adder2(.A(A[15:8]), .B(B[15:8]), .Ci(w_temp), .S(S[15:8]), .Co(Co));
    
endmodule