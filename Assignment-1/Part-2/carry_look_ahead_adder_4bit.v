module carry_look_ahead_adder_4bit (
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
    wire [3:0] p, g;
    wire [4:0] c;

    assign p = i_term1 ^ i_term2;
    assign g = i_term1 & i_term2;

    assign c[0] = i_carry;
    assign c[1] = g[0] | (p[0] & i_carry);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & i_carry);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & i_carry);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & i_carry);

    assign o_sum = p ^ c;

    assign o_carry = c[4];

endmodule 

