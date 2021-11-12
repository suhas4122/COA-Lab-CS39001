`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module branchingLogic_testbench;

	// Inputs
	reg clk;
	reg [5:0] op_code;
	reg [20:0] offset_in;
	reg [31:0] alu_result;
	reg reset;
	reg zero_flag;
	reg carry_flag;
	reg sign_flag;

	// Outputs
	wire [20:0] offset_out;
	wire branch_success;

	// Instantiate the Unit Under Test (UUT)
	branchLogic uut (
		.clk(clk), 
		.op_code(op_code), 
		.offset_in(offset_in), 
		.alu_result(alu_result), 
		.reset(reset), 
		.zero_flag(zero_flag), 
		.carry_flag(carry_flag), 
		.sign_flag(sign_flag), 
		.offset_out(offset_out), 
		.branch_success(branch_success)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		op_code = 0;
		offset_in = 0;
		alu_result = 0;
		reset = 0;
		zero_flag = 0;
;
		carry_flag = 0;
		sign_flag = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("clk = %b,op_code=%b,offset_in=%b,alu_result=%b,carry_flag=%b,zero_flag=%b,sign_flag=%b,offset_out=%b,branch_success=%b",clk,op_code,offset_in,alu_result,carry_flag,zero_flag,sign_flag,offset_out,branch_success);
		
			#10 clk = 0; op_code = 6'd5; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0; 
			#10 clk = 1; op_code = 6'd5; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0; 
			#10 clk = 0; op_code = 6'd5; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0; 
			#10 clk = 1; op_code = 6'd5; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0; 
			
			#10 clk = 0; op_code = 6'd6; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 1; op_code = 6'd6; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 0; op_code = 6'd6; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 1; op_code = 6'd6; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			
			#10 clk = 0; op_code = 6'd7; offset_in = 20; alu_result = 40; zero_flag = 1; carry_flag = 0; sign_flag = 0; 
			#10 clk = 1; op_code = 6'd7; offset_in = 20; alu_result = 40; zero_flag = 1; carry_flag = 0; sign_flag = 0; 
			#10 clk = 0; op_code = 6'd7; offset_in = 20; alu_result = 40; zero_flag = 1; carry_flag = 0; sign_flag = 0; 
			#10 clk = 1; op_code = 6'd7; offset_in = 20; alu_result = 40; zero_flag = 1; carry_flag = 0; sign_flag = 0; 
			
			#10 clk = 0; op_code = 6'd8; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 1; op_code = 6'd8; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 0; op_code = 6'd8; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 1; op_code = 6'd8; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			
			#10 clk = 0; op_code = 6'd9; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0; 
			#10 clk = 1; op_code = 6'd9; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0; 
			#10 clk = 0; op_code = 6'd9; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0; 
			#10 clk = 1; op_code = 6'd9; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0; 
			
			#10 clk = 0; op_code = 6'd10; offset_in = 20; alu_result = 40; zero_flag = 1; carry_flag = 0; sign_flag = 0;			
			#10 clk = 1; op_code = 6'd10; offset_in = 20; alu_result = 40; zero_flag = 1; carry_flag = 0; sign_flag = 0;			
			#10 clk = 0; op_code = 6'd10; offset_in = 20; alu_result = 40; zero_flag = 1; carry_flag = 0; sign_flag = 0;			
			#10 clk = 1; op_code = 6'd10; offset_in = 20; alu_result = 40; zero_flag = 1; carry_flag = 0; sign_flag = 0;			
			
			#10 clk = 0; op_code = 6'd11; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 1; sign_flag = 0; 
			#10 clk = 1; op_code = 6'd11; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 1; sign_flag = 0; 
			#10 clk = 0; op_code = 6'd11; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 1; sign_flag = 0; 
			#10 clk = 1; op_code = 6'd11; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 1; sign_flag = 0; 
			
			#10 clk = 0; op_code = 6'd12; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 1; op_code = 6'd12; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 0; op_code = 6'd12; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;
			#10 clk = 1; op_code = 6'd12; offset_in = 20; alu_result = 40; zero_flag = 0; carry_flag = 0; sign_flag = 0;

	end
      
endmodule

