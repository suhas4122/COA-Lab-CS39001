`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:50 11/01/2012 
// Design Name: 
// Module Name:    LeftShiftBy2 
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
module LeftShiftBy2(
	input [31:0] In,
	output [31:0] Out
    );
	 
	wire zero;
	 
	genvar i;
	
	generate
		for(i=0; i<30; i=i+1) 
		   begin : shift
				assign Out[i+2] = In[i]; 
			end
	endgenerate

   assign zero = 0;
	assign Out[0] = zero;
	assign Out[1] = zero;

endmodule
