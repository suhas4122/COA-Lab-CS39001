`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:35 10/15/2012 
// Design Name: 
// Module Name:    BranchCheck 
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
module BranchCheck(
	input [31:0] X,
	input [1:0] BrSel,
	output BrFlag
    );

	reg brFlag1;
	
	always @ (X or BrSel)
		begin
			if(BrSel == 2'b00)
				begin
					if(X < 32'b0)
						begin
							assign brFlag1 = 1'b1;
						end
					else
						begin
							assign brFlag1 = 1'b0;
						end
				end
			if(BrSel == 2'b01)
				begin
					if(X != 32'b0)
						begin
							assign brFlag1 = 1'b1;
						end
					else
						begin
							assign brFlag1 = 1'b0;
						end
				end
			if(BrSel == 2'b10)
				begin
					if(X == 32'b0)
						begin
							assign brFlag1 = 1'b1;
						end
					else
						begin
							assign brFlag1 = 1'b0;
						end
				end
		end
		
		assign BrFlag = brFlag1;

endmodule
