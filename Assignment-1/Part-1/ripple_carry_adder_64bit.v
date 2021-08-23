module  ripple_carry_adder_64bit (
    i_term1,
    i_term2,
    i_carry,
    o_sum,
    o_carry
);

    input [63:0] i_term1, i_term2;
    input i_carry;
    output [63:0] o_sum;
    output o_carry;
    wire w_temp;

    ripple_carry_adder_32bit ripple_carry_adder1(.i_term1(i_term1[31:0]), .i_term2(i_term2[31:0]), .i_carry(i_carry), .o_sum(o_sum[31:0]), .o_carry(w_temp));
    ripple_carry_adder_32bit ripple_carry_adder2(.i_term1(i_term1[63:32]), .i_term2(i_term2[63:32]), .i_carry(w_temp), .o_sum(o_sum[63:32]), .o_carry(o_carry));
    
endmodule