`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:48:31 11/12/2019
// Design Name:   programCounter
// Module Name:   C:/Users/Rajat Kumar Jenamani/Desktop/KGP_RISC (2)/KGP_RISC/programCounter_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: programCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module programCounter_testbench;

	// Inputs
	reg clk;
	reg reset;
	reg branch_flag;
	reg [15:0] offset;

	// Outputs
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	programCounter uut (
		.clk(clk), 
		.reset(reset), 
		.branch_flag(branch_flag), 
		.offset(offset), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		branch_flag = 0;
		offset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Add stimulus here
		$monitor("PC=%b",PC);
        
		// Add stimulus here
		for(i=0;i<100;i=i+1)
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

