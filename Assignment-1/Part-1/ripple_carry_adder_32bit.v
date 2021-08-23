module  ripple_carry_adder_32bit (
    i_term1,
    i_term2,
    i_carry,
    o_sum,
    o_carry
);

    input [31:0] i_term1, i_term2;
    input i_carry;
    output [31:0] o_sum;
    output o_carry;
    wire w_temp;

    ripple_carry_adder_16bit ripple_carry_adder1(.i_term1(i_term1[15:0]), .i_term2(i_term2[15:0]), .i_carry(i_carry), .o_sum(o_sum[15:0]), .o_carry(w_temp));
    ripple_carry_adder_16bit ripple_carry_adder2(.i_term1(i_term1[31:16]), .i_term2(i_term2[31:16]), .i_carry(w_temp), .o_sum(o_sum[31:16]), .o_carry(o_carry));
    
endmodule