`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:14:49 11/01/2012
// Design Name:   DataPath
// Module Name:   C:/Users/Vaio/Desktop/Xilinx Projects/KGP_RISC/DataPathTest.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataPath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataPathTest;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] reg_addr;
	//reg [31:0] Instruction;

	// Outputs
	//wire [1:0] RegDst1;
	//wire RegWrite1;
	//wire [1:0] AluSrc1;
	//wire DataRead1;
	//wire DataWrite1;
	//wire [1:0] RegInData1;
	//wire [2:0] PCUpdate1;
	//wire [2:0] LogicFunc1;
	//wire FnSel1;
	//wire FnClass1;
	//wire [1:0] BrSel1;
	//wire BCD1;
	//wire [5:0] OpCode_Out;
	//wire [5:0] Funct_Out;
	//wire [4:0] rs;
	//wire [4:0] rt;
	//wire [31:0] ProgCounter;
	//wire [31:0] rs_RF;
	//wire [31:0] rt_RF;
	//wire [31:0] ALUOutput;
	//wire [31:0] UpdatedPC;
	wire [31:0] reg_out;

	// Instantiate the Unit Under Test (UUT)
	DataPath uut (
		.clk(clk), 
		.reset(reset), 
		.reg_addr(reg_addr),
		.reg_out(reg_out)
		//.Instruction(Instruction), 
		//.RegDst1(RegDst1), 
		//.RegWrite1(RegWrite1), 
		//.AluSrc1(AluSrc1), 
		//.DataRead1(DataRead1), 
		//.DataWrite1(DataWrite1), 
		//.RegInData1(RegInData1), 
		//.PCUpdate1(PCUpdate1), 
		//.LogicFunc1(LogicFunc1), 
		//.FnSel1(FnSel1), 
		//.FnClass1(FnClass1), 
		//.BrSel1(BrSel1), 
		//.BCD1(BCD1), 
		//.OpCode_Out(OpCode_Out), 
		//.Funct_Out(Funct_Out), 
		//.rs(rs), 
		//.rt(rt),
		//.ProgCounter(ProgCounter),
		//.rs_RF(rs_RF),
		//.rt_RF(rt_RF),
		//.ALUOutput(ALUOutput)
		//.UpdatedPC(UpdatedPC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		reg_addr = 5'b00100;
		//Instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always
		begin
			#20 clk = ~clk;
		end
	
	/*initial
		begin
			Instruction = 32'b000000,00110,01110,00110,00000,010000;                  //add  1  //
			#10; Instruction = 32'b000000,11110,01110,11110,00000,010000;            //comp  2   //
			#10; Instruction = 32'b000000,00100,01110,00110,00000,011000;            //and   3 //
			#10; Instruction = 32'b000000,00110,01110,00110,00000,011001;           //xor    4 //
			#10; Instruction = 32'b001100,00011,00011,0000000000000111;             //addi  5  //
			#10; Instruction = 32'b001101,00011,00000,0000000000000111;             //compi 6  //
			#10; Instruction = 32'b101010,01010,01010,0000000000000001;            //sw 7   //
			#10; Instruction = 32'b101001,01000,01000,0000000000000011;            //lw 8   //
			#10; Instruction = 32'b000000,10010,00011,10010,00000,011011;            //shllv 9//  
			#10; Instruction = 32'b000000 10101 00001 10101 00000 011111;           //shrlv  10 //  
			#10; Instruction = 32'b000000 10110 00010 10110 00000 011101;           //shrav  11 
			#10; Instruction = 32'b000000,10001,10001,10001,00010,011010;              //shll 12
			#10; Instruction = 32'b000000,10001,10001,10001,00010,011110;             //shrl  13
			#10; Instruction = 32'b000001,10001,000000000000000000001;            //bltz  14
			#10; Instruction = 32'b000011,10101,000000000000000000001;             //bz   15  //
			#10; Instruction = 32'b000101,10101,000000000000000000001;             //bnz  16
			#10; Instruction = 32'b000110,00000000000000000000000001;               //bcy 17
			#10; Instruction = 32'b000111,00000000000000000000000011;               //bncy 18
         #10; Instruction = 32'b000101,00000000000000000000000011;               //bl 19
         #10; Instruction = 32'b000000,11111000000000000000001000;               //br 20

		end*/
      
endmodule

