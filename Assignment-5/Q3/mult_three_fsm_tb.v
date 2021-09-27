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
		reset = 0; // Make reset 0
        
        #10;
		$monitor("clk: %d, inp: %d, out: %d", clk, inp, out);
		// Starting inputs
		#10 inp = 1;
		#10 inp = 1;
		#10 inp = 0;
		#10 inp = 1;
		#10 inp = 0;
		#10 inp = 0;
		#10 inp = 1;
		#10 inp = 1;
		#10 inp = 0;
		#5 $finish;
	end
   
	always
		#5 clk = !clk;

endmodule