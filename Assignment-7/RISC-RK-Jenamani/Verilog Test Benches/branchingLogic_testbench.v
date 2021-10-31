`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:31:13 11/12/2019
// Design Name:   branchingLogic
// Module Name:   C:/Users/Rajat Kumar Jenamani/Desktop/KGP_RISC (2)/KGP_RISC/branchingLogic_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branchingLogic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branchingLogic_testbench;

	// Inputs
	reg clk;
	reg [5:0] selector;
	reg [15:0] input_offset;
	reg [31:0] rs;
	reg reset;
	reg zflag_input;
	reg oflag_input;
	reg cflag_input;
	reg sflag_input;

	// Outputs
	wire [15:0] output_offset;
	wire branch_flag;

	// Instantiate the Unit Under Test (UUT)
	branchingLogic uut (
		.clk(clk), 
		.selector(selector), 
		.input_offset(input_offset), 
		.rs(rs), 
		.reset(reset), 
		.zflag_input(zflag_input), 
		.oflag_input(oflag_input), 
		.cflag_input(cflag_input), 
		.sflag_input(sflag_input), 
		.output_offset(output_offset), 
		.branch_flag(branch_flag)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		selector = 0;
		input_offset = 0;
		rs = 0;
		reset = 0;
		zflag_input = 0;
		oflag_input = 0;
		cflag_input = 0;
		sflag_input = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("clk = %b, selector=%b,input_offset=%b,rs=%b,cflag_input=%b,zflag_input=%b,sflag_input=%b,oflag_input=%b,output_offset=%b,branch_flag=%b",clk,selector,input_offset,rs,cflag_input,zflag_input,sflag_input,oflag_input,output_offset,branch_flag);
			
			
			// Exhaustive tests! 2 clks for all instructions due to flip flops
			
			#10 clk = 0; selector = 6'b100000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; 
			#10 clk = 1; selector = 6'b100000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; 
			#10 clk = 0; selector = 6'b100000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; 
			#10 clk = 1; selector = 6'b100000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; 
			
			#10 clk = 0; selector = 6'b100001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b100001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 0; selector = 6'b100001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b100001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			
			#10 clk = 0; selector = 6'b100010; input_offset = 20; rs = 40; zflag_input = 1; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bz
			#10 clk = 1; selector = 6'b100010; input_offset = 20; rs = 40; zflag_input = 1; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bz
			#10 clk = 0; selector = 6'b100010; input_offset = 20; rs = 40; zflag_input = 1; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bz
			#10 clk = 1; selector = 6'b100010; input_offset = 20; rs = 40; zflag_input = 1; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bz
			
			#10 clk = 0; selector = 6'b100010; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b100010; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 0; selector = 6'b100010; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b100010; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			
			#10 clk = 0; selector = 6'b100011; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bnz
			#10 clk = 1; selector = 6'b100011; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bnz
			#10 clk = 0; selector = 6'b100011; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bnz
			#10 clk = 1; selector = 6'b100011; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bnz
			
			#10 clk = 0; selector = 6'b100011; input_offset = 20; rs = 40; zflag_input = 1; oflag_input = 0; cflag_input = 0; sflag_input = 0;			
			#10 clk = 1; selector = 6'b100011; input_offset = 20; rs = 40; zflag_input = 1; oflag_input = 0; cflag_input = 0; sflag_input = 0;			
			#10 clk = 0; selector = 6'b100011; input_offset = 20; rs = 40; zflag_input = 1; oflag_input = 0; cflag_input = 0; sflag_input = 0;			
			#10 clk = 1; selector = 6'b100011; input_offset = 20; rs = 40; zflag_input = 1; oflag_input = 0; cflag_input = 0; sflag_input = 0;			
			
			#10 clk = 0; selector = 6'b100100; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 1; sflag_input = 0; //bcy
			#10 clk = 1; selector = 6'b100100; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 1; sflag_input = 0; //bcy
			#10 clk = 0; selector = 6'b100100; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 1; sflag_input = 0; //bcy
			#10 clk = 1; selector = 6'b100100; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 1; sflag_input = 0; //bcy
			
			#10 clk = 0; selector = 6'b100100; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b100100; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 0; selector = 6'b100100; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b100100; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			
			#10 clk = 0; selector = 6'b100101; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bncy
			#10 clk = 1; selector = 6'b100101; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bncy
			#10 clk = 0; selector = 6'b100101; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bncy
			#10 clk = 1; selector = 6'b100101; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bncy
			
			#10 clk = 0; selector = 6'b100101; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 1; sflag_input = 0;			
			#10 clk = 1; selector = 6'b100101; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 1; sflag_input = 0;			
			#10 clk = 0; selector = 6'b100101; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 1; sflag_input = 0;			
			#10 clk = 1; selector = 6'b100101; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 1; sflag_input = 0;			
			
			#10 clk = 0; selector = 6'b100110; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 1; //bs
			#10 clk = 1; selector = 6'b100110; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 1; //bs
			#10 clk = 0; selector = 6'b100110; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 1; //bs
			#10 clk = 1; selector = 6'b100110; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 1; //bs
			
			#10 clk = 0; selector = 6'b100110; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b100110; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 0; selector = 6'b100110; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b100110; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			
			#10 clk = 0; selector = 6'b100111; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bns
			#10 clk = 1; selector = 6'b100111; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bns
			#10 clk = 0; selector = 6'b100111; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bns
			#10 clk = 1; selector = 6'b100111; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bns
			
			#10 clk = 0; selector = 6'b100111; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 1;
			#10 clk = 1; selector = 6'b100111; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 1;
			#10 clk = 0; selector = 6'b100111; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 1;
			#10 clk = 1; selector = 6'b100111; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 1;
			
			#10 clk = 0; selector = 6'b101000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 1; cflag_input = 0; sflag_input = 0; //bv
			#10 clk = 1; selector = 6'b101000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 1; cflag_input = 0; sflag_input = 0; //bv
			#10 clk = 0; selector = 6'b101000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 1; cflag_input = 0; sflag_input = 0; //bv
			#10 clk = 1; selector = 6'b101000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 1; cflag_input = 0; sflag_input = 0; //bv
			
			#10 clk = 0; selector = 6'b101000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b101000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 0; selector = 6'b101000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b101000; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0;
			
			#10 clk = 0; selector = 6'b101001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bnv
			#10 clk = 1; selector = 6'b101001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bnv
			#10 clk = 0; selector = 6'b101001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bnv
			#10 clk = 1; selector = 6'b101001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //bnv
			
			#10 clk = 0; selector = 6'b101001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 1; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b101001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 1; cflag_input = 0; sflag_input = 0;
			#10 clk = 0; selector = 6'b101001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 1; cflag_input = 0; sflag_input = 0;
			#10 clk = 1; selector = 6'b101001; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 1; cflag_input = 0; sflag_input = 0;
			
			#10 clk = 0; selector = 6'b101010; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //Call
			#10 clk = 1; selector = 6'b101010; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //Call
			#10 clk = 0; selector = 6'b101010; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //Call
			#10 clk = 1; selector = 6'b101010; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //Call
			
			#10 clk = 0; selector = 6'b101011; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //Ret
			#10 clk = 1; selector = 6'b101011; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //Ret
			#10 clk = 0; selector = 6'b101011; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //Ret
			#10 clk = 1; selector = 6'b101011; input_offset = 20; rs = 40; zflag_input = 0; oflag_input = 0; cflag_input = 0; sflag_input = 0; //Ret
			
			#10;
	end
      
endmodule

