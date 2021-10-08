`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a D-Flip Flop

module dff (
    input clk,
    input reset,
    input d,
    input cin,
    output reg q
);  
    /*
        clk:    Clock
        reset:  Reset bit of the dff 
        d:      Data input of the flip flop
        cin:    Input to be set when reset = 1
        q:      Output bit of the flip flop
    */

    // Sequential Control (FLIP FLOP CONTROL)
    // Asynchronous reset
    always @(posedge clk) begin
        if (reset) begin
            // Asynchronous reset when reset goes high
            q <= cin;
        end 
        else begin
            // Assign D to Q on positive clock edge
            q <= d;
        end
    end
    
endmodule
