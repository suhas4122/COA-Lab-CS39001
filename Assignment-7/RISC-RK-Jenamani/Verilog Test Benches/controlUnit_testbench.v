`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:56:21 11/12/2019
// Design Name:   controlUnit
// Module Name:   C:/Users/Rajat Kumar Jenamani/Desktop/KGP_RISC (2)/KGP_RISC/controlUnit_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controlUnit_testbench;

	// Inputs
	reg [5:0] selector;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] alu_selector;
	wire is_branch;
	wire write_to_reg;
	wire write_to_memory;
	wire read_from_memory;
	wire ALU_src;
	wire register_data;
	wire constant_src;
	wire reg_to_PC;
	wire select_reg_write;

	// Instantiate the Unit Under Test (UUT)
	controlUnit uut (
		.selector(selector), 
		.clk(clk), 
		.reset(reset), 
		.alu_selector(alu_selector), 
		.is_branch(is_branch), 
		.write_to_reg(write_to_reg), 
		.write_to_memory(write_to_memory), 
		.read_from_memory(read_from_memory), 
		.ALU_src(ALU_src), 
		.register_data(register_data), 
		.constant_src(constant_src), 
		.reg_to_PC(reg_to_PC), 
		.select_reg_write(select_reg_write)
	);

	initial begin
		// Initialize Inputs
		selector = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("alu_selector=%d, is_branch=%d, write_to_reg=%d, write_to_memory=%d, read_from_memory=%d, ALU_src=%d, register_data=%d, constant_src=%d, reg_to_PC=%d, select_reg_write=%d",alu_selector,is_branch,write_to_reg,write_to_memory,read_from_memory,ALU_src,register_data,constant_src,reg_to_PC,select_reg_write);
        
		// Add stimulus here
		#10 selector = 6'd0; clk = ~clk; clk = ~clk;
		#10 selector = 6'd1; clk = ~clk; clk = ~clk;
		#10 selector = 6'd2; clk = ~clk; clk = ~clk;
		#10 selector = 6'd3; clk = ~clk; clk = ~clk;
		#10 selector = 6'd4; clk = ~clk; clk = ~clk;
		#10 selector = 6'd5; clk = ~clk; clk = ~clk;
		#10 selector = 6'd6; clk = ~clk; clk = ~clk;
		#10 selector = 6'd7; clk = ~clk; clk = ~clk;
		#10 selector = 6'd8; clk = ~clk; clk = ~clk;
		#10 selector = 6'd9; clk = ~clk; clk = ~clk;

	end
      
endmodule

