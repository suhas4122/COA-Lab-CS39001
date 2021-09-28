`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 1
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for lfsr module 

module lfsr_tb;

    // Initialise inputs and outputs 
    reg clk = 0;
    reg sel = 0;
    reg [3:0]seed = 4'b1111;
    reg reset = 0;
    wire [3:0]w;

    // Instantiate the Unit Under Test (UUT)
    lfsr LFSR(.clk(clk), .sel(sel), .seed(seed), .reset(reset), .w(w));

    initial begin
        #6
        // To monitor the change in output
        $monitor("w[0]:%b, w[1]:%b, w[2]:%b, w[3]:%b", w[0], w[1], w[2], w[3]);
        #1
        sel = 1;
        // Run for total 150 units ie. 15 clock cycles to display full cycle
        #150
        $finish;
    end
    
    // Clock toggle every 5 units of time 
    always 
        #5 clk = ~clk;
    

endmodule