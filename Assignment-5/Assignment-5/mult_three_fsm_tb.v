`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:35 09/28/2021 
// Design Name: 
// Module Name:    mult_three_fsm_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module mult_three_fsm_tb;
	// Inputs
	reg clk, inp, reset;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	mult_three_fsm FSM(.clk(clk), .inp(inp), .reset(reset), .out(out));

	initial begin
		// Initialize Inputs
		clk = 0;
		inp = 0;
		reset = 1;

		// Wait 10 ns for global reset to finish
		#10;
		reset = 0; // Make reset 
        
        #10;
		$monitor("clk: %d, inp: %d, out: %d", clk, inp, out);
		// Starting inputs
		inp = 1;
		// #10 inp = 1;
		#10 inp = 0;
		#10 inp = 1;
		// #10 inp = 0;
		#10 inp = 0;
		#10 inp = 1;
		// #10 inp = 1;
		// #10 inp = 0;
		#7  $finish;
	end
   
	always
		#5 clk = !clk;

endmodule