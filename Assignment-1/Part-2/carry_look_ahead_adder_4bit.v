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

    assign p[0] = (i_term1[0] ^ i_term2[0]);
    assign p[1] = (i_term1[1] ^ i_term2[1]);
    assign p[2] = (i_term1[2] ^ i_term2[2]);
    assign p[3] = (i_term1[3] ^ i_term2[3]);

    assign g[0] = (i_term1[0] & i_term2[0]);
    assign g[1] = (i_term1[1] & i_term2[1]);
    assign g[2] = (i_term1[2] & i_term2[2]);
    assign g[3] = (i_term1[3] & i_term2[3]);

    assign c[0] = i_carry;
    assign c[1] = g[0] | (p[0] & i_carry);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & i_carry);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & i_carry);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & i_carry);

    assign o_sum[0] = p[0] ^ c[0];
    assign o_sum[1] = p[1] ^ c[1];
    assign o_sum[2] = p[2] ^ c[2];
    assign o_sum[3] = p[3] ^ c[3];

    assign o_carry = c[4];

endmodule 

