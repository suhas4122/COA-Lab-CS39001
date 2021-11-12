`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module MUX_32b_2_to_1(
    input [31:0] a, 
    input [31:0] b, 
    input select, 
    output wire [31:0] out
);
	
	assign out = select ? b : a;

endmodule

module MUX_5b_2_to_1(
    input [4:0] a, 
    input [4:0] b, 
    input select, 
    output wire [4:0] out
);
	
	assign out = select ? b : a;

endmodule