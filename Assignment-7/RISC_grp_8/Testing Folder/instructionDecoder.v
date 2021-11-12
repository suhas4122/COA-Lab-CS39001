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

    assign op_code = instruction[31:26];
    assign reg_1 = instruction[25:21];
    assign reg_2 = instruction[20:16];
    assign shift_amount = instruction[15:11];
    assign func_code = instruction[10:0];
    assign imm_constant = instruction[15:0];
    assign offset = instruction[20:0];

endmodule 