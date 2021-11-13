`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for controller module
module controller_tb;
    // Inputs
    reg [5:0] op_code;
    reg [10:0] func_code;
    reg clk;
    reg reset;

    // Outputs
    wire [3:0] alu_control;
    wire ab_set;
    wire reg_write;
    wire mem_write;
    wire ALU_src;
    wire reg_data;
    wire const_src;
    wire reg_to_pc;
    wire reg_write_select;
    wire mem_read;

    // Instantiate the Unit Under Test (UUT)
    controller uut(.op_code(op_code),
                .func_code(func_code),
                .clk(clk),
                .reset(reset),
                .alu_control(alu_control),
                .ab_set(ab_set),
                .reg_write(reg_write),
                .mem_write(mem_write),
                .mem_read(mem_read),
                .ALU_src(ALU_src),
                .reg_data(reg_data),
                .const_src(const_src),
                .reg_to_PC(reg_to_pc),
                .reg_write_select(reg_write_select));

    initial begin
		// Initialize Inputs
		op_code = 0;
        func_code = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("op_code=%d, alu_control=%d, ab_set=%d, reg_write=%d, mem_write=%d, ALU_src=%d, reg_data=%d, const_src=%d, reg_to_pc=%d, reg_write_select=%d, mem_read=%d",op_code,alu_control,ab_set,reg_write,mem_write,ALU_src,reg_data,const_src,reg_to_pc,reg_write_select,mem_read);
        
		#10 op_code = 6'd0; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 1; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 2; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 3; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 4; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 5; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 6; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 7; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 8; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd0; func_code = 9; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd1; func_code = 0; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd2; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd3; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd4; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd5; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd6; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd7; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd8; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd9; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd10; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd11; clk = ~clk; clk = ~clk;
		#10 op_code = 6'd12; clk = ~clk; clk = ~clk;

	end

endmodule 