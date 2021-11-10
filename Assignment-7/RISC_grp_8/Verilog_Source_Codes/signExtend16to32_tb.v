`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module signExtend16to32_tb;
    reg [15:0] inp;
    wire [31:0] out;
    
    signExtend16to32 UUT (.inp(inp), .out(out));
    initial begin
        inp = 16'b1000100010001000;
        $display("inp:%b, out:%b", inp,out);
    end
    

endmodule 