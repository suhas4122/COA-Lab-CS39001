`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:39 11/04/2019 
// Design Name: 
// Module Name:    controlUnit 
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
module controlUnit(
    input [5:0] selector,
    input clk,
    input reset,
    output reg [3:0] alu_selector,
    output reg is_branch,
    output reg write_to_reg,
    output reg write_to_memory,
    output reg read_from_memory,
    output reg ALU_src,
    output reg register_data,
    output reg constant_src,
    output reg reg_to_PC,
    output reg select_reg_write
    );
	 
	 
	always@(*)
	begin
		if(reset) // reset all flags to zero
			begin
				alu_selector <= 0;
				is_branch <= 0;
				write_to_reg <= 0;
				write_to_memory <= 0;
				read_from_memory <= 0;
				ALU_src <= 0;
				register_data <= 0;
				constant_src <= 0;
				reg_to_PC <= 0;
				select_reg_write <= 0;
			end
		else
			begin
				case(selector)
					6'b00000:						// Add
						begin
							alu_selector <= 4'b0101;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b00001:						// Multu
						begin
							alu_selector <= 4'b0111;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b00010:						// Mult
						begin
							alu_selector <= 4'b0110;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b000011: 						// Complement
						begin
							alu_selector <= 4'b0000;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b000100: 						// Add immediate
					begin
							alu_selector <= 4'b0101;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b000101: 						// Comp immediate	
						begin
							alu_selector <= 4'b0000;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b000110: 						// And
						begin
							alu_selector <= 4'b0001;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b000111: 						// XOR
						begin
							alu_selector <= 4'b0010;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b001000: 						// Shift Left Logical
						begin
							alu_selector <= 4'b0011;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 1;
							constant_src <= 1;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b001001: 						// Shift Right Logical
						begin
							alu_selector <= 4'b0100;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 1;
							constant_src <= 1;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b001010: 						// Shift Left Variable
						begin
							alu_selector <= 4'b0011;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b001011: 						// Shift Right Variable
						begin
							alu_selector <= 4'b0100;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b001100: 						// Shift Right Arithmetic
						begin
							alu_selector <= 4'b1000;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 1;
							constant_src <= 1;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b001101: 						// Shift Right Arithmetic Variable
						begin
							alu_selector <= 4'b1000;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 1;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b010000: 						// Load Word
						begin
							alu_selector <= 4'b1011;
							is_branch <= 0;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 1;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 1;
						end	
					6'b010001: 						// Store Word
						begin
							alu_selector <= 4'b1011;
							is_branch <= 0;
							write_to_reg <= 0;
							write_to_memory <= 1;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 1;
						end	
					6'b100000: 						// Unconditional branch
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end		
					6'b100001: 						// Branch to Register
						begin
							alu_selector <= 4'b1001;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end	
					6'b100010: 						// Branch on Zero
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end								
					6'b100011: 						// Branch on not zero
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end	
					6'b100100: 						// Branch on carry
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end	
					6'b100101: 						// Branch on not carry
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end	
					6'b100110: 						// Branch on sign
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end	
					6'b100111: 						// Branch on not sign
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end	
					6'b101000: 						// Branch on overflow
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end
					6'b101001: 						// Branch on not overflow
						begin
							alu_selector <= 4'b1010;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 0;
							select_reg_write <= 0;
						end		
					6'b101010: 						// Call
						begin
							alu_selector <= 4'b0101;
							is_branch <= 1;
							write_to_reg <= 1;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 1;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 1;
							select_reg_write <= 0;
						end	
					6'b101011: 						// Return
						begin
							alu_selector <= 4'b1001;
							is_branch <= 1;
							write_to_reg <= 0;
							write_to_memory <= 0;
							read_from_memory <= 0;
							ALU_src <= 0;
							register_data <= 0;
							constant_src <= 0;
							reg_to_PC <= 1;
							select_reg_write <= 0;
						end								
				endcase
			end
	end
endmodule

