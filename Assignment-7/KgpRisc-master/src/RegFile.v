`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:42:38 10/29/2012 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(
	input clk,
	input reset,
	input RegWrite,
	input [4:0] ReadReg1,
	input [4:0] ReadReg2,
	input [4:0] WriteAddr,
	input [4:0] reg_addr,
	input [31:0] WriteData,
	output [31:0] RegData1,
	output [31:0] RegData2,
	output [31:0] RFOutput
    );

	reg [31:0] RF [0:31];
	integer i;
	
	//Read Operation	
	initial
		begin
			for(i=0;i<32;i=i+1)
				 RF[i] = i;
		end
	
   assign RegData1 = RF[ReadReg1];
	assign RegData2 = RF[ReadReg2];
   assign RFOutput = RF[reg_addr];


	//Write Operation
	always @(posedge clk or posedge reset)
		begin
			if(reset)
				begin
					for(i=0;i<32;i=i+1)
						   RF[i] = i;
				end
			else
				begin
					if(RegWrite)
						begin
							RF[WriteAddr] = WriteData;
							$display("RF[%d] = %d",WriteAddr,WriteData);
						end
				end
		end

endmodule
