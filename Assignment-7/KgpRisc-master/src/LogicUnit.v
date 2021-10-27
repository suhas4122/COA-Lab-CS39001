`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:53 10/16/2012 
// Design Name: 
// Module Name:    LogicUnit 
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
module LogicUnit(
	input [31:0] X,
	input [31:0] Y,
	input [2:0] LogicFunc,
	output [31:0] LogicUnitOut
    );

	reg [31:0] out;
	
	always @ (X or Y or LogicFunc)
		begin
			if(LogicFunc == 3'b000)
				begin
					out = X & Y;
				end
			if(LogicFunc == 3'b001)
				begin
					out = X ^ Y;
				end
			if(LogicFunc == 3'b010)
				begin
					out = X << Y;
				end
			if(LogicFunc == 3'b110)
				begin
					out = X >> Y;
				end
			if(LogicFunc == 3'b100)
				begin
					out = X >>> Y;
				end
		end	
		
		assign LogicUnitOut = out;

endmodule
