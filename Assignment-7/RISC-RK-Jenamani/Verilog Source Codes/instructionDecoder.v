`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:07 10/16/2019 
// Design Name: 
// Module Name:    instructionDecoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instructionDecoder(
    input wire [31:0] instruction,
    output wire [1:0] op,
    output wire [4:0] rs,
    output wire [4:0] rt,
    output wire [3:0] func,
    output wire [15:0] offset
    );

	assign {op,rs,rt,func,offset} = instruction;

endmodule
