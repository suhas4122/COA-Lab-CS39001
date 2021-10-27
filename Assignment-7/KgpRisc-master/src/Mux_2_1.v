`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:37 10/15/2012 
// Design Name: 
// Module Name:    Mux_2_1 
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
module Mux_2_1(
	input [31:0]A,
	input [31:0]B,
	input Sel,
	output [31:0]Out
    );
	 
	 assign Out = (Sel==0)?{A}:{B};
	 
endmodule
