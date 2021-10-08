`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a SIPO module 

module sipo(
    input clk,
	 input load,
    input in,
    output [7:0] out
    );

	reg [7:0] out;
	always @(posedge clk)	//if load=0, right shift, else do nothing
	begin
		if(load == 0)
			out={in,out[7:1]};
	end
	
endmodule 
