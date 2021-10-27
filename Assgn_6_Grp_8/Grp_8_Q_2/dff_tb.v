`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a testbench for dff module 

module dff_tb;

    // Initialise input and output 
    reg clk, reset, d, cin;
    wire q;
    
    // Instantiate the Unit Under Test (UUT)
    dff UUT(.clk(clk), .reset(reset), .d(d), .cin(cin), .q(q));

    // Begin testing      
    initial begin
        // Check reset functionality 
        $display("Reset flop");
        clk = 0;
        reset = 1;
        cin = 1'b0;
        d = 1'b0;
        #10
        display;
        
        // Check release reset functionality 
        $display("Release reset");
        cin = 1'b0;
        d = 1'b1;
        reset = 0;
        display;

        // Check toggle clock functionality 
        $display("Toggle clock");
        #10
        display;

        $finish;
    end
    
    // Task to display the input and output for different tests
    task display;
        $display("d:%0h, q:%0h", d, q);
    endtask

    always 
        #5 clk = ~clk;

endmodule
