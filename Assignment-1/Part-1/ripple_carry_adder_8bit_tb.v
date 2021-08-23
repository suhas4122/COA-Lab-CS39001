`timescale  1ns/1ps

module ripple_carry_adder_8bit_tb;
    
    reg [7:0] r_ADD1 = 8'b00000000, r_ADD2 = 8'b00000000;
    reg r_CARRY = 1'b0;
    wire [7:0] w_SUM;
    wire w_CARRY;

    ripple_carry_adder_8bit ripple_carry_adder(.i_term1(r_ADD1), .i_term2(r_ADD2), .i_carry(r_CARRY), .o_sum(w_SUM), .o_carry(w_CARRY));

    initial begin
        $monitor("i_term1 = %b, i_term2 = %b, i_carry = %b, o_sum = %b, o_carry = %b", r_ADD1, r_ADD2, r_CARRY, w_SUM, w_CARRY);
        #10
        r_ADD1 = 8'b01001010;
        r_ADD2 = 8'b01011011;
        r_CARRY = 1'b0;
        #10
        r_ADD1 = 8'b00011111;
        r_ADD2 = 8'b11100000;
        r_CARRY = 1'b1;
        #10
        r_ADD1 = 8'b01111010;
        r_ADD2 = 8'b11000110;
        r_CARRY = 1'b1;
    end

endmodule 