`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module dff (
    input clk,
    input reset,
    input d,
    output reg q
);
    /*
        clk: clock
        reset: 1 bit reset signal
        d: Input bit 
        q: single bit output register
    */
    // Sequential Control (FLIP FLOP CONTROL)
    // Asynchronous reset
    always @(posedge clk or posedge reset) begin
        if (reset) begin
        // Asynchronous reset when reset goes high
        q <= 1'b0;
        end 
        else begin
        // Assign D to Q on positive clock edge
        q <= d;
        end
    end
endmodule