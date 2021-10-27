`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:43:44 10/31/2012 
// Design Name: 
// Module Name:    SignExtend_5to32 
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
module SignExtend_5to32(
	input [4:0] In,
	output [31:0] Out
    );
	 
	 assign Out[31:5] = {27{In[4]}};
	 assign Out[4:0] = In[4:0];

endmodule
