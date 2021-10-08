`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a testbench for bit serial adder module

module bit_serial_adder_tb;

	// Initialising inputs and outputs 
	reg clk;
	reg reset;
	reg load;
	reg sipo_load;
	reg [7:0] a;
	reg [7:0] b;
	reg cin;
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	bit_serial_adder UUT(.clk(clk), .reset(reset), .load(load), .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

	initial begin
		// Reset everything before loading the value
		clk = 0;
		reset = 1'b1;

		// Load the value of the inputs 
		#10
		reset = 1'b0;
		load = 1'b1;
		a = 8'b11001010;
		b = 8'b10110101;
		cin = 1'b0;

		// Wait 10 ns for loading to finish then set load = 0
		#10
		load = 1'b0;

		// Wait for 8 clock cycles for add operation 
		#80
		$finish;
	end
	
	// Toogle clock every 5 time units 
	always
		#5 clk = ~clk;

	// Display the results after each clock cycle 
	always 
		#10 $display("A:%b, B:%b, Sum:%b, Cout:%b", a, b, sum, cout);
		 

endmodule
