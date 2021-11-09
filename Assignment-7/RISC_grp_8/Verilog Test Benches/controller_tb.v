`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
/*
Assignment No - 7
Semester - Autumn 2018
Group - 3
Members:
  G Rahul KrantiKiran - 16CS10018
  Sai Saketh Aluru - 16CS30030
*/
////////////////////////////////////////////////////////////////////////////////

module Control_unit_tb;

	// Inputs
	reg [5:0] op_code;
	reg [10:0] func_code;
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] alu_control;
	wire ab_set;
	wire reg_write;
	wire mem_write;
	wire mem_read;
	wire ALU_src;
	wire reg_data;
	wire const_src;
	wire reg_to_PC;
	wire reg_write_select;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.op_code(op_code), 
		.func_code(func_code), 
		.clk(clk), 
		.rst(rst), 
		.alu_control(alu_control), 
		.Branch(Branch), 
		.reg_write(reg_write), 
		.mem_write(mem_write), 
		.mem_read(mem_read), 
		.ALU_src(ALU_src), 
		.reg_data(reg_data), 
		.const_src(const_src),
		.reg_to_PC(reg_to_PC),
		.reg_write_select(reg_write_select)
	);

	initial begin
		// Initialize Inputs
		op_code = 0;
		func_code= 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("op_code=%d, func_code=%d,alu_control=  %d,ab_set =%d, reg_write=%d, mem_write=%d, mem_read=%d, ALU_src=%d, reg_data=%d, const_src=%d, reg_to_PC=%d, reg_write_select=%d",op_code,func_code,alu_control,ab_set,reg_write,mem_write,mem_read,ALU_src,reg_data,const_src,reg_to_PC,reg_write_select);
        
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
	
	//always begin
	//	#5 clk = ~clk;
	//end      
endmodule
