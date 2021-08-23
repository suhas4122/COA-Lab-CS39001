module  ripple_carry_adder_16bit (
    i_term1,
    i_term2,
    i_carry,
    o_sum,
    o_carry
);

    input [15:0] i_term1, i_term2;
    input i_carry;
    output [15:0] o_sum;
    output o_carry;
    wire w_temp;

    ripple_carry_adder_8bit ripple_carry_adder1(.i_term1(i_term1[7:0]), .i_term2(i_term2[7:0]), .i_carry(i_carry), .o_sum(o_sum[7:0]), .o_carry(w_temp));
    ripple_carry_adder_8bit ripple_carry_adder2(.i_term1(i_term1[15:8]), .i_term2(i_term2[15:8]), .i_carry(w_temp), .o_sum(o_sum[15:8]), .o_carry(o_carry));
    
endmodule