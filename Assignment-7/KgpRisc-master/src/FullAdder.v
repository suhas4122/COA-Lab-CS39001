`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:20 10/16/2012 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(
	input A,
	input B,
	input Cin,
	output S,
	output Cout
    );

	wire w1,w2,w3;
	
	HalfAdder ha1(A,B,w1,w3);
	HalfAdder ha2(Cin,w1,S,w2);

	assign Cout = w2|w3;
	

endmodule
