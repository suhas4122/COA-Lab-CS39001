`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:34:21 11/01/2012 
// Design Name: 
// Module Name:    SignExtend_1to2 
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
module SignExtend_1to2(
	input In,
	output [1:0] Out
    );

	assign Out[1] = 1'b0;
	assign Out[0] = In;

endmodule
