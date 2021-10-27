`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:46:59 11/08/2012
// Design Name:   Counter
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/CounterTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CounterTest;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] clk_new;

	// Instantiate the Unit Under Test (UUT)
	Counter uut (
		.clk(clk), 
		.reset(reset), 
		.clk_new(clk_new)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
      
	always
		begin
			#20 clk = ~clk;
		end
		
	initial
		begin
			reset = 1;
			#50; reset = 0;
			
		end
		
endmodule

