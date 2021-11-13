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
    /*
        a:      32 bit Input at port 0 of the mux 
        b:      32 bit Input at port 1 of the mux 
        select: Select signal of the mux 
        out:    32 bit Output of the mux
    */
	// out= b if select equals 1
    // out= a if select equals 0
	assign out = select ? b : a;

endmodule

module MUX_5b_2_to_1(
    input [4:0] a, 
    input [4:0] b, 
    input select, 
    output wire [4:0] out
);
	/*
        a:      5 bit Input at port 0 of the mux 
        b:      5 bit Input at port 1 of the mux 
        select: Select signal of the mux 
        out:    5 bit Output of the mux
    */
	// out= b if select equals 1
    // out= a if select equals 0
	assign out = select ? b : a;

endmodule