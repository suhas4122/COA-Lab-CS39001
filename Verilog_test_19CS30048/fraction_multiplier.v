`timescale 1ns / 1ps

// SUHAS JAIN
// 19CS30048
// COA LAB TEST-2 (VERILOG)

module fraction_multiplier(clk, start, a, b, done, prod);

    input clk, start; 
    input [6:0] a, b; 
    output wire done; 
    output wire [12:0] prod;

    control_unit cu(clk, start, done);
    datapath_unit du(clk, start, a, b, done, prod);

endmodule