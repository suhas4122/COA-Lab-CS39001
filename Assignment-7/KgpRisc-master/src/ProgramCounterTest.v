`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:57:26 10/31/2012
// Design Name:   ProgramCounter
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/ProgramCounterTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProgramCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ProgramCounterTest;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] PC_in;

	// Outputs
	wire [31:0] PC_out;

	// Instantiate the Unit Under Test (UUT)
	ProgramCounter uut (
		.clk(clk), 
		.reset(reset), 
		.PC_in(PC_in), 
		.PC_out(PC_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		PC_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always
		begin
			#10 clk = ~clk;
		end
		
	initial
		begin
			reset = 1;
			#10; reset = 1; PC_in = 32'b1011;
			#10; reset = 0; PC_in = 32'b1100;
			#10; reset = 0; PC_in = 32'b1101;
			#10; reset = 0; PC_in = 32'b1110;
			#10; reset = 1; PC_in = 32'b1111;
			#10; reset = 0; PC_in = 32'b1011;
		end
      
endmodule

