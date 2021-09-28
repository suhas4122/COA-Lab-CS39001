`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 1
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement lfsr 

module lfsr(
    input clk,
    input sel,
    input [3:0]seed,
    input reset,
    output wire [3:0]w
);
    // Intitialise wires for temporary use 
    wire w1;
    wire [3:0]wint;

    // Connect all 4 mux to appropriate registers and wires 
    mux mux0(.in0(seed[0]), .in1(w[2]), .s(sel), .out(wint[3]));
    mux mux1(.in0(seed[1]), .in1(w[1]), .s(sel), .out(wint[2]));
    mux mux2(.in0(seed[2]), .in1(w[0]), .s(sel), .out(wint[1]));
    mux mux3(.in0(seed[3]), .in1(w1), .s(sel), .out(wint[0]));

    // Connect all 4 dff to appropriate registers and wires 
    dff dff0(.clk(clk), .reset(reset), .d(wint[3]), .q(w[3]));
    dff dff1(.clk(clk), .reset(reset), .d(wint[2]), .q(w[2]));
    dff dff2(.clk(clk), .reset(reset), .d(wint[1]), .q(w[1]));
    dff dff3(.clk(clk), .reset(reset), .d(wint[0]), .q(w[0]));

    // Assign next bit value 
    assign w1 = w[3] ^ w[2];
endmodule