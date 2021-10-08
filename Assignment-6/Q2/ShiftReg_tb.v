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

module ShiftReg_tb;
    //Inputs
    reg clk;
    reg rst;
	reg load;
	reg [7:0] in;

    // Outputs
	wire [7:0] out;

    ShiftReg uut( .clk(clk), .rst(rst) , .load(load), .in(in), .out(out));

    initial begin
        clk  = 0;
        rst  = 0;
        load = 0;
        in = 'b11110110;
        #10 load= 1; in = 'b1111111;
    end
    initial begin
        
        $display("load = %d in = %b out = %b", load, in, out);
        #10
        
    end
 endmodule
