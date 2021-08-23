`timescale  1ns/1ps

module carry_look_ahead_4bit_tb;
    
    reg [3:0] r_ADD1 = 4'b0000, r_ADD2 = 4'b0000;
    reg r_CARRY = 1'b0;
    wire [3:0] w_SUM;
    wire w_CARRY, PG, GG;

    CLA4 carry_look_ahead(.A(r_ADD1), .B(r_ADD2), .Ci(r_CARRY), .S(w_SUM), .Co(w_CARRY), .PG(PG), .GG(GG));

    initial begin
        $monitor("i_term1 = %b, i_term2 = %b, i_carry = %b, o_sum = %b, o_carry = %b, PG = %b, GG = %b", r_ADD1, r_ADD2, r_CARRY, w_SUM, w_CARRY, PG, GG);
        #10
        r_ADD1 = 4'b0100;
        r_ADD2 = 4'b0101;
        r_CARRY = 1'b0;
        #10
        r_ADD1 = 4'b0101;
        r_ADD2 = 4'b1010;
        r_CARRY = 1'b1;
        #10
        r_ADD1 = 4'b0111;
        r_ADD2 = 4'b1100;
        r_CARRY = 1'b1;
        #10
        r_ADD1 = 4'b1011;
        r_ADD2 = 4'b1001;
        r_CARRY = 1'b1;
    end

endmodule