`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module registerfile_tb;

	// Inputs
	reg reg_write;
	reg [4:0] reg_write_adder;
	reg [31:0] reg_write_data;
	reg [4:0] reg_1;
	reg [4:0] reg_2;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] reg_data_1;
	wire [31:0] reg_data_2;

	// Instantiate the Unit Under Test (UUT)
	registerfile uut(.reg_write(reg_write), 
		            .reg_write_data(reg_write_data), 
		            .reg_1(reg_1), 
		            .reg_2(reg_2), 
		            .reg_write_adder(reg_write_adder), 
		            .clk(clk), 
		            .reset(reset), 
		            .reg_data_1(reg_data_1), 
		            .reg_data_2(reg_data_2));

	initial begin
		// Initialize Inputs
		reg_write = 0;
		reg_write_adder = 0;
		reg_write_data = 0;
		reg_1 = 0;
		reg_2 = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		$monitor("clk = %b | reset = %b | reg_write = %b | reg_write_adder = %b | reg_write_data= %b | reg_1 = %b | reg_2 = %b | reg_data_1 = %b | reg_data_2 = %b",clk, reset, reg_write, reg_write_adder, reg_write_data, reg_1, reg_2, reg_data_1, reg_data_2);	
		
		
		// reset
		#10; reset = 1; 
		#10; reset = 0; 
		
		
		// set reg_write = 1
		#10; clk = 0; reg_write = 1;
		#10; clk = 1; reg_write = 1;
		
		// write
		#10; clk = 0; reg_write_data = 32'b1110000001110000000000000110000; reg_write_adder = 5;
		#10; clk = 1; reg_write_data = 32'b1110000001110000000000000110000; reg_write_adder = 5;

		// set reg_write = 1
		#10; clk = 0; reg_write = 1;
		#10; clk = 1; reg_write = 1;		

		#10; clk = 0; reg_write_data = 32'b00000000000011111000000000110011; reg_write_adder = 8;
		#10; clk = 1; reg_write_data = 32'b00000000000011111000000000110011; reg_write_adder = 8;
		
		// set reg_write = 1
		#10; clk = 0; reg_write = 1;
		#10; clk = 1; reg_write = 1;		

		#10; clk = 0; reg_write_data = 32'b11000000000011111000000000110011; reg_write_adder = 3;
		#10; clk = 1; reg_write_data = 32'b11000000000011111000000000110011; reg_write_adder = 3;
		
		// set reg_write = 0;
		#10; clk = 0; reg_write = 0;
		#10; clk = 1; reg_write = 0; 
		
		#10; clk = 0; reg_1 = 5; reg_2 = 3;
		#10; clk = 1; reg_1 = 5; reg_2 = 3;

		// set reg_write = 0;
		#10; clk = 0; reg_write = 0;
		#10; clk = 1; reg_write = 0; 
		
		#10; clk = 0; reg_1 = 5; reg_2 = 8;
		#10; clk = 1; reg_1 = 5; reg_2 = 8;

		// set reg_write = 0;
		#10; clk = 0; reg_write = 0;
		#10; clk = 1; reg_write = 0; 		
		
		#10; clk = 0; reg_1 = 8; reg_2 = 3;
		#10; clk = 1; reg_1 = 8; reg_2 = 3;

		// set reg_write = 0;
		#10; clk = 0; reg_write = 0;
		#10; clk = 1; reg_write = 0; 
		
		#10; clk = 0; reg_1 = 2; reg_2 = 1;
		#10; clk = 1; reg_1 = 2; reg_2 = 1;

		$finish;
	end
      
endmodule