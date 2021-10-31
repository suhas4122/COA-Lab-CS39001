`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:27 11/06/2019 
// Design Name: 
// Module Name:    topModule 
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
module topModule(
    input clk,
    input reset, 
	 output [5:0] PC_out,
	 output [9:0] alu_result_out
    );
	 
	reg [31:0] program_output;
	wire [31:0] alu_result;
	wire [31:0] alu_result_extension;
	
	wire [31:0] PC;
	wire [31:0] PC_branch;
	
	wire [1:0] opcode;
	wire [3:0] func; 
	wire [4:0] reg_addr_1, reg_addr_2;
	wire [15:0] offset;
	
	wire [31:0] instruction;
	
	wire [15:0] jump_offset; // branching_logic 
	
	wire [4:0] regWriteAddr; // used to write to register
	
	wire [3:0] alu_control; // The control signal to the ALU
	wire isBranch, regWrite, MemWrite,MemRead,ALU_src,const_src,reg_data,reg_to_pc,regWrite_select; // The control signal form the control unit


	wire [31:0] memDataOut; // the output from the Data memory
	wire [31:0] alu_result_temp, alu_result_extension_temp; // a temporary input to the muxs and is the alu's result
	wire [31:0] regWriteData, regReadData_1, regReadData_2; // Register Bank and Data Memory data Buses
	wire [31:0] regWriteData_temp;   // output of mux from alu/ data memory -> reg bank
	
	wire zeroFlag, carryFlag, signFlag, overflowFlag; // The flags from the ALU


	reg [3:0] counter;
	wire pc_clk;
	assign pc_clk = (counter[3] == 1) ? 1'b1 : 1'b0;
	
	initial 
		begin
			counter = 4'b0000;
		end
	
	always @(posedge clk)
	begin
		if(counter != 4'b1000)
			begin
				counter = counter + 1;
			end
		else
			begin
				counter = 4'b0000;
			end
		end	
	
	programCounter pc(.clk(pc_clk), 
							.reset(reset), 
							.branch_flag(branch_flag), 
							.offset(jump_offset),
							.PC(PC));														
	
	instructionFetch IF (.clk(clk), 
								.PC(PC), 
								.reset(reset),
						    	.instruction(instruction));
	
	instructionDecoder ID (.instruction(instruction),
                      .op(opcode),
							 .rs(reg_addr_1),
							 .rt(reg_addr_2),
							 .func(func),
							 .offset(offset));	
	
	controlUnit CU ( .selector({opcode,func}),
						  .clk(clk),
						  .reset(reset),
						  .alu_selector(alu_control),
						  .is_branch(isBranch),
						  .write_to_reg(regWrite),
						  .write_to_memory(MemWrite),
                    .read_from_memory(MemRead),
						  .ALU_src(ALU_src),
						  .register_data(reg_data),
					     .constant_src(const_src),
						  .reg_to_PC(reg_to_pc),
						  .select_reg_write(regWrite_select));


	LoadStoreUnit LSU ( .clk(clk), 
							  .reset(reset), 
							  .write_to_memory(MemWrite), 
							  .read_from_memory(MemRead), 
							  .address(alu_result_temp),
							  .input_data(regReadData_2), 
							  .output_data(memDataOut));

	// temp for testing
//	MUX_32b_2_to_1 reg_input(.a(memDataOut),.b(alu_result_temp),.select(reg_data),.out(regWriteData));

	MUX_32b_2_to_1 reg_input(.a(memDataOut),.b(alu_result_temp),.select(reg_data),.out(regWriteData_temp));
	MUX_32b_2_to_1 regBank_pc_input(.a(regWriteData_temp),.b(PC),.select(reg_to_pc),.out(regWriteData));

	// temp for testing
	// assign regWriteData = alu_result_temp;
	// assign regWriteAddr = reg_addr_1;

	
	wire [4:0] reg_addr_1_final; // the final input to the register bank and the output of a MUX

	MUX_5b_2_to_1 regBank_addr_input (.a(reg_addr_1),.b(5'b11111),.select(reg_to_pc),.out(reg_addr_1_final));
	
	//Declaration of the reister BAnk
	 MUX_5b_2_to_1 regWriteAddr_select (.a(reg_addr_1_final),.b(reg_addr_2),.select(regWrite_select),.out(regWriteAddr));
	
	registerBank RB ( .clk(pc_clk),
							.reset(reset),
							.writeBool(regWrite),
							.writeAddress(regWriteAddr), 
							.writeData(regWriteData),
							.reg_1_Address(reg_addr_1_final),
							.reg_2_Address(reg_addr_2),
							.reg_1_Data(regReadData_1),
							.reg_2_Data(regReadData_2));
					  
	wire [31:0] alu_input_2;

	MUX_32b_2_to_1 alu_input_mux(.a(regReadData_2),.b({{16{offset[15]}},offset}),.select(ALU_src),.out(alu_input_2));					  

	arithmeticLogicalUnit ALU (.A(regReadData_1),
									  .B(alu_input_2),
									  .selector(alu_control),
									  .out(alu_result_temp),
									  .out_extension(alu_result_extension_temp),
									  .carry(carryFlag),
									  .zero(zeroFlag), 
									  .sign(signFlag),
									  .overflow(overflowFlag));
	 
	// Assigning the ouput of the MUX to the ALU result
	assign alu_result = alu_result_temp;	
//	assign alu_result_extension = alu_result_extension_temp;	
	
	assign alu_result_extension = instruction;	
	//assign alu_result_extension = regReadData_1;	
	assign PC_out = PC[5:0];
	assign alu_result_out = alu_result_temp[9:0];
	always @(*)
		begin
			// program_output = {regReadData_1[9:0],regReadData_2[9:0],jump_offset[5:0],MemWrite,MemRead,reg_data,regWrite_select,regWrite,ALU_src};
			 program_output = PC;
		end

	
	branchingLogic BL ( .clk(pc_clk),
							.selector({opcode,func}),
			    			.input_offset(offset),
				   		.rs(alu_result),
					   	.reset(reset),
					   	.zflag_input(zeroFlag),
					   	.oflag_input(overflowFlag),
					   	.cflag_input(carryFlag),
					   	.sflag_input(signFlag),
					    	.output_offset(jump_offset),
					   	.branch_flag(branch_flag) );



endmodule
