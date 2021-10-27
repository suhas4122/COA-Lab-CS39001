`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:44 10/31/2012 
// Design Name: 
// Module Name:    NextState 
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
module NextState(
	input [31:0] PC,
	input [1:0] PCSel,
	input [31:0] rs,
	input [15:0] imm,
	output [31:0] UpdatedPC,
	output [31:0] IncrPC
    );

	wire [31:0] FirstAdderOut;
	wire [31:0] SecondAdderOut;
	wire cout1,cout2,overflow1,overflow2;
	wire [31:0] imm_SE;
	//wire [31:0] imm_shifted;
	wire [31:0] updatedPC1;
	
	SignExtend se(imm,imm_SE);
	//LeftShiftBy2 ls(imm_SE,imm_shifted);
	
	RippleCarryAdder rca1(PC,32'b001,FirstAdderOut,cout1,overflow1);
	RippleCarryAdder rca2(FirstAdderOut,imm_SE,SecondAdderOut,cout2,overflow2);
	
	Mux_3_1 m1(FirstAdderOut,SecondAdderOut,rs,PCSel,updatedPC1);
	
	assign UpdatedPC = updatedPC1;
	assign IncrPC = FirstAdderOut;
	
endmodule
