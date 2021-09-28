`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 4
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for sequential comparator module  

module shift_register_tb;

    // Declare inputs, outputs and temporary variables 
    reg clk, reset, OP;
    reg inp_bit1, inp_bit2;
    wire L, E, G;
    integer i;

    // Instantiate the Unit Under Test (UUT)
    // seq_comparator_fsm fsm(.clk(clk), .inp_bit1(inp_bit1), .inp_bit2(inp_bit2) .reset(reset), .OP(OP), .L(L), .E(E), .G(G));
    seq_comparator_fsm fsm(.clk(clk), .inp_bit1(inp_bit1), .inp_bit2(inp_bit2), .reset(reset), .OP(OP), .L(L), .E(E), .G(G));

    initial begin

        // TEST CASE - 1 (first input = second input)
        // In first input we send 011 bit by bit from MSB to LSB
        // In second input we send 011 bit by bit from MSB to LSB
        // Initialize Inputs
        clk = 0;
        reset = 1;
        OP = 0;
        // Wait 10 ns for global reset to finish
        #10
        reset = 0;                              // Make reset 0 
        inp_bit1 = 1'b0;                        // Sending first bit of both inputs 
        inp_bit2 = 1'b0;
        #10
        inp_bit1 = 1'b1;                        // Sending second bits of both inputs 
        inp_bit2 = 1'b1;
        #10
        inp_bit1 = 1'b1;                        // Sending third bit of both inputs 
        inp_bit2 = 1'b1;
        #10
        OP = 1;
        #10
        $display("\nL:%d, E:%d, G:%d", L, E, G);

        // TEST CASE - 2 (first input < second input)
        // In first input we send 010 bit by bit from MSB to LSB
        // In second input we send 011 bit by bit from MSB to LSB
        // Initialize Inputs
        clk = 0;
        reset = 1;
        OP = 0;
        // Wait 10 ns for global reset to finish
        #10
        reset = 0;                              // Make reset 0 
        inp_bit1 = 1'b0;                        // Sending first bit of both inputs 
        inp_bit2 = 1'b0;
        #10
        inp_bit1 = 1'b1;                        // Sending second bits of both inputs 
        inp_bit2 = 1'b1;
        #10
        inp_bit1 = 1'b0;                        // Sending third bit of both inputs 
        inp_bit2 = 1'b1;
        #10
        OP = 1;
        #10
        $display("L:%d, E:%d, G:%d", L, E, G);

        // TEST CASE - 3 (first input > second input)
        // In first input we send 011 bit by bit from MSB to LSB
        // In second input we send 010 bit by bit from MSB to LSB
        // Initialize Inputs
        clk = 0;
        reset = 1;
        OP = 0;
        // Wait 10 ns for global reset to finish
        #10
        reset = 0;                              // Make reset 0 
        inp_bit1 = 1'b0;                        // Sending first bit of both inputs 
        inp_bit2 = 1'b0;
        #10
        inp_bit1 = 1'b1;                        // Sending second bits of both inputs 
        inp_bit2 = 1'b1;
        #10
        inp_bit1 = 1'b1;                        // Sending third bit of both inputs 
        inp_bit2 = 1'b0;
        #10
        OP = 1;
        #10
        $display("L:%d, E:%d, G:%d\n", L, E, G);
        
        $finish;
    end

    // Always block to toggle the clock every 5 time units 
    always
        #5 clk = ~clk;

endmodule