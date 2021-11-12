`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module instructionFetch_tb;

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
		$monitor("clk = %b | reset = %b | PC = %b | instruction= %b",clk,reset,PC,instruction);
		
        for(i = 0; i <= 10; i = i+1) begin
		    clk = 0; PC = i; #10;
		    clk = 1; PC = i; #10;
		end

		$finish; 
	end
      
endmodule
