`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:38 08/26/2021 
// Design Name: 
// Module Name:    rca_8bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rca_8bit(
    i_term1,
    i_term2,
    i_carry,
    o_sum,
    o_carry
);
    input [7:0] i_term1, i_term2;
    input i_carry;
    output [7:0] o_sum;
    output o_carry;
    wire [6:0] w_temp;

    full_adder full_adder1(.i_bit1(i_term1[0]), .i_bit2(i_term2[0]), .i_carry(i_carry), .o_sum(o_sum[0]), .o_carry(w_temp[0]));
    full_adder full_adder2(.i_bit1(i_term1[1]), .i_bit2(i_term2[1]), .i_carry(w_temp[0]), .o_sum(o_sum[1]), .o_carry(w_temp[1]));
    full_adder full_adder3(.i_bit1(i_term1[2]), .i_bit2(i_term2[2]), .i_carry(w_temp[1]), .o_sum(o_sum[2]), .o_carry(w_temp[2]));
    full_adder full_adder4(.i_bit1(i_term1[3]), .i_bit2(i_term2[3]), .i_carry(w_temp[2]), .o_sum(o_sum[3]), .o_carry(w_temp[3]));
    full_adder full_adder5(.i_bit1(i_term1[4]), .i_bit2(i_term2[4]), .i_carry(w_temp[3]), .o_sum(o_sum[4]), .o_carry(w_temp[4]));
    full_adder full_adder6(.i_bit1(i_term1[5]), .i_bit2(i_term2[5]), .i_carry(w_temp[4]), .o_sum(o_sum[5]), .o_carry(w_temp[5]));
    full_adder full_adder7(.i_bit1(i_term1[6]), .i_bit2(i_term2[6]), .i_carry(w_temp[5]), .o_sum(o_sum[6]), .o_carry(w_temp[6]));
    full_adder full_adder8(.i_bit1(i_term1[7]), .i_bit2(i_term2[7]), .i_carry(w_temp[6]), .o_sum(o_sum[7]), .o_carry(o_carry));

endmodule
