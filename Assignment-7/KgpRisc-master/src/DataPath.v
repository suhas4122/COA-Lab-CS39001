`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:07 10/31/2012 
// Design Name: 
// Module Name:    DataPath 
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
module DataPath(
	input clk,
	input reset,
	input [4:0] reg_addr,
	output [31:0] reg_out
    );
	 
	wire [31:0] Instruction;
	reg [31:0] PC;
	wire [5:0] OpCode;
	wire [5:0] Funct;
	wire [4:0] RegFile_WA;
	wire [31:0] RegFileOut1;
	wire [31:0] RegFileOut2;
	wire [15:0] imm;
	wire [4:0] sh;
	wire [31:0] sh_SE;
	wire [31:0] imm_SE;
	wire [31:0] ALUIn2; 
	wire [31:0] PC_Updated;
	wire Carry;
	wire [4:0] rs_RFIn;
	wire [4:0] rt_RFIn;
	wire [31:0] DOut;
	wire [31:0] PC_Incr;
	wire [31:0] Register_Out;
	wire [31:0] ALUOut;
	wire [31:0] Data;
    wire [1:0] RegDst;
    wire RegWrite;
    wire [1:0] ALUSrc;
    wire DataRead;
    wire DataWrite;
    wire [1:0] RegInData;
    wire [2:0] PCUpdate;
    wire [2:0]LogicFunc;
    wire FnSel;
    wire FnClass;
    wire [1:0] BrSel;
    wire BCD;
	wire BrFlag;
	wire [1:0] PCSel;
	wire clk_new;
	wire [31:0] CounterOut;
	 
	 initial 
	begin
	PC = 32'b0;
	end
	
	 Counter count(clk,reset,CounterOut);

	 assign clk_new = CounterOut[23:22];
	 
	 I_Memory im(clk_new,PC[10:0],Instruction);
	 
	 assign OpCode = Instruction[31:26];
	 assign Funct = Instruction[5:0];
	 assign rs_RFIn = Instruction[25:21];
	 assign rt_RFIn = Instruction[20:16];
	 	 
	 ControlUnit cu(OpCode,Funct,RegDst,RegWrite,ALUSrc,DataRead,DataWrite,RegInData,PCUpdate,LogicFunc,FnSel,FnClass,BrSel,BCD);
	 Mux_3_1_5bit m1(rs_RFIn,rt_RFIn,5'b11111,RegDst,RegFile_WA); 
	 RegFile rf(clk_new,reset,RegWrite,rs_RFIn,rt_RFIn,RegFile_WA,reg_addr,Data,RegFileOut1,RegFileOut2,Register_Out); 
	
	 assign imm = Instruction[15:0];
	 assign sh = Instruction[10:6];
	  
	 SignExtend_5to32 se1(sh,sh_SE);
	 SignExtend se2(imm,imm_SE);
	 Mux_3_1 m2(RegFileOut2,imm_SE,sh_SE,ALUSrc,ALUIn2);
	 ALU alu(RegFileOut1,ALUIn2,FnSel,FnClass,LogicFunc,Carry,ALUOut);
	 D_Memory dc(clk_new,DataWrite,ALUOut[10:0],RegFileOut2,DOut);
	 BranchCheck bc(RegFileOut1,BrSel,BrFlag);
	 BranchSelect bs(Carry,BCD,BrFlag,PCUpdate,PCSel);
	 NextState na(PC,PCSel,RegFileOut1,imm,PC_Updated,PC_Incr);
	 
	 always @(posedge clk_new or posedge reset)
	begin
	if(reset)
	begin
	PC = 32'b0;
	end
	else
	begin
	PC = PC_Updated;
	end
	end
	 
	 Mux_3_1 m3(DOut,ALUOut,PC_Incr,RegInData,Data);
	 
	 assign reg_out = Register_Out;
	 
endmodule
