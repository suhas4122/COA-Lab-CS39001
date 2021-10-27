`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:05 10/16/2012 
// Design Name: 
// Module Name:    BranchSelect 
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
module BranchSelect(
	input Carry,
	input BCD,
	input BrFlag,
	input [2:0] PCUpdate,
	output [1:0] PCSel
    );
	 
	 wire CarryOut;
	 wire [1:0] CarryOut_SE;
	 wire [1:0] BrFlag_SE;
	 
	 Mux_2_1_1bit m1(Carry,~Carry,BCD,CarryOut);
	 SignExtend_1to2 se1(CarryOut,CarryOut_SE);
	 SignExtend_1to2 se2(BrFlag,BrFlag_SE);
	 Mux_5_1 m2(2'b00,2'b01,CarryOut_SE,BrFlag_SE,2'b10,PCUpdate,PCSel);

endmodule
