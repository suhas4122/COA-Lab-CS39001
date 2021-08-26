module  ripple_carry_adder_4bit (
    i_term1,
    i_term2,
    i_carry,
    o_sum,
    o_carry
);

    input [3:0] i_term1, i_term2;
    input i_carry;
    output [3:0] o_sum;
    output o_carry;
    wire [2:0] w_temp;

    full_adder full_adder1(.i_bit1(i_term1[0]), .i_bit2(i_term2[0]), .i_carry(i_carry), .o_sum(o_sum[0]), .o_carry(w_temp[0]));
    full_adder full_adder2(.i_bit1(i_term1[1]), .i_bit2(i_term2[1]), .i_carry(w_temp[0]), .o_sum(o_sum[1]), .o_carry(w_temp[1]));
    full_adder full_adder3(.i_bit1(i_term1[2]), .i_bit2(i_term2[2]), .i_carry(w_temp[1]), .o_sum(o_sum[2]), .o_carry(w_temp[2]));
    full_adder full_adder4(.i_bit1(i_term1[3]), .i_bit2(i_term2[3]), .i_carry(w_temp[2]), .o_sum(o_sum[3]), .o_carry(o_carry));
    
endmodule