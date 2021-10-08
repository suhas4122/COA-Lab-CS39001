`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a testbench for shift register module 

module shift_register_tb;
    // Initialising inputs and outputs 
    reg clk;
    reg reset;
	reg load;
	reg [7:0] in;
	wire [7:0] out;

    // Instantiate the Unit Under Test (UUT)
    shift_register UUT( .clk(clk), .reset(reset) , .load(load), .in(in), .out(out));

    initial begin
        // Display the values on any change 
        $monitor("reset:%d, load:%d, in:%b out:%b", reset, load, in, out);

        // Reset everything before loading value 
        clk  = 0;
        reset  = 1;
        load = 0;
        in = 8'b0;
        #10

        // Load the input into the shift register
        reset = 0;
        load = 1;
        in = 8'b11110110;
        #10

        // Wait for 9 clock cycles for shifting to finish (1 for setting load = 0 and 8 for shifting)
        load = 0;
        #90
        $finish;
    end

    // Toggle clock every 5 time periods 
    always 
		#5 clk = ~clk;

 endmodule
