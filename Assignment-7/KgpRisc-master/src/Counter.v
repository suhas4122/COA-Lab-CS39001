`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:23 11/08/2012 
// Design Name: 
// Module Name:    Counter 
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
module Counter(
	input clk,
	input reset,
	output reg [31:0] clk_new
    );
	 
	 always @(posedge clk or posedge reset)
		begin
			if(reset)
				begin
					clk_new <= 32'b0;
				end
			else
				begin
					clk_new <= clk_new + 1;
				end
		end

endmodule
