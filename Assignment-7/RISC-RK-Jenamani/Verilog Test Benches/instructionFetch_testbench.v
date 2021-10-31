`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:49:47 11/12/2019
// Design Name:   instructionFetch
// Module Name:   C:/Users/Rajat Kumar Jenamani/Desktop/KGP_RISC (2)/KGP_RISC/instructionFetch_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instructionFetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instructionFetch_testbench;

	// Inputs
	reg [31:0] PC;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] instruction;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	instructionFetch uut (
		.PC(PC), 
		.clk(clk), 
		.reset(reset), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		PC = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("clk = %b | reset = %b | PC = %b | instruction= %b ",clk,reset,PC,instruction);
		for(i = 0; i <= 10; i = i+1)
		begin
		clk = 0; PC = i; #10;
		clk = 1; PC = i; #10;
		end
 
		/*clk = 0; pc = 0; #1;
		clk = 1; pc = 0; #1;
		clk = 0; pc = 1; #1;
		clk = 1; pc = 1; #1;
		clk = 0; pc = 2; #1;
		clk = 1; pc = 2; #1;
		clk = 0; pc = 3; #1;
		clk = 1; pc = 3; #1; 
		clk = 0; pc = 4; #1;
		clk = 1; pc = 4; #1;*/


		$display("--------------------------------------------------------------------------");
		$finish; 

	end
      
endmodule

