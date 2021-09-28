`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 1
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for dff module 

module dff_tb;

    // Initialise input and output 
    reg clk, reset, d;
    wire q;
    
    // Instantiate the Unit Under Test (UUT)
    dff DFF(.clk(clk), .reset(reset), .d(d), .q(q));

    // Begin testing      
    initial begin
        // Check reset functionality 
        $display("Reset flop");
        clk = 0;
        reset = 1;
        d = 1'bx;
        display;
        
        // Check release reset functionality 
        $display("Release reset");
        d = 1;
        reset = 0;
        display;

        // Check toggle clock functionality 
        $display("Toggle clk");
        clk = 1;
        display;
    end
    
    // Task to display the input and output for different tests
    task display;
        #1 
        $display("d:%0h, q:%0h", d, q);
    endtask

endmodule