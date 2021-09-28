`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 3
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a multiple of 3 checker 

module mult_three_fsm(
    input clk,
    input inp,
    input reset,
    output reg out
);  
    // Declare states of the fsm (same as numbeer % 3)
    parameter S0 = 0, S1 = 1, S2 = 2;
    // Declare present state and next state 
    reg [1:0]PS, NS;

    // Sequential control block
    // Asynchronous reset
    always @(posedge clk or posedge reset) begin
        if(reset)
            PS <= S0;       // If reset is 1, FSM goes to initial state 
        else
            PS <= NS;       // If reset is 0, it goes to next state
    end 

    // Next state and output control
    // Output is divisible by 3 only if we reach state S0
    // In S1 or S2 the modulo is non zero
    always @(*) begin
        case (PS)
            S0 : begin
                out = 1;                // Divisible 
                NS = inp ? S1 : S0;     // if inp is 1 => 2*(3n) + 1 = 3m + 1 ie. S1
            end                         // if inp is 0 => 2*(3n) = 3m ie. S0
            S1 : begin 
                out = 0;                // Non-divisible 
                NS = inp ? S0 : S2;     // if inp is 1 => 2*(3n+1) + 1 = 3m ie. S0
            end                         // if inp is 0 => 2*(3n+1) = 3m + 2 ie. S2
            S2 : begin
                out = 0;                // Non-divisible 
                NS = inp ? S2 : S1;     // if inp is 1 => 2*(3n+2) + 1 = 3m + 2 ie. S2
            end                         // if inp is 0 => 2*(3n+2)  = 3m + 1 ie. S1
        endcase 
    end
endmodule