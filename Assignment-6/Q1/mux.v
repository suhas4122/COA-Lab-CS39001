`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 1
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a 2:1 mux 

module mux(
    input in0, 
    input in1,
    input s, 
    output reg out
);
    // Output control block 
    always @(*) begin
        if(s)
            out <= in1;    // Output is same as input in port 1 if s = 1
        else
            out <= in0;    // Output is same as input in port 0 if s = 0
    end
    
endmodule 
