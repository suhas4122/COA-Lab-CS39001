`timescale  1ns/1ps

module carry_look_ahead_4bit_tb;
    
    reg [3:0] A = 4'b0, B = 4'b0;
    reg Ci = 1'b0;
    wire [3:0] S;
    wire Co, PG, GG;

    carry_look_ahead_4bit carry_look_ahead(A, B, Ci, S, Co, PG, GG);

    initial begin
        $monitor("i_term1 = %b, i_term2 = %b, i_carry = %b, o_sum = %b, o_carry = %b, PG = %b, GG = %b", A, B, Ci, S, Co, PG, GG);
        #10
        A = 4'b0100;
        B = 4'b0101;
        Ci = 1'b0;
        #10
        A = 4'b0101;
        B = 4'b1010;
        Ci = 1'b1;
        #10
        A = 4'b0111;
        B = 4'b1100;
        Ci = 1'b1;
        #10
        A = 4'b1011;
        B = 4'b1001;
        Ci = 1'b1;
    end

endmodule