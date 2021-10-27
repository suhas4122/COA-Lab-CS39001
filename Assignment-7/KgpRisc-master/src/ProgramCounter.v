`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:27 10/31/2012 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(
	input clk,
	input reset,
	input [31:0] PC_in,
	output reg [31:0] PC_out
    );

	always @(posedge clk)
		begin
			if(reset)
				begin
					assign PC_out = 32'b0;
				end
			else
				begin
					assign PC_out = PC_in;
				end
		end

endmodule
