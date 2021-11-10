`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module instructionFetch(
    input [31:0] PC,
    input clk,
    input reset, 
    output wire [31:0] instuction
);

	instructionMemory_v7_3 im(.clka(~clk), .rsta(reset), .wea(1'b0), .addra(PC[9:0]), .dina(32'd0), .douta(instruction));

endmodule 

