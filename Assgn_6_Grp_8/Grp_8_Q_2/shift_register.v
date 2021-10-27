`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a shift register  

module shift_register(
    input clk,
    input reset,
    input load,
    input [7:0] in,
    output reg [7:0] out
);
	/*
		clk: 	Clock 
		reset:	Reset bit of the module (indicates to reset the shift register)
		load: 	Load bit of the module (indicates when to load data) 
		in:		8-bit input bit of the module 
		out: 	8-bit output of the module
	*/

	// Sequential contol block
    // Asynchronous reset
	// Logic: if reset=1, assign out=0, else if load=1, assign out=input given, else right shift
	always @(posedge clk) begin
		if (load == 0 & reset == 0)
			out = out >> 1;
		else if (load ==1 & reset == 0)
			out = in;
		else
			out = 8'b0;
	end
	
endmodule
