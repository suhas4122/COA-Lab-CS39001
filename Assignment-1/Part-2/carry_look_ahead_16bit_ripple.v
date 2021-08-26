/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module carry_look_ahead_16bit_ripple(A, B, Ci, S, Co);

    input [15:0] A, B;
    input Ci;
    output [15:0] S;
    output Co;
    wire [2:0] w_temp;
    wire [3:0] GG_dummy, PG_dummy;

    carry_look_ahead_4bit carry_look_ahead1 (A[3:0], B[3:0], Ci, S[3:0], w_temp[0], PG_dummy[0], GG_dummy[0]);
    carry_look_ahead_4bit carry_look_ahead2 (A[7:4], B[7:4], w_temp[0], S[7:4], w_temp[1], PG_dummy[1], GG_dummy[1]);
    carry_look_ahead_4bit carry_look_ahead3 (A[11:8], B[11:8], w_temp[1], S[11:8], w_temp[2], PG_dummy[2], GG_dummy[2]);
    carry_look_ahead_4bit carry_look_ahead4 (A[15:12], B[15:12], w_temp[2], S[15:12], Co, PG_dummy[3], GG_dummy[3]);
 
endmodule