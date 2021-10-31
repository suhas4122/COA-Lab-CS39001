`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:24:03 11/12/2019
// Design Name:   registerBank
// Module Name:   C:/Users/Rajat Kumar Jenamani/Desktop/KGP_RISC (2)/KGP_RISC/registerBank_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registerBank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module registerBank_testbench;

	// Inputs
	reg writeBool;
	reg [4:0] writeAddress;
	reg [31:0] writeData;
	reg [4:0] reg_1_Address;
	reg [4:0] reg_2_Address;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] reg_1_Data;
	wire [31:0] reg_2_Data;

	// Instantiate the Unit Under Test (UUT)
	registerBank uut (
		.writeBool(writeBool), 
		.writeAddress(writeAddress), 
		.writeData(writeData), 
		.reg_1_Address(reg_1_Address), 
		.reg_2_Address(reg_2_Address), 
		.clk(clk), 
		.reset(reset), 
		.reg_1_Data(reg_1_Data), 
		.reg_2_Data(reg_2_Data)
	);

	initial begin
		// Initialize Inputs
		writeBool = 0;
		writeAddress = 0;
		writeData = 0;
		reg_1_Address = 0;
		reg_2_Address = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		$monitor("clk = %b | reset = %b | writeBool = %b | writeAddress = %b | writeData= %b | reg_1_Address = %b | reg_2_Address = %b | reg_1_Data = %b | reg_2_Data = %b",clk, reset, writeBool, writeAddress, writeData, reg_1_Address, reg_2_Address, reg_1_Data, reg_2_Data);	
		
		
		// reset
		#10; reset = 1; 
		#10; reset = 0; 
		
		
		// set writeBool = 1
		#10; clk = 0; writeBool = 1;
		#10; clk = 1; writeBool = 1;
		
		// write
		#10; clk = 0; writeData = 31'b1110000001110000000000000110000; writeAddress = 5;
		#10; clk = 1; writeData = 31'b1110000001110000000000000110000; writeAddress = 5;

		// set writeBool = 1
		#10; clk = 0; writeBool = 1;
		#10; clk = 1; writeBool = 1;		

		#10; clk = 0; writeData = 31'b00000000000011111000000000110011; writeAddress = 8;
		#10; clk = 1; writeData = 31'b00000000000011111000000000110011; writeAddress = 8;
		
		// set writeBool = 1
		#10; clk = 0; writeBool = 1;
		#10; clk = 1; writeBool = 1;		

		#10; clk = 0; writeData = 31'b11000000000011111000000000110011; writeAddress = 3;
		#10; clk = 1; writeData = 31'b11000000000011111000000000110011; writeAddress = 3;
		
		// set writeBool = 0;
		#10; clk = 0; writeBool = 0;
		#10; clk = 1; writeBool = 0; 
		
		#10; clk = 0; reg_1_Address = 5; reg_2_Address = 3;
		#10; clk = 1; reg_1_Address = 5; reg_2_Address = 3;

		// set writeBool = 0;
		#10; clk = 0; writeBool = 0;
		#10; clk = 1; writeBool = 0; 
		
		#10; clk = 0; reg_1_Address = 5; reg_2_Address = 8;
		#10; clk = 1; reg_1_Address = 5; reg_2_Address = 8;

		// set writeBool = 0;
		#10; clk = 0; writeBool = 0;
		#10; clk = 1; writeBool = 0; 		
		
		#10; clk = 0; reg_1_Address = 8; reg_2_Address = 3;
		#10; clk = 1; reg_1_Address = 8; reg_2_Address = 3;

		// set writeBool = 0;
		#10; clk = 0; writeBool = 0;
		#10; clk = 1; writeBool = 0; 
		
		#10; clk = 0; reg_1_Address = 2; reg_2_Address = 1;
		#10; clk = 1; reg_1_Address = 2; reg_2_Address = 1;

		$finish;
	

	end
      
endmodule

