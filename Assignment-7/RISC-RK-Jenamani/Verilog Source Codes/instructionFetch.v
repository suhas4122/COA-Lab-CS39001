`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:56 10/16/2019 
// Design Name: 
// Module Name:    instructionuctionFetch 
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
module instructionFetch(
    input [31:0] PC,
    input clk,
	 input reset,
    output [31:0] instruction
    );

	wire [9:0] rom_address;
	assign rom_address = PC[9:0];
	instructionMemory_v7_3 IM (.clka(~clk), .rsta(reset), .wea(1'b0), .addra(rom_address), .dina(32'd0), .douta(instruction));

endmodule
