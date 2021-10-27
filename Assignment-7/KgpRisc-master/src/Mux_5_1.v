`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:17 10/31/2012 
// Design Name: 
// Module Name:    Mux_5_1 
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
module Mux_5_1(
	input [1:0] A,
	input [1:0] B,
	input [1:0] C,
	input [1:0] D,
	input [1:0] E,
	input [2:0] Sel,
	output [1:0] Out
    );

	reg [1:0] out1;
	
	always @ (A or B or C or D or E or Sel)
		begin
			if(Sel == 3'b000)
				begin
					assign out1 = A;
				end
			if(Sel == 3'b001)
				begin
					assign out1 = B;
				end
			if(Sel == 3'b010)
				begin
					assign out1 = C;
				end
			if(Sel == 3'b011)
				begin
					assign out1 = D;
				end
			if(Sel == 3'b100)
				begin
					assign out1 = E;
				end
		end
		
	assign Out = out1;

endmodule
