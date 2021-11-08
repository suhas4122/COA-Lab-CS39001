`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module dataPath(
    input [5:0] reg_1,
    input [5:0] reg_2,
    input [5:0] shift_amount,
    input [15:0] imm_constant,
    input [3:0] alu_control,
    input ab_set,
    input reg_write,
    input mem_write,
    input ALU_src,
    input reg_data,
    input const_src,
    input reg_to_pc,
    input reg_write_select,
    input mem_read,
    input clk,
    input reset,
    output wire [31:0] alu_result,
    output wire carry_flag,
    output wire sign_flag,
    output wire zero_flag
);
    
    wire [4:0] reg_1_out;
    wire [4:0] reg_write_out;
    wire [31:0] mem_data_out;
    wire [31:0] reg_1_data;
    wire [31:0] reg_2_data;
    wire [31:0] reg_write_data;
    wire [31:0] reg_write_data_temp;
    wire [31:0] alu_input_2;
    wire [31:0] alu_const_input;

    MUX_32b_2_to_1 m1(.a(mem_data_out),
                    .b(alu_result),
                    .select(reg_data),
                    .out(reg_write_data_temp));

    MUX_32b_2_to_1 m2(.a(mem_data_out),
                    .b(alu_result),
                    .select(reg_data),
                    .out(reg_write_data_temp));

    MUX_32b_2_to_1 m3(.a({{11{imm_constant[20]}},imm_constant}),
                    .b({27'b0,shift_amount}),
                    .select(const_src),
                    .out(alu_const_input));
    
    MUX_32b_2_to_1 m4(.a(reg_2_data),
                    .b(alu_const_input),
                    .select(ALU_src),
                    .out(alu_input_2));

    MUX_5b_2_to_1 m5(.a(reg_1),
                    .b(5'd31),
                    .select(reg_to_pc),
                    .out(reg_1_out));
    
    MUX_5b_2_to_1 m6(.a(reg_1),
                    .b(reg_2),
                    .select(reg_write_select),
                    .out(reg_write_out));

    registerfile rf(.reg_write(reg_write),
                    .reg_write_data(reg_write_data),
                    .reg_1(reg_1_out),
                    .reg_2(reg_2),
                    .reg_write_adder(reg_write_out),
                    .clk(clk),
                    .reset(reset),
                    .reg_data_1(reg_1_data),
                    .reg_data_2(reg_2_data));
    
    DataMemory dm(.address(alu_result), 
                .data_in(reg_2_data), 
                .mem_read(mem_read), 
                .mem_write(mem_write), 
                .data_out(mem_data_out));

    arithmeticLogicalUnit alu(.A(reg_1_data),
                            .B(alu_input_2),
                            .alu_control(alu_control),
                            .ab_set(ab_set),
                            .alu_result(alu_result),
                            .carry_flag(carry_flag),
                            .zero_flag(zero_flag),
                            .sign_flag(sign_flag));

endmodule 
