`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module signExtend16to32(
    input [15:0] inp,
    output wire [31:0] out
);
    assign out = {{16{inp[15]}}, inp};

endmodule 