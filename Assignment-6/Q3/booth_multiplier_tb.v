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

	reg clk, load, reset;
	reg signed [7:0] a, b;
	wire signed [15:0] product;

	booth_multiplier multiplier(clk, reset, load, a, b, product);

	initial begin
		clk = 0;
		reset = 1;
		#10
		reset = 0;
		#10
		
		$display("\nExample 1: Mc = 35 and Mp = 67");
		a = 35; 
		b = 67; 
		load = 1; 
		#20 load = 0;
		#90 $display("Product = %0d\n", product);

		$display("\nExample 2: Mc = -79 and Mp = 43");
		a = -79; 
		b = 43; 
		load = 1; 
		#20 load = 0;
		#90 $display("Product = %0d\n", product);

		$finish;
	end

	always 
		#5 clk = !clk;

endmodule
