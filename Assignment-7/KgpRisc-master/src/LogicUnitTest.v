`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:34:43 10/16/2012
// Design Name:   LogicUnit
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/LogicUnitTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LogicUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LogicUnitTest;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [2:0] LogicFunc;

	// Outputs
	wire [31:0] LogicUnitOut;

	// Instantiate the Unit Under Test (UUT)
	LogicUnit uut (
		.X(X), 
		.Y(Y), 
		.LogicFunc(LogicFunc), 
		.LogicUnitOut(LogicUnitOut)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		LogicFunc = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	initial 
		begin
			X = 32'b011010; Y = 32'b00010; LogicFunc = 3'b000;
			#10; X = 32'b011010; Y = 32'b00010; LogicFunc = 3'b001;
			#10; X = 32'b011010; Y = 32'b00010; LogicFunc = 3'b010;
			#10; X = 32'b011010; Y = 32'b00010; LogicFunc = 3'b110;
			#10; X = 32'b011010; Y = 32'b00010; LogicFunc = 3'b100;
		end
      
endmodule

