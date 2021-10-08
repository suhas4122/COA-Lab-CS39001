`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a testbench for serial in parallel out module

module serial_in_parallel_out_tb;

    // Initialising inputs and outputs 
    reg clk, reset;
    reg a;
    wire [7:0] out;

    // Instantiate the Unit Under Test (UUT)
    serial_in_parallel_out UUT(.clk(clk), .reset(reset), .a(a), .out(out));

    // Testing the module with a stream of serial input
    initial begin
        clk = 0; reset=1'b1; a=1'b1; display;
        #20 reset=1'b0; display;
        #10 a=1'b0; display;
        #10 a=1'b1; display;
        #10 a=1'b0; display;
        #10 a=1'b0; display;
        #10 a=1'b1; display;
        #10 a=1'b0; display;
        #10 display;
        $finish;
    end

    // Toggle clock every 5 time periods
    always 
        #5 clk = ~clk;

    // Task to display the results when called
    task display;
        $display("reset:%d, a:%d, out:%b", reset, a, out);
    endtask


 endmodule