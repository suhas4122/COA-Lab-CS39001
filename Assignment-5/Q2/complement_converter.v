`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a complement convetor 

module complement_converter (
    input clk,
    input inp,
    input reset,
    output reg out  
);
    // Declare the states of the FSM 
    parameter S0 = 0, S1 = 1;
    // Declare present state and next state 
    reg PS, NS;

    // Sequential control block
    // Asynchronous reset 
    always @(posedge clk or posedge reset) begin
        if(reset)
            PS <= S0;       // If reset is 1, FSM goes to initial state 
        else
            PS <= NS;       // If reset is 0, it goes to next state 
    end 

    // Next state control and output control
    // Till the appearance of first 1, FSM remains in S0, then goes to S1
    always @(*) begin
        case (PS)
            S0: begin
                out = inp;              // Output is same as input in S0
                NS = inp ? S1 : S0;     // Go to S1 if input is 1, else stay in S0
            end 

            S1: begin
                out = ~inp;             // Output bits are inverted in S1
                NS = S1;                // Always stay in S1 unless reset 
            end
        endcase
    end
endmodule

