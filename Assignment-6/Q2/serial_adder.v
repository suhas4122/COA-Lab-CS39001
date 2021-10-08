`timescale 1ns / 1ps
`include "ShiftReg.v"
`include "dff.v"
`include "full_adder.v"
`include "sipo.v"
module bitSerialAdder(
    input clk,
    input rst_shift,
    input rst_ff,
    input load,
	 input sipo_load,
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
    );

	wire [7:0] x,z;
	wire s,c;
		
	ShiftReg ins1(clk,rst_shift,load,a,x);
	ShiftReg ins2(clk,rst_shift,load,b,z);
	
	dff D(clk,rst_ff,cout,cin,c);
	
	//Calling adder module
	full_adder FA1(x[0],z[0],c,s,cout);
	
	//Store sum in SIPO
	sipo S1(clk,sipo_load,s,sum);
	
endmodule
