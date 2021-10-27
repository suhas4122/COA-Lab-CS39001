`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 1
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////

// Module to implement a testbench for 2:1 mux  

module mux_tb;

    // Declare inputs and outputs 
    reg in0, in1, s;
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux UUT(.in0(in0), .in1(in1), .s(s), .out(out));
    
    // Variable for the for loop 
    integer i;

    initial begin
        // Check all possible combinations of s, in0, in1
        for(i = 0; i < 8; i++) begin
            #1
            // Assign s, in0, in1, 3 bits of numbers from 0 to 7
            {s, in0, in1} = i;
            #1
            // Display the results 
            $display("s:%0h, in0:%0h, in1:%0h, out:%0h", s, in0, in1, out);
        end
    end 

endmodule
   