`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 3
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for multiple of three module

module mult_three_fsm_tb;
	// Inputs
	reg clk, inp, reset;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	mult_three_fsm FSM(.clk(clk), .inp(inp), .reset(reset), .out(out));

	initial begin
		// Initialize Inputs
		clk = 0;
		inp = 0;
		reset = 1;

		// Wait 10 ns for global reset to finish
		#10;
		reset = 0; // Make reset 
        
        #10;
		$monitor("clk: %d, inp: %d, out: %d", clk, inp, out);
		// Starting inputs
		inp = 1;
		#10 inp = 1;
		#10 inp = 0;
		#10 inp = 1;
		#10 inp = 0;
		#10 inp = 0;
		#10 inp = 1;
		#10 inp = 1;
		#10 inp = 0;
		#7 $finish;
	end
   
	always
		#5 clk = !clk;

endmodule