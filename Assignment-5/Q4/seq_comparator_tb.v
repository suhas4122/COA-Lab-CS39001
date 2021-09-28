`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 4
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement testbench for top module of 32-bit comparator 

module seq_comparator_tb;
	// Declaring inputs and outputs 
	reg clk, reset, OP;
    reg [31:0] inp1, inp2;
	wire L, E, G;

	// Instantiate the Unit Under Test (UUT)
	seq_comparator FSM(.clk(clk), .inp1(inp1), .inp2(inp2), .reset(reset), .OP(OP), .L(L), .E(E), .G(G));

	initial begin

		// TEST CASE - 1 (inp1 = inp2)
		// Initialize Inputs
		clk = 0;
		reset = 1;
        OP = 0;
        inp1 = 32'd30787;
		inp2 = 32'd30787;
        // Wait 10 ns for global reset to finish
		#10
		reset = 0;		// Make reset 0 
        #325 
        OP = 1;			// Set OP = 1 after reading all 32 bits (32 clock cycles)
        #10
		$display("\nInput-1: %0d, Input-2: %0d", inp1, inp2);
        $display("L:%d, E:%d, G: %d\n", L, E, G);
		

		// TEST CASE - 2 (inp1 < inp2)
		// Initialize Inputs
		clk = 0;
		reset = 1;
        OP = 0;
        inp1 = 32'd4579868;
		inp2 = 32'd4579999;
		// Wait 10 ns for global reset to finish
		#10
		reset = 0;		// Make reset 0
        #325 
        OP = 1;			// Set OP = 1 after reading all 32 bits (32 clock cycles)
        #10
		$display("Input-1: %0d, Input-2: %0d", inp1, inp2);
        $display("L:%d, E:%d, G: %d\n", L, E, G);
		

		// TEST CASE - 3 (inp1 > inp2)
		// Initialize Inputs
		clk = 0;
		reset = 1;
        OP = 0;
        inp1 = 32'd16987;
		inp2 = 32'd16986;
		// Wait 10 ns for global reset to finish
        #10
		reset = 0; 		// Make reset 0
        #325 
        OP = 1;			// Set OP = 1 after reading all 32 bits (32 clock cycles)
        #10
		$display("Input-1: %0d, Input-2: %0d", inp1, inp2);	
        $display("L:%d, E:%d, G: %d\n", L, E, G);
		
		$finish;
	end

   	// Always block to toggle the clock every 5 time units 
	always
		#5 clk = ~clk;

endmodule