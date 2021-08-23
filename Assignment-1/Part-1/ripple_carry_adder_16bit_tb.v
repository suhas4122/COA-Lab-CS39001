`timescale  1ns/1ps

module ripple_carry_adder_16bit_tb;
    
    reg [15:0] r_ADD1 = 16'b0, r_ADD2 = 16'b0;
    reg r_CARRY = 1'b0;
    wire [15:0] w_SUM;
    wire w_CARRY;

    ripple_carry_adder_16bit ripple_carry_adder(.i_term1(r_ADD1), .i_term2(r_ADD2), .i_carry(r_CARRY), .o_sum(w_SUM), .o_carry(w_CARRY));

    initial begin
        $monitor("i_term1 = %b, i_term2 = %b, i_carry = %b, o_sum = %b, o_carry = %b", r_ADD1, r_ADD2, r_CARRY, w_SUM, w_CARRY);
        #10
        r_ADD1 = 16'b0100101001001010;
        r_ADD2 = 16'b0101101101011011;
        r_CARRY = 1'b0;
        #10
        r_ADD1 = 16'b0001111100011111;
        r_ADD2 = 16'b1110000011100000;
        r_CARRY = 1'b1;
        #10
        r_ADD1 = 16'b0111101001111010;
        r_ADD2 = 16'b1100011011000110;
        r_CARRY = 1'b1;
    end

endmodule 