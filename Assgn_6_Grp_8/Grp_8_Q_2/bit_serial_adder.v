`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a 8-bit serial adder

module bit_serial_adder(
    input clk,
    input reset,
    input load,
    input [7:0] a,
    input [7:0] b,
    input cin,
    output wire [7:0] sum,
    output wire cout
);

    /*
		clk: 	Clock 
		reset:	Reset bit of the module (indicates to reset the adder)
		load: 	Load bit of the module (indicates when to load data) 
		a:		First 8-bit input bit to the adder 
		b:		Second 8-bit input bit to the adder
        cin:    Carry input to the adder  
		out: 	8-bit sum output of the adder
        cout:   Carry output of the adder  
	*/

    // Declaring wires to connect various modules
	wire [7:0] x, z;
	wire s, c;
	
    // Reading input bit by bit form both the given inputs 
	shift_register SR1(clk, reset, load, a, x);
	shift_register SR2(clk, reset, load, b, z);
	
    // D-Flip Flop to remember the carry 
	dff DFF(clk, reset, cout, cin, c);
	
	// Calling adder module to add sequential bits 
	full_adder FA(x[0], z[0], c, s, cout);
	
	// Store sum using serial input and parallel output 
	serial_in_parallel_out SIPO(clk, load, s, sum);
	
endmodule
