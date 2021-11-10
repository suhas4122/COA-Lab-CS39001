`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module arithmeticLogicalUnit_testbench;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] alu_control;

	// Outputs
	wire [31:0] alu_result;
    reg ab_set;
	wire carry;
	wire zero;
	wire sign;

	// Instantiate the Unit Under Test (UUT)
	arithmeticLogicalUnit uut(
		.A(A), 
		.B(B), 
		.alu_control(alu_control), 
        .ab_set(ab_set),
		.alu_result(alu_result), 
		.carry_flag(carry), 
		.zero_flag(zero), 
		.sign_flag(sign)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
        ab_set = 0;
		alu_control = 0;

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here
		$monitor("alu_control=%b,ab_set = %b, A=%b, B=%b, out=%b, carry=%b,zero=%b,sign=%b, time=%d",alu_control,ab_set,A,B,alu_result,carry,zero,sign, $time);

		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 0;
		#100; 
        // $display("alu_control=%b,A=%b,B=%b,out=%b,carry=%b,zero=%b,sign=%b",alu_control,A,B,alu_result,carry,zero,sign);
		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; ab_set = 1; alu_control = 1; 
		#100; 
        // $display("alu_control=%b,A=%b,B=%b,out=%b,carry=%b,zero=%b,sign=%b",alu_control,A,B,alu_result,carry,zero,sign);
		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; ab_set = 0; alu_control = 2; 
		#100; 
		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 3; 
		#100; 
		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 4; 
		#100; 
		A = 32'b10000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 5; 
		#100; 
		A = 32'b10000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 6; 
		#100; 
		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 7; 
		#100; 
		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 8; 
		#100; 
		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 9; 
		#100;
		A = 32'b00000000000000000000000000000010; B = 32'b00000000000000000000000000000011; alu_control = 10; 
		#100;

		$finish;
	end
      
endmodule

