`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:39 10/15/2012 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [31:0] X,
	input [31:0] Y,
	input fnSel,
	input fnClass,
	input [2:0] LogicFunc,
	output Carry,
	output [31:0] ALUOut
    );

	wire [31:0] AdderOut;
	wire [31:0] LogicUnitOut;
	wire [31:0] AdderInA;
	wire [31:0] AdderInB;
	wire [31:0] Y_com;
	wire [31:0] aluOut1;
	wire AdderCarryOut;

	assign Y_com = Y ^ {32{1'b1}};
	
	Mux_2_1 m1(X,1,fnSel,AdderInA);
	Mux_2_1 m2(Y,Y_com,fnSel,AdderInB);
	RippleCarryAdder rca(AdderInA,AdderInB,AdderOut,AdderCarryOut,overflow);
	LogicUnit lu(X,Y,LogicFunc,LogicUnitOut);
	Mux_2_1 m3(AdderOut,LogicUnitOut,fnClass,aluOut1);
	
	assign ALUOut = aluOut1;
	assign Carry = AdderCarryOut;
	
endmodule
