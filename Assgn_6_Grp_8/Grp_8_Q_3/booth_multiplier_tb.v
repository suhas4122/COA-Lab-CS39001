`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 3
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement testbench of 8-bit booth multiplier 

module booth_multiplier_tb;

    // Declare inputs and outputs 
	reg clk, load, reset;
	reg signed [7:0] a, b;
	wire signed [15:0] product;

	// Instantiate the Unit Under Test (UUT)
	booth_multiplier multiplier(.clk(clk), .reset(reset), .load(load), .Mc(a), .Mp(b), .product(product));

	initial begin

		// Start the test and reset the multiplier to start condition 
		clk = 0;
		reset = 1;
		#10
		reset = 0;
		#10
		
		// Example 1: multiplication of positive with positive number 
		$display("\nExample 1: Mc = 35 and Mp = 67");
		a = 35; 		
		b = 67; 
		load = 1; 
		#20 load = 0;
		#90 $display("Product = %0d\n", product);

		// Example 2: multiplication of positive with negative number 
		$display("\nExample 2: Mc = -79 and Mp = 43");
		a = -79; 
		b = 43; 
		load = 1; 
		#20 load = 0;
		#90 $display("Product = %0d\n", product);

		// Example 3: multiplication of negative with positive number 
		$display("\nExample 3: Mc = 52 and Mp = -121");
		a = 52; 
		b = -121; 
		load = 1; 
		#20 load = 0;
		#90 $display("Product = %0d\n", product);

		// Example 4: multiplication of negative with negative number 
		$display("\nExample 4: Mc = -19 and Mp = -98");
		a = -19; 
		b = -98; 
		load = 1; 
		#20 load = 0;
		#90 $display("Product = %0d\n", product);

		$finish;
	end

	// Switch clock signal every 5 clock cycles 
	always 
		#5 clk = !clk;

endmodule
