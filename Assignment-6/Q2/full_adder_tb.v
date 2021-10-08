`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a test bench for full adder


module full_adder_tb;

    // Initialising inputs and outputs 
    reg A = 1'b0, B = 1'b0;
    reg Ci = 1'b0;
    wire S;
    wire Co;
    
    // Instantiate the Unit Under Test (UUT)
    full_adder UUT(A, B, Ci, S, Co);  
    // Initialise the loop variable 
    integer i;

    initial begin  
        // Assigning different values to input bits and testing the outputs
        for(i = 0; i < 8; i++) begin
            #1
            // Assign s, in0, in1, 3 bits of numbers from 0 to 7
            {A, B, Ci} = i;
            #1
            // Display the results 
            $display("A:%0h, B:%0h, Cin:%0h, Sum:%0h, Cout:%d", A, B, Ci, S, Co);
        end
    end 
 
endmodule
