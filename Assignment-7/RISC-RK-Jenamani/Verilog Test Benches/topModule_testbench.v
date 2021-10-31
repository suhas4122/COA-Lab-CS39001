`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:12:10 11/13/2019
// Design Name:   topModule
// Module Name:   C:/Users/student/Desktop/FINAL_LAB_SUB/KGP_RISC/topModule_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: topModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module topModule_testbench;

	// Inputs
	reg clk;
	reg reset;
	
	// loop
	integer i;

	// Outputs
	wire [5:0] PC_out;
	wire [9:0] alu_result_out;

	// Instantiate the Unit Under Test (UUT)
	topModule uut (
		.clk(clk), 
		.reset(reset), 
		.PC_out(PC_out), 
		.alu_result_out(alu_result_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		$monitor("PC=%d | alu_result=%d",PC_out,alu_result_out);
        
		// Add stimulus here
		for(i=0;i<150;i=i+1)
		begin
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
			#10; clk = !clk;
		end

	end
      
endmodule

