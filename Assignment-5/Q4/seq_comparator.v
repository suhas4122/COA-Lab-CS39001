`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 3
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a multiple of 3 checker 

module seq_comparator(
    input clk,
	input [31:0] inp1,
	input [31:0] inp2, 
    input reset,
    input OP, 
	output wire L,
	output wire E,
	output wire G
);
    // Two wires for connecting shift registers to the FSM 
    wire inp_bit1, inp_bit2;
    // Instantiating first shift register to read bits from inp1
    shift_register sh1(.clk(clk), .inp(inp1), .reset(reset), .out(inp_bit1));
    // Instantiating second shift register to read bits from inp2
    shift_register sh2(.clk(clk), .inp(inp2), .reset(reset), .out(inp_bit2));
    // Instantiating the FSM for bit by bit comparision 
    seq_comparator_fsm sc(.clk(clk), .inp_bit1(inp_bit1), .inp_bit2(inp_bit2), .reset(reset), .OP(OP), .L(L), .E(E), .G(G));
    
endmodule 