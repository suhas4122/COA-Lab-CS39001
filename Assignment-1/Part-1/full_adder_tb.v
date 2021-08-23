`timescale 1ns/1ps

module full_adder_tb;
 
    reg r_BIT1 = 0;
    reg r_BIT2 = 0;
    reg r_CARRY = 0;
    wire w_SUM;
    wire w_CARRY;
    
    full_adder full_adder_inst(.i_bit1(r_BIT1), .i_bit2(r_BIT2), .i_carry(r_CARRY), .o_sum(w_SUM), .o_carry(w_CARRY));
    
    initial begin
        $monitor("i_bit1 = %b, i_bit2 = %b, i_carry = %b, o_sum = %b, o_carry = %b", r_BIT1, r_BIT2, r_CARRY, w_SUM, w_CARRY);
        #10
        r_BIT1 = 1'b0;
        r_BIT2 = 1'b0;
        r_CARRY = 1'b0;
        #10;
        r_BIT1 = 1'b0;
        r_BIT2 = 1'b0;
        r_CARRY = 1'b1;
        #10;
        r_BIT1 = 1'b0;
        r_BIT2 = 1'b1;
        r_CARRY = 1'b0;
        #10;
        r_BIT1 = 1'b0;
        r_BIT2 = 1'b1;
        r_CARRY = 1'b1;
        #10;
        r_BIT1 = 1'b1;
        r_BIT2 = 1'b0;
        r_CARRY = 1'b0;
        #10;
        r_BIT1 = 1'b1;
        r_BIT2 = 1'b0;
        r_CARRY = 1'b1;
        #10;
        r_BIT1 = 1'b1;
        r_BIT2 = 1'b1;
        r_CARRY = 1'b0;
        #10;
        r_BIT1 = 1'b1;
        r_BIT2 = 1'b1;
        r_CARRY = 1'b1;
    end 
 
endmodule