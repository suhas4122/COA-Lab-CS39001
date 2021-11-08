`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module topModule(
    input clk, 
    input reset,
);

    wire [31:0] PC;
    wire [31:0] instruction;
    wire [5:0] op_code;
    wire [4:0] reg_1; 
    wire [4:0] reg_2; 
    wire [4:0] shift_amount; 
    wire [10:0] func_code;
    wire [20:0] imm_constant; 
    wire [20:0] offset;
    wire [20:0] offset_out;

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
    wire clk;
    wire reset;
    wire [31:0] alu_result;
    wire carry_flag;
    wire sign_flag;
    wire zero_flag;

    wire branch_success(branch_success),;

    instructio.offset_out(nFetch if(.PC(PC),
                        .clk(clk),
                        .reset(reset),
                        .instruction(instruction));

    instructionDecoder id(.instruction(instruction),
                        .op_code(op_code),
                        .reg_1(reg_1), 
                        .reg_2(reg_2), 
                        .shift_amount(shift_amount), 
                        .func_code(func_code),
                        .imm_constant(imm_constant), 
                        .offset(offset));

    controller c(.op_code(op_code),
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

    dataPath dp(.reg_1(reg_1),
                .reg_2(reg_2),
                .shift_amount(shift_amount),
                .npc(pc),
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
    
    programCounter pc(.branch(branch),
                    .offset(offset_out),
                    .clk(clk),
                    .reset(reset),
                    .PC(PC));
    
    branchLogic bl(.op_code(op_code),
                .offset_in(offset),
                .alu_result(alu_result),
                .clk(clk),
                .reset(reset),
                .zero_flag(zero_flag),
                .sign_flag(sign_flag),
                .carry_flag(carry_flag),
                .branch_success(branch_success),
                .offset_out(offset_out));

endmodule 