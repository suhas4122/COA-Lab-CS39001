`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:15:04 10/30/2012
// Design Name:   RegFile
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/RegFileTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegFileTest;

	// Inputs
	reg clk;
	reg reset;
	reg RegWrite;
	reg [4:0] ReadReg1;
	reg [4:0] ReadReg2;
	reg [4:0] WriteAddr;
	reg [4:0] reg_addr;
	reg [31:0] WriteData;

	// Outputs
	wire [31:0] RegData1;
	wire [31:0] RegData2;
	wire [31:0] RFOutput;

	// Instantiate the Unit Under Test (UUT)
	RegFile uut (
		.clk(clk), 
		.reset(reset), 
		.RegWrite(RegWrite), 
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.WriteAddr(WriteAddr),
		.reg_addr(reg_addr),
		.WriteData(WriteData), 
		.RegData1(RegData1), 
		.RegData2(RegData2),
		.RFOutput(RFOutput)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		RegWrite = 0;
		ReadReg1 = 0;
		ReadReg2 = 0;
		WriteAddr = 0;
		reg_addr = 0;
		WriteData = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
		
		initial
			begin
				clk = 1; reset = 1;
				#10; clk = 1; reset = 0; RegWrite = 1; ReadReg1 = 5'b00010; ReadReg2 = 5'b00111; WriteAddr = 5'b00111; reg_addr = 5'b00111; WriteData = 32'b100;
				#20; clk = 0; reset = 1;
/*PosEdge*/				#10; clk = 1; reset = 0; RegWrite = 1; ReadReg1 = 5'b00110; ReadReg2 = 5'b01110; WriteAddr = 5'b01110; reg_addr = 5'b01110; WriteData = 32'b110;
				#10; clk = 0 ; RegWrite = 1; ReadReg1 = 5'b00110; ReadReg2 = 5'b01110; WriteAddr = 5'b01110;reg_addr = 5'b01110; WriteData = 32'b110;
/*PosEdge*/				#10; clk = 1; reset = 1;
				#10; clk = 0; reset = 0;
/*PosEdge*/				#10; clk = 1; RegWrite = 0; ReadReg1 = 5'b00110; ReadReg2 = 5'b00101; WriteAddr = 5'b00101;reg_addr = 5'b00101; WriteData = 32'b111;
				#10; clk = 0;
/*PosEdge*/				#10; clk = 1; RegWrite = 1; ReadReg1 = 5'b00110; ReadReg2 = 5'b00101; WriteAddr = 5'b00101;reg_addr = 5'b00101; WriteData = 32'b111;

			end
      
endmodule

