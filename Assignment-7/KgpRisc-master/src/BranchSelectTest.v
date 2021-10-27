`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:22:42 10/16/2012
// Design Name:   BranchSelect
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/BranchSelectTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BranchSelect
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BranchSelectTest;

	// Inputs
	reg Carry;
	reg BCD;
	reg BrFlag;
	reg [2:0] PCUpdate;

	// Outputs
	wire [1:0] PCSel;

	// Instantiate the Unit Under Test (UUT)
	BranchSelect uut (
		.Carry(Carry), 
		.BCD(BCD), 
		.BrFlag(BrFlag), 
		.PCUpdate(PCUpdate), 
		.PCSel(PCSel)
	);

	initial begin
		// Initialize Inputs
		Carry = 0;
		BCD = 0;
		BrFlag = 0;
		PCUpdate = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial
		begin
		Carry = 1'b0; BCD = 1'b0; BrFlag = 1'b1; PCUpdate = 3'b000;  
		#10; Carry = 1'b0; BCD = 1'b0; BrFlag = 1'b1; PCUpdate = 3'b001;
		#10; Carry = 1'b0; BCD = 1'b0; BrFlag = 1'b1; PCUpdate = 3'b010;
		#10; Carry = 1'b1; BCD = 1'b0; BrFlag = 1'b1; PCUpdate = 3'b010;
		#10; Carry = 1'b0; BCD = 1'b1; BrFlag = 1'b1; PCUpdate = 3'b010;
      	#10; Carry = 1'b1; BCD = 1'b1; BrFlag = 1'b1; PCUpdate = 3'b010;
		#10; Carry = 1'b0; BCD = 1'b0; BrFlag = 1'b1; PCUpdate = 3'b011; 
		#10; Carry = 1'b1; BCD = 1'b1; BrFlag = 1'b1; PCUpdate = 3'b100;
		end
      
endmodule

