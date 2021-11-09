`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] control;
    reg ab_set;

	// Outputs
	wire [31:0] result;
	wire carry_flag;
    wire zero_flag;
	wire sign_flag;

	// Instantiate the Unit Under Test (UUT)
	arithmeticLogicalUnit uut (
		.A(a), 
		.B(b), 
		.alu_control(control), 
        .ab_set(ab_set),
		.alu_result(result), 
        .carry_flag(carry_flag), 
		.zero_flag(zero_flag), 
		.sign_flag(sign_flag)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		control = 0;
        ab_set = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
        $monitor("control=%b,A=%b,B=%b,ab_set = %b, alu_result=%b,out_extension=%b,carry=%b,zero=%b,sign=%b,overflow=%b",control,a,b,ab_set,result,carry_flag,zero_flag,sign_flag);
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 0;
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 1; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 2; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 3; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 4; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 5; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 6; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 7; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 8; 
		#10; 
		A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; control = 9; 
		#10;

		$finish;
		
	end
      
endmodule