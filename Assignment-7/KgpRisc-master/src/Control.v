`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:28:11 10/31/2012
// Design Name:   ControlUnit
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/Control.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control;

	// Inputs
	reg [5:0] OpCode;
	reg [4:0] Funct;

	// Outputs
	wire [1:0] RegDst1;
	wire RegWrite1;
	wire [1:0] AluSrc1;
	wire ALUFunc1;
	wire DataRead1;
	wire DataWrite1;
	wire [1:0] RegInData1;
	wire [1:0] PCUpdate1;
	wire LogicSel1;
	wire [2:0] LogicFunc1;
	wire FnSel1;
	wire FnClass1;
	wire BrSel1;
	wire BCD1;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.OpCode(OpCode), 
		.Funct(Funct), 
		.RegDst1(RegDst1), 
		.RegWrite1(RegWrite1), 
		.AluSrc1(AluSrc1), 
		.ALUFunc1(ALUFunc1), 
		.DataRead1(DataRead1), 
		.DataWrite1(DataWrite1), 
		.RegInData1(RegInData1), 
		.PCUpdate1(PCUpdate1), 
		.LogicSel1(LogicSel1), 
		.LogicFunc1(LogicFunc1), 
		.FnSel1(FnSel1), 
		.FnClass1(FnClass1), 
		.BrSel1(BrSel1), 
		.BCD1(BCD1)
	);

	initial begin
		// Initialize Inputs
		OpCode = 0;
		Funct = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	initial 
	 begin
	 
	 end
      
endmodule

