`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:48 08/26/2021 
// Design Name: 
// Module Name:    full_adder 
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
module full_adder (
    i_bit1, 
    i_bit2, 
    i_carry,
    o_sum, 
    o_carry
);
    
    input i_bit1, i_bit2, i_carry;
    output o_sum, o_carry;

    assign o_sum = i_bit1 ^ i_bit2 ^ i_carry;
    assign o_carry = (i_bit1 & i_bit2) | (i_bit2 & i_carry) | (i_carry & i_bit1);

endmodule
