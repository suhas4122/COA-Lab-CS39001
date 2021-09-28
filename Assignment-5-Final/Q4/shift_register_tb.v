`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 4
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for left shift register module  

module shift_register_tb;

	// Declare inputs, outputs and temporary variables 
	reg clk, reset;
    reg [31:0] inp;
    integer i;

	// Instantiate the Unit Under Test (UUT)
	shift_register sr(.clk(clk), .inp(inp), .reset(reset), .out(out));

	initial begin

		// Initialize Inputs
		clk = 0;
		reset = 1;
        inp = 32'b11010010011010101101011000101000;
		// Wait 10 ns for global reset to finish
        #10
		reset = 0;		                        // Make reset 0 
        #10                                     // Wait for reset to go to 0 
        for(i = 0; i<32; i = i+1) begin
            $display("Output bit: %b", out);    // Printing the output bit from left to right
            #10;                                // Waiting for next clock cycle
        end
		$finish;
	end

   	// Always block to toggle the clock every 5 time units 
	always
		#5 clk = ~clk;

endmodule