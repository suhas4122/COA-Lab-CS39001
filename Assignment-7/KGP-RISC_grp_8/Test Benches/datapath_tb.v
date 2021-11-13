`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for datapath module

module datapath_tb;

	// Inputs
    reg [4:0] reg_1;
    reg [4:0] reg_2;
    reg [4:0] shift_amount;
    reg [31:0] npc;
    reg [15:0] imm_constant;
    reg [3:0] alu_control;
    reg ab_set;
    reg reg_write;
    reg mem_write;
    reg ALU_src;
    reg reg_data;
    reg const_src;
    reg reg_to_pc;
    reg reg_write_select;
    reg mem_read;
    reg clk;
    reg reset;

	// Outputs
    wire [31:0] alu_result;
    wire carry_flag;
    wire sign_flag;
    wire zero_flag;

	// Instantiate the Unit Under Test (UUT)
    datapath uut(.reg_1(reg_1),
                .reg_2(reg_2),
                .shift_amount(shift_amount),
                .npc(npc),
                .imm_constant(imm_constant),
                .alu_control(alu_control),
                .ab_set(ab_set),
                .reg_write(reg_write),
                .mem_write(mem_write),
                .ALU_src(ALU_src),
                .reg_data(reg_data),
                .const_src(const_src),
                .reg_to_pc(reg_to_pc),
                .reg_write_select(reg_write_select),
                .mem_read(mem_read),
                .clk(clk),
                .reset(reset),
                .alu_result(alu_result),
                .carry_flag(carry_flag),
                .sign_flag(sign_flag),
                .zero_flag(zero_flag));
    
    initial begin
		// Initialize Inputs
		
		reg_1 = 0;
		reg_2 = 0;
		shift_amount = 0;
		npc = 0;
		imm_constant = 0;
		alu_control = 0;
		ab_set = 0;
		reg_write = 0;
		mem_write = 0;
		ALU_src = 0;
		reg_data = 0;
		const_src = 0;
		reg_to_pc = 0;
		reg_write_select = 0;
		mem_read = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
        #100;
      	#10 reset = 1;
		#10 reset = 0;

		// Add stimulus here
		#10;
		reg_1 = 12;
		reg_2 = 14;
		shift_amount = 10;
		npc = 20;
		imm_constant = 0;
		alu_control = 0;
		ab_set = 0;
		reg_write = 1;
		mem_write = 0;
		ALU_src = 0;
		reg_data = 0;
		const_src = 1;
		reg_to_pc = 0;
		reg_write_select = 1;
		mem_read = 0;

		#10;
		$display("alu_output = %d, carry_flag = %d, sign_flag = %d, zero_flag = %d", alu_result, carry_flag, sign_flag, zero_flag);
		
		#10;
		reg_1 = 20;
		reg_2 = 30;
		shift_amount = 1;
		npc = 48;
		imm_constant = 0;
		alu_control = 0;
		ab_set = 0;
		reg_write = 1;
		mem_write = 0;
		ALU_src = 0;
		reg_data = 0;
		const_src = 1;
		reg_to_pc = 1;
		reg_write_select = 1;
		mem_read = 0;

		#10;
		$display("alu_output = %d, carry_flag = %d, sign_flag = %d, zero_flag = %d", alu_result, carry_flag, sign_flag, zero_flag);
		        
		$finish;
    end 

    always begin
	    #5 clk = ~clk;
	end

endmodule 