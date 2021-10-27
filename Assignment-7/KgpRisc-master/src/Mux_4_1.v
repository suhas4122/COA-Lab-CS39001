`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:48:11 10/15/2012 
// Design Name: 
// Module Name:    Mux_4_1 
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
module Mux_4_1(
	input [31:0] A,
	input [31:0] B,
	input [31:0] C,
	input [31:0] D,
	input [1:0] Sel,
	output [31:0] Out
    );

	reg [31:0] out;
	
	always @ (A or B or C or D or Sel)
		begin
			if(Sel == 2'b00)
				begin
					assign out = A;
				end
			if(Sel == 2'b01)
				begin
					assign out = B;
				end
			if(Sel == 2'b10)
				begin
					assign out = C;
				end
			if(Sel == 2'b11)
				begin
					assign out = D;
				end
		end
		
	assign Out = out;

endmodule
