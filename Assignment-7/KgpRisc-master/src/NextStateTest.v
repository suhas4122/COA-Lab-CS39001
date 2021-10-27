`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:43:06 10/31/2012
// Design Name:   NextState
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/NextStateTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NextState
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module NextStateTest;

	// Inputs
	reg [31:0] PC;
	reg [1:0] PCSel;
	reg [31:0] rs;
	reg [15:0] imm;

	// Outputs
	wire [31:0] UpdatedPC;
	wire [31:0] IncrPC;

	// Instantiate the Unit Under Test (UUT)
	NextState uut (
		.PC(PC), 
		.PCSel(PCSel), 
		.rs(rs), 
		.imm(imm), 
		.UpdatedPC(UpdatedPC),
		.IncrPC(IncrPC)
	);

	initial begin
		// Initialize Inputs
		PC = 0;
		PCSel = 0;
		rs = 0;
		imm = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial 
		begin
			PC = 32'b1010; PCSel = 2'b00; rs = 32'b110; imm = 16'b10;
			#10; PC = 32'b1010; PCSel = 2'b01; rs = 32'b110; imm = 16'b10;
			#10; PC = 32'b1010; PCSel = 2'b01; rs = 32'b110; imm = 16'b1000000000000010;
			#10; PC = 32'b1010; PCSel = 2'b10; rs = 32'b110; imm = 16'b10;
		end
      
endmodule

