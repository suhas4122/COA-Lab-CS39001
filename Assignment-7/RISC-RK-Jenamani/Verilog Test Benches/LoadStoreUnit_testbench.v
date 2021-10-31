`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:58:28 11/12/2019
// Design Name:   LoadStoreUnit
// Module Name:   C:/Users/Rajat Kumar Jenamani/Desktop/KGP_RISC (2)/KGP_RISC/LoadStoreUnit_testbench.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LoadStoreUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LoadStoreUnit_testbench;

	// Inputs
	reg clk;
	reg reset;
	reg write_to_memory;
	reg read_from_memory;
	reg [31:0] address;
	reg [31:0] input_data;
	
	
	// for loop 
	integer i;

	// Outputs
	wire [31:0] output_data;

	// Instantiate the Unit Under Test (UUT)
	LoadStoreUnit uut (
		.clk(clk), 
		.reset(reset), 
		.write_to_memory(write_to_memory), 
		.read_from_memory(read_from_memory), 
		.address(address), 
		.input_data(input_data), 
		.output_data(output_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		write_to_memory = 0;
		read_from_memory = 0;
		address = 0;
		input_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		

		$monitor("clk = %b, reset = %b, write_to_memory = %b, read_from_memory = %b, address= %d, input_data = %d, output_data = %d",clk, reset, write_to_memory, read_from_memory, address, input_data, output_data);
		
		
		// to init BRAM 
		clk = 0;  #10;
		clk = 1;  #10;
		clk = 0;  #10;
		clk = 1;  #10;
		clk = 0;  #10;
		clk = 1;  #10;
		clk = 0;  #10;
		clk = 1;  #10;
		clk = 0;  #10;
		clk = 1;  #10;
		clk = 0;  #10;
		clk = 1;  #10;
		clk = 0;  #10;
		clk = 1;  #10;
		clk = 0;  #10;
		clk = 1;  #10;
		clk = 0;  #10;
		clk = 1;  #10;	
		
		write_to_memory = 1; read_from_memory = 0; #10;
		
		for(i = 0; i <= 5; i = i+1)
			begin
				$display("---------");
				#10; clk = 0; input_data = 10*i; address = i;
				#10; clk = 1; input_data = 10*i; address = i; 
				#10; clk = 0; input_data = 10*i; address = i; 
				#10; clk = 1; input_data = 10*i; address = i; 
				#10; clk = 0; input_data = 10*i; address = i; 
				#10; clk = 1; input_data = 10*i; address = i; 
				#10; clk = 0; input_data = 10*i; address = i; 
				#10; clk = 1; input_data = 10*i; address = i; 
				#10; clk = 0; input_data = 10*i; address = i; 
				#10; clk = 1; input_data = 10*i; address = i; 
				#10; clk = 0; input_data = 10*i; address = i; 
				#10; clk = 1; input_data = 10*i; address = i; 
				$display("---------");
			end
		
		write_to_memory = 0; read_from_memory = 1; #10;

		for(i = 0; i <= 5; i = i+1)
			begin
				$display("---------");
				#10; clk = 0; address = i; 
				#10; clk = 1; address = i;
				#10; clk = 0; address = i;
				#10; clk = 1; address = i;
				#10; clk = 0; address = i;
				#10; clk = 1; address = i;
				#10; clk = 0; address = i;
				#10; clk = 1; address = i;
				#10; clk = 0; address = i;
				#10; clk = 1; address = i;
				#10; clk = 0; address = i;
				#10; clk = 1; address = i;
				$display("---------");
			end		

		$finish;  

	end
      
endmodule

