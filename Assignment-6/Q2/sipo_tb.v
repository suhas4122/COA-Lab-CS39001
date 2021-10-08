`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for SIPO module 
module sipo_tb;
    
    //inputs
    reg clk;
    reg load;
    reg [7:0] in;
    //output
    wire [7:0] out;

    sipo uut (.clk(clk), .load(load),   .in(in), .out(out) );

    initial begin
        clk = 0;
        load = 0;
        in = 'b11110110;
        #10 in = 'b10001011;

    end
    initial begin
        $display("load = %d in = %b out = %b", load, in, out);
    end
endmodule