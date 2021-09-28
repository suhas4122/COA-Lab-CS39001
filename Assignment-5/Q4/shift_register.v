`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 4
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a left shift register 

module shift_register(
	input clk,
	input [31:0]inp, 
    input reset,
    output reg out 
);  
    // Temporary array to store the input array 
    reg [31:0] temp;
    
    // Sequential control block
    // Asynchronous reset 
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            temp <= inp;            // If reset bit is 1, copy the input array into temporaty array
        end
        else begin
            temp <= temp << 1;      // If reset bit is 0, left shift by one bit on each positive edge 
        end
        out <= temp[31];            // Copy the MSB into the output 
    end

endmodule 