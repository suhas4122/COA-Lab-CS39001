`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module datapath(
    input [4:0] reg_1,          
    input [4:0] reg_2,
    input [4:0] shift_amount,
    input [31:0] npc,
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
    /*
        reg_1: Register 1
        reg_2: Register 2
        shift_amount: Shift amount for shift operations
        npc: Next program counter
        imm_constant: Immediate constant 
        alu_control: ALU control signal 
        ab_set: To indicate the complement operation
        reg_write: To indicate the write to register
        mem_write: To indicate the write to memory
        ALU_src: To indicate the ALU source is register or immediate constant
        reg_data: Register data
        const_src: Flag to indicate if ALU source is immediate constant
        reg_to_pc: Flag to indicate if PC is to be written from register
        reg_write_select: Flag to indicate if register needs to be written to register file
        mem_read: Flag to indicate if memory needs to be read
        clk: Clock signal
        reset: Reset signal
        alu_result: ALU result
        carry_flag: Carry flag from ALU operation
        sign_flag: Sign flag from ALU operation
        zero_flag: Zero flag from ALU operation
    */
    wire ram_control;                               // RAM control signal
    wire [4:0] reg_1_out;                           // Register 1 output
    wire [4:0] reg_write_out;                       // Register to be written to 
    wire [31:0] mem_data_out;                       // Memory data output
    wire [31:0] reg_1_data;                         // Register 1 data
    wire [31:0] reg_2_data;                         // Register 2 data
    wire [31:0] reg_write_data;                     // Data to be written to register finally
    wire [31:0] reg_write_data_temp;                // Temporary variable to find reg_write_data
    wire [31:0] alu_input_2;                        // ALU input 2
    wire [31:0] alu_const_input;                    // Constant input for ALU if the ALU source is immediate constant
    wire [9:0] alu_res_temp;                        // Temporary variable to find alu_result

    MUX_32b_2_to_1 m1(.a(mem_data_out),             // MUX to select the data to be written to register
                    .b(alu_result),
                    .select(reg_data),
                    .out(reg_write_data_temp));

    MUX_32b_2_to_1 m2(.a(reg_write_data_temp),      // MUX to select the data to be written to register
                    .b(npc),
                    .select(reg_to_pc),
                    .out(reg_write_data));

    MUX_32b_2_to_1 m3(.a({{16{imm_constant[15]}},imm_constant}),    // MUX to select the constant input for ALU if the ALU source is immediate constant
                    .b({27'b0, shift_amount}),
                    .select(const_src),
                    .out(alu_const_input));
    
    MUX_32b_2_to_1 m4(.a(reg_2_data),               // MUX to select the ALU input 2
                    .b(alu_const_input),
                    .select(ALU_src),
                    .out(alu_input_2));

    MUX_5b_2_to_1 m5(.a(reg_1),                     // MUX to select the register 1
                    .b(5'd31),
                    .select(reg_to_pc),
                    .out(reg_1_out));

    MUX_5b_2_to_1 m6(.a(reg_1_out),                 // MUX to select the register 1
                    .b(reg_2),
                    .select(reg_write_select),
                    .out(reg_write_out));
    
    registerfile rf(.reg_write(reg_write),          // Register file module instantiation
                    .reg_write_data(reg_write_data),
                    .reg_1(reg_1),
                    .reg_2(reg_2),
                    .reg_write_adder(reg_write_out),
                    .clk(clk),
                    .reset(reset),
                    .reg_data_1(reg_1_data),
                    .reg_data_2(reg_2_data));
	
    assign ram_control = (mem_write & (~mem_read)); // RAM control signal
    assign alu_res_temp = alu_result[11:2];         
    
    dataMemory dm(.clka(~clk),                      // Data memory module instantiation
                .wea(ram_control),
                .ena(mem_write|mem_read),				 
                .addra(alu_res_temp), 
                .dina(reg_2_data), 
                .douta(mem_data_out));

    arithmeticLogicalUnit alu(.A(reg_1_data),       // ALU module instantiation
                            .B(alu_input_2),
                            .alu_control(alu_control),
                            .ab_set(ab_set),
                            .alu_result(alu_result),
                            .carry_flag(carry_flag),
                            .zero_flag(zero_flag),
                            .sign_flag(sign_flag));

endmodule 

