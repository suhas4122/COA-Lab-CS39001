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
    input reset
);
    /*
        clk: clock
        reset: reset
    */

    wire [31:0] PC;                 // The program counter
    wire [31:0] PC_next;            // Program counter after the current instruction 
    wire [31:0] instruction;        // Current instruction loaded from instruction memory 
    wire [5:0] op_code;             // Operation code 
    wire [4:0] reg_1;               // rs
    wire [4:0] reg_2;               // rt
    wire [4:0] shift_amount;        // Shift amount in case of shift type instruction 
    wire [10:0] func_code;          // Function code
    wire [15:0] imm_constant;       // Immediate constant value 
    wire [20:0] offset;             // Offset input in case of branch instruction
    wire [20:0] offset_out;         // Offset value that is going to be used 
    wire [3:0] alu_control;         // Control flag for the ALU 
    wire ab_set;                    // Control signal to ALU in case of complement
    wire reg_write;                 // Flag to indicate if register needs to be overwritten
    wire mem_write;                 // Flag to indicate if memory needs to be overwritten
    wire ALU_src;                   // Flag to indicate if ALU source is register or immediate constant
    wire reg_data;                  // Data from register file
    wire const_src;                 // Flag to indicate if ALU source is immediate constant
    wire reg_to_pc;                 // Flag to indicate if PC is to be updated with register value
    wire reg_write_select;          // Flag to indicate if register needs to be written to register file
    wire mem_read;                  // Flag to indicate if memory needs to be read
    wire [31:0] alu_result;         // Result of ALU
    wire carry_flag;                // Carry flag for ALU
    wire sign_flag;                 // Sign flag for ALU
    wire zero_flag;                 // Zero flag for ALU
    wire branch_success;            // Flag to indicate if branch is successful

    // Instantiating the module to load BRAM instance to load the instructions
    instructionFetch if1(.PC(PC_next),
                        .clk(clk),
                        .reset(reset),
                        .instruction(instruction));

    // Instantiating the module to break down a instruction into its various componenets 
    instructionDecoder id(.instruction(instruction),
                        .op_code(op_code),
                        .reg_1(reg_1), 
                        .reg_2(reg_2), 
                        .shift_amount(shift_amount), 
                        .func_code(func_code),
                        .imm_constant(imm_constant), 
                        .offset(offset));

    // Instantiating the module to set various control flags for a particular instruction 
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
    
    // Instantiating the module contaning the data path that connects register memory, ALU, etc
    datapath dp(.reg_1(reg_1),
                .reg_2(reg_2),
                .shift_amount(shift_amount),
                .npc(PC+32'd4),
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
    
    // Instantiating the module that changes the program counter according to the instruction 
    programCounter pc(.branch(branch_success),
                    .offset(offset_out),
                    .clk(clk),
                    .reset(reset),
                    .PC(PC),
                    .PC_next(PC_next));
    
    // Instantiatig the module to decide the offset value in case there is a branch instruction 
    branchLogic bl(.op_code(op_code),
                .offset_in(offset),
                .alu_result(alu_result),
                .clk(clk),
                .reset(reset),
                .zero_flag(zero_flag),
                .sign_flag(sign_flag),
                .carry_flag(carry_flag),
                .PC(PC),
                .branch_success(branch_success),
                .offset_out(offset_out));

endmodule 