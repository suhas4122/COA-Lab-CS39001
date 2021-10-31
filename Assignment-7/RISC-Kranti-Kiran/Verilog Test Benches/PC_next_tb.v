`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
/*
Assignment No - 7
Semester - Autumn 2018
Group - 3
Members:
  Suhas Jain - 19CS30048
  Monal Prasad - 19CS30030
*/
////////////////////////////////////////////////////////////////////////////////

module PC_next_tb;

	// Inputs
	reg clk;
	reg [31:0] offset;
	reg branch;
	reg rst;

	// Outputs
	wire [31:0] npc;

	// Instantiate the Unit Under Test (UUT)
	PC_next uut (
		.clk(clk), 
		.offset(offset), 
		.branch(branch), 
		.npc(npc), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		offset = 0;
		branch = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#101;
			rst = 1;
		#10 rst = 0;
		
		#10
		branch = 0;
		offset = 28;
		#10
		branch = 0;
		offset = -28;
		
		#10
		branch = 0;
		offset = 0;
		
		#10
		
		branch = 1;
		offset = 0;
		
		#10
		
		branch = 1;
		offset = -16;
		#10
		
		branch = 1;
		offset = 32;
		
		
		// Add stimulus here
		
	end
     
	always begin
		#5 clk = ~clk;
	end
endmodule

