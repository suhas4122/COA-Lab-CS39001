`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:05 10/30/2019 
// Design Name: 
// Module Name:    arithmeticLogicalUnit 
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
module arithmeticLogicalUnit(
    input [31:0] A,
    input [31:0] B,
    input [3:0] selector,
    output reg [31:0] out,
    output reg [31:0] out_extension,
    output reg carry,
    output reg zero,
    output reg sign,
    output reg overflow
    );

	wire unsigned [31:0] unsigned_A, unsigned_B, unsigned_comp_A, unsigned_comp_B;
	
	wire [31:0] right_shifted , left_shifted , arithmetic_right_shifted;
	
	BarrelShifter right_BS(A,B[4:0],1'b0,right_shifted);
	BarrelShifter left_BS(A,B[4:0],1'b1,left_shifted);
	rightArithmeticBarrelShifter arithmetic_right_BS(A, B[4:0], arithmetic_right_shifted);

	assign unsigned_A = A;
	assign unsigned_B = B;
	assign unsigned_comp_A = ~A + 1;
	assign unsigned_comp_B = ~B + 1;
	
	wire [63:0] temp_unsigned_product;

	wire [63:0] temp_pos_pos_product;
	wire [63:0] temp_pos_neg_product;
	wire [63:0] temp_neg_pos_product;
	wire [63:0] temp_neg_neg_product;
	
	wire [31:0] temp_adder;
	wire temp_carry;

	wire [31:0] temp_memory_offset_adder;
	wire temp_memory_offset_carry;
	
	wire [31:0] temp_B = {16'd0,B[15:0]};
	
	adder_32bit add (.A(A), .B(B), .sum(temp_adder), .cout(temp_carry));
	
	adder_32bit memory_offset_add (.A(A), .B(temp_B), .sum(temp_memory_offset_adder), .cout(temp_memory_offset_carry));
	
	multiplier32_bit unsigned_mult(.A(unsigned_A),.B(unsigned_B),.product(temp_unsigned_product));
	
	multiplier32_bit pos_pos_mult (.A(unsigned_A),.B(unsigned_B),.product(temp_pos_pos_product));
	multiplier32_bit pos_neg_mult (.A(unsigned_A),.B(unsigned_comp_B),.product(temp_pos_neg_product));
	multiplier32_bit neg_pos_mult (.A(unsigned_comp_A),.B(unsigned_B),.product(temp_neg_pos_product));
	multiplier32_bit neg_neg_mult (.A(unsigned_comp_A),.B(unsigned_comp_B),.product(temp_neg_neg_product));

	 
	always @(*)
	begin
	
		carry = 1'b0; //Initializing all the register with initial 0 values
		zero = 1'b0; // at the time of operand start
		sign = 1'b0;
		overflow = 1'b0;
		out_extension = 32'd0; 
		
		case(selector)
			4'b0000: 
				begin
					out = ~B + 1; //comp
					sign = 0;
					overflow = 0;
				end
			4'b0001: 
				begin
					out = A & B; //and
					sign = 0;
					overflow = 0;
				end
			4'b0010: 
				begin
					out = A^B;//xor
					sign = 0;
					overflow = 0;
				end
			4'b0011: 
				begin
					out = left_shifted; //left shift
					sign = 0;
					overflow = 0;
				end
			4'b0100: 
				begin	
					out = right_shifted; //right shift
					sign = 0;
					overflow = 0;
				end
			4'b0101: 
				begin
//					carry = temp_carry;
//					out = A + B;
					{carry,out} = {temp_carry,temp_adder}; //add
					sign = out[31];
					overflow = carry;
				end
			4'b0110: 
				begin
					if(A[31]==0 && B[31]==0)
						{out_extension,out} = temp_pos_pos_product; //mult
					if(A[31]==0 && B[31]==1)
						{out_extension,out} = ~(temp_pos_neg_product)+1; //mult
					if(A[31]==1 && B[31]==1)
						{out_extension,out} = temp_neg_neg_product; //mult
					if(A[31]==1 && B[31]==0)
						{out_extension,out} = ~(temp_neg_pos_product)+1; //mult
					sign = A[31] ^ B[31];
					overflow = 0;
				end
			4'b0111: 
				begin
					{out_extension,out} = temp_unsigned_product; //multu
					sign = 0; //multu
					overflow=0;
				end
			4'b1000: 
				begin
					out = arithmetic_right_shifted;
					sign = 0;
					overflow = 0;
				end
			4'b1001: 
				begin
					out = A; // important for branching (ALU bypass)
					sign = 0;
					overflow = 0;
				end
			4'b1010: 
				begin
					out = B; // important for branching (ALU bypass)
					sign = 0;
					overflow = 0;
				end
			4'b1011: 
				begin
					{carry,out} = {temp_memory_offset_carry,temp_memory_offset_adder};
					sign = 0;
					overflow = 0;
				end
			default: 
				begin
					out = 32'd0; // Nothing
					sign = 0;
					overflow = 0;
				end
		endcase
		
		//setting zero_flag
		if({out_extension,out} == 64'd0)
			zero = 1;	
		else
			zero = 0;	
	end



endmodule
