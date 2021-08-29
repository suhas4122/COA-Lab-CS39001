/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module  ripple_carry_adder_8bit (A, B, Ci, S, Co);
    /*
        A: 8-bit input to add 
        B: 8-bit input to add 
        Ci: Input carry bit 
        S: 8-bit output sum 
        Co: Output carry bit 
    */
    input [7:0] A, B;
    input Ci;
    output [7:0] S;
    output Co;
    wire [6:0] w_temp;

    //Calculating sums by 8 individual full adders and rippling in the carry via wire w_temp    
    full_adder full_adder1(.A(A[0]), .B(B[0]), .Ci(Ci), .S(S[0]), .Co(w_temp[0]));
    full_adder full_adder2(.A(A[1]), .B(B[1]), .Ci(w_temp[0]), .S(S[1]), .Co(w_temp[1]));
    full_adder full_adder3(.A(A[2]), .B(B[2]), .Ci(w_temp[1]), .S(S[2]), .Co(w_temp[2]));
    full_adder full_adder4(.A(A[3]), .B(B[3]), .Ci(w_temp[2]), .S(S[3]), .Co(w_temp[3]));
    full_adder full_adder5(.A(A[4]), .B(B[4]), .Ci(w_temp[3]), .S(S[4]), .Co(w_temp[4]));
    full_adder full_adder6(.A(A[5]), .B(B[5]), .Ci(w_temp[4]), .S(S[5]), .Co(w_temp[5]));
    full_adder full_adder7(.A(A[6]), .B(B[6]), .Ci(w_temp[5]), .S(S[6]), .Co(w_temp[6]));
    full_adder full_adder8(.A(A[7]), .B(B[7]), .Ci(w_temp[6]), .S(S[7]), .Co(Co));
    
endmodule
