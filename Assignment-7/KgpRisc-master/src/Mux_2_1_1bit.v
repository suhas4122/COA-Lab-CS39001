`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:05 11/01/2012 
// Design Name: 
// Module Name:    Mux_2_1_1bit 
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
module Mux_2_1_1bit(
	input A,
	input B,
	input Sel,
	output Out
    );
	 
	 assign Out = (Sel==0)?{A}:{B};

endmodule
