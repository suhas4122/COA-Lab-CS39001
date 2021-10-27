`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:49 10/31/2012 
// Design Name: 
// Module Name:    Mux_3_1_5bit 
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
module Mux_3_1_5bit(
	input [4:0] A,
	input [4:0] B, 
	input [4:0] C,
	input [1:0] Sel,
	output [4:0] Out
    );
	 
	reg [4:0] out1;
	 
	always @ (A or B or C or Sel)
		begin
			if(Sel == 2'b00)
				begin
					assign out1 = A;
				end
			if(Sel == 2'b01)
				begin
					assign out1 = B;
				end
			if(Sel == 2'b10)
				begin
					assign out1 = C;
				end
		end
		
	assign Out = out1; 

endmodule
