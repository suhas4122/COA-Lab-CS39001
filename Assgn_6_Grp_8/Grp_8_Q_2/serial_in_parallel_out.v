`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a serial in parallel out 
	
module serial_in_parallel_out(
	input clk,
	input reset,
	input a,
	output reg [7:0] out
);
	/*
		clk: 	Clock 
		reset:	Reset bit of the module 
		a: 		Input bit of the module 
		out: 	8-bit output of the module
	*/

	// Sequential Control (FLIP FLOP CONTROL)
    // Asynchronous reset
	always @(posedge clk) begin
		if (reset)
			out = 8'b0;
		else
			out = {a, out[7:1]};
	end

endmodule