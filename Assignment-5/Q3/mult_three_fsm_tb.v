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
	// Initialising inputs and outputs 
	reg clk, reset, inp;
	reg [7:0] inp_array;				// Array from which we will read bit wise input 
	integer i;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	mult_three_fsm FSM(.clk(clk), .inp(inp), .reset(reset), .out(out));

	initial begin
		// Initialize Inputs
		clk = 0;
		inp_array = 8'b11010011;		// Declaration of input array 
		inp = 0;
		reset = 1;

		// Wait 10 ns for global reset to finish
		#10;
		reset = 0; 		// Make reset 0
        // Wait 10 ns for reset to become 0
        #10;
		
		for(i = 0; i<8; i = i+1) begin
			inp = inp_array[7-i]; 		// Read inputs from the MSB side 
			#10
			$display("inp: %d, out: %d", inp, out);
		end

		#10 $finish;
	end

   	// Always block to toggle the clock every 5 time units 
	always
		#5 clk = ~clk;

endmodule