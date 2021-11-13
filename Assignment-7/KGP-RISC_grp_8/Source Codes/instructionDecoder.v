`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module instructionDecoder(
    input [31:0] instruction,
    output wire [5:0] op_code,
    output wire [4:0] reg_1, 
    output wire [4:0] reg_2, 
    output wire [4:0] shift_amount, 
    output wire [10:0] func_code,
    output wire [15:0] imm_constant, 
    output wire [20:0] offset 
);
    // module to split 32 bit address into various parts as per ISA format

    assign op_code = instruction[31:26];        // 6 bit opcode 
    assign reg_1 = instruction[25:21];          // 5 bit destination register
    assign reg_2 = instruction[20:16];          // 5 bit source register
    assign shift_amount = instruction[15:11];   // 5 bit shift amount in case of shift instructions
    assign func_code = instruction[10:0];       // 11 bit function code in case of R type instructions
    assign imm_constant = instruction[15:0];    // 16 bit immediate integer constant for I type instructions
    assign offset = instruction[20:0];          // 21 bit offset for branch instructions

endmodule 