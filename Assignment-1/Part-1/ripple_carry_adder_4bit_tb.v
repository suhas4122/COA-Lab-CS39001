`timescale  1ns/1ps

module ripple_carry_adder_4bit_tb;
    
    reg [3:0] r_ADD1 = 4'b0000, r_ADD2 = 4'b0000;
    reg r_CARRY = 1'b0;
    wire [3:0] w_SUM;
    wire w_CARRY;

    ripple_carry_adder_4bit ripple_carry_adder(.i_term1(r_ADD1), .i_term2(r_ADD2), .i_carry(r_CARRY), .o_sum(w_SUM), .o_carry(w_CARRY));

    initial begin
        $monitor("i_term1 = %b, i_term2 = %b, i_carry = %b, o_sum = %b, o_carry = %b", r_ADD1, r_ADD2, r_CARRY, w_SUM, w_CARRY);
        #10
        r_ADD1 = 4'b0100;
        r_ADD2 = 4'b0101;
        r_CARRY = 1'b0;
        #10
        r_ADD1 = 4'b0001;
        r_ADD2 = 4'b1110;
        r_CARRY = 1'b1;
        #10
        r_ADD1 = 4'b0111;
        r_ADD2 = 4'b1100;
        r_CARRY = 1'b1;
    end

endmodule 