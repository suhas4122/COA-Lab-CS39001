`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:04 11/06/2019 
// Design Name: 
// Module Name:    MUX_5b_2_to_1 
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
module MUX_5b_2_to_1(input [4:0] a,
    input [4:0] b, 
    input select, 
    output [4:0] out
    );
	 
	 assign out = select ? b: a;

endmodule
