/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module half_adder (A, B, S, Co);

    input A, B;
    output S, Co;

    assign S = A ^ B;
    assign Co = A & B;

endmodule 