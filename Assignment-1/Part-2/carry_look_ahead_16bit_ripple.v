module carry_look_ahead_16bit_ripple(
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
    wire [2:0] w_temp;
    
    carry_look_ahead_4bit carry_look_ahead1(.i_term1(i_term1[3:0]), .i_term2(i_term2[3:0]), .i_carry(i_carry), .o_sum(o_sum[3:0]), .o_carry(w_temp[0]));
    carry_look_ahead_4bit carry_look_ahead2(.i_term1(i_term1[7:4]), .i_term2(i_term2[7:4]), .i_carry(w_temp[0]), .o_sum(o_sum[7:4]), .o_carry(w_temp[1]));
    carry_look_ahead_4bit carry_look_ahead3(.i_term1(i_term1[11:8]), .i_term2(i_term2[11:8]), .i_carry(w_temp[1]), .o_sum(o_sum[11:8]), .o_carry(w_temp[2]));
    carry_look_ahead_4bit carry_look_ahead4(.i_term1(i_term1[15:12]), .i_term2(i_term2[15:12]), .i_carry(w_temp[2]), .o_sum(o_sum[15:12]), .o_carry(o_carry));
 
endmodule