module  ripple_carry_adder_32bit (
    A,
    B,
    Ci,
    S,
    Co
);

    input [31:0] A, B;
    input Ci;
    output [31:0] S;
    output Co;
    wire w_temp;

    ripple_carry_adder_16bit ripple_carry_adder1(.A(A[15:0]), .B(B[15:0]), .Ci(Ci), .S(S[15:0]), .Co(w_temp));
    ripple_carry_adder_16bit ripple_carry_adder2(.A(A[31:16]), .B(B[31:16]), .Ci(w_temp), .S(S[31:16]), .Co(Co));
    
endmodule