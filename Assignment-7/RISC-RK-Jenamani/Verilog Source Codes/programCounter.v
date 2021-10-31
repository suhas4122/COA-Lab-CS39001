`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:48 11/06/2019 
// Design Name: 
// Module Name:    programCounter 
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
module programCounter(
    input clk,
    input reset,
    input branch_flag,
	 input [15:0] offset,
    output reg [31:0] PC
    );


	wire [31:0] PC_next, PC_4, PC_branch;
	
	assign PC_4 = PC + 32'd1; 								// calculate pc for non-branching instructions
	assign PC_branch = PC + 32'd1 + {{16{offset[15]}},offset}; 	// calculate pc for branching instructions
	assign PC_next = (branch_flag)? PC_branch: PC_4; 			// Select next pc value

	initial
		begin
			PC = 32'd0; // init
		end	

		
	always @(posedge clk)
	begin
		if(reset == 1)
			begin
				PC = 32'd0; // reset condition -> 2nd Address on the Instruction Fetch Memory
			end
		else
			begin
				PC = PC_next; // set next value of pc
			end
	end

endmodule
