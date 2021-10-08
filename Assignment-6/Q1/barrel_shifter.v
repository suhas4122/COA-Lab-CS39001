`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 1
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a 8 bit bidirectional barrel shifter  
//dir = 0 -> RIGHT SHIFT
//dir = 1 -> LEFT SHIFT
 
module barrel_shifter(
    input [7:0] in,
    input [2:0] shamt,
    input dir,
    output [7:0] out
);

    wire [7:0] x, y, w, z;

    // Reversing the 8 bit number in case of left shift
    mux ins_00 (.in0(in[7]), .in1(in[0]), .s(dir),.out(w[7]));
    mux ins_01 (.in0(in[6]), .in1(in[1]), .s(dir),.out(w[6]));
    mux ins_02 (.in0(in[5]), .in1(in[2]), .s(dir),.out(w[5]));
    mux ins_03 (.in0(in[4]), .in1(in[3]), .s(dir),.out(w[4]));
    mux ins_04 (.in0(in[3]), .in1(in[4]), .s(dir),.out(w[3]));
    mux ins_05 (.in0(in[2]), .in1(in[5]), .s(dir),.out(w[2]));
    mux ins_06 (.in0(in[1]), .in1(in[6]), .s(dir),.out(w[1]));
    mux ins_07 (.in0(in[0]), .in1(in[7]), .s(dir),.out(w[0]));
    
    // 4-bit shift right
    mux  ins_08 (.in0(w[7]),.in1(1'b0),.s(shamt[2]),.out(x[7]));
    mux  ins_09 (.in0(w[6]),.in1(1'b0),.s(shamt[2]),.out(x[6]));
    mux  ins_10 (.in0(w[5]),.in1(1'b0),.s(shamt[2]),.out(x[5]));
    mux  ins_11 (.in0(w[4]),.in1(1'b0),.s(shamt[2]),.out(x[4]));
    mux  ins_12 (.in0(w[3]),.in1(w[7]),.s(shamt[2]),.out(x[3]));
    mux  ins_13 (.in0(w[2]),.in1(w[6]),.s(shamt[2]),.out(x[2]));
    mux  ins_14 (.in0(w[1]),.in1(w[5]),.s(shamt[2]),.out(x[1]));
    mux  ins_15 (.in0(w[0]),.in1(w[4]),.s(shamt[2]),.out(x[0]));
    
    // 2-bit shift right
    mux  ins_16 (.in0(x[7]),.in1(1'b0),.s(shamt[1]),.out(y[7]));
    mux  ins_17 (.in0(x[6]),.in1(1'b0),.s(shamt[1]),.out(y[6]));
    mux  ins_18 (.in0(x[5]),.in1(x[7]),.s(shamt[1]),.out(y[5]));
    mux  ins_19 (.in0(x[4]),.in1(x[6]),.s(shamt[1]),.out(y[4]));
    mux  ins_20 (.in0(x[3]),.in1(x[5]),.s(shamt[1]),.out(y[3]));
    mux  ins_21 (.in0(x[2]),.in1(x[4]),.s(shamt[1]),.out(y[2]));
    mux  ins_22 (.in0(x[1]),.in1(x[3]),.s(shamt[1]),.out(y[1]));
    mux  ins_23 (.in0(x[0]),.in1(x[2]),.s(shamt[1]),.out(y[0]));
    
    // 1-bit shift right
    mux  ins_24 (.in0(y[7]),.in1(1'b0),.s(shamt[0]),.out(z[7]));
    mux  ins_25 (.in0(y[6]),.in1(y[7]),.s(shamt[0]),.out(z[6]));
    mux  ins_26 (.in0(y[5]),.in1(y[6]),.s(shamt[0]),.out(z[5]));
    mux  ins_27 (.in0(y[4]),.in1(y[5]),.s(shamt[0]),.out(z[4]));
    mux  ins_28 (.in0(y[3]),.in1(y[4]),.s(shamt[0]),.out(z[3]));
    mux  ins_29 (.in0(y[2]),.in1(y[3]),.s(shamt[0]),.out(z[2]));
    mux  ins_30 (.in0(y[1]),.in1(y[2]),.s(shamt[0]),.out(z[1]));
    mux  ins_31 (.in0(y[0]),.in1(y[1]),.s(shamt[0]),.out(z[0]));
    

    // Reversing the 8 bit number back in case of left shift
    mux ins_32 (.in0(z[7]), .in1(z[0]), .s(dir),.out(out[7]));
    mux ins_33 (.in0(z[6]), .in1(z[1]), .s(dir),.out(out[6]));
    mux ins_34 (.in0(z[5]), .in1(z[2]), .s(dir),.out(out[5]));
    mux ins_35 (.in0(z[4]), .in1(z[3]), .s(dir),.out(out[4]));
    mux ins_36 (.in0(z[3]), .in1(z[4]), .s(dir),.out(out[3]));
    mux ins_37 (.in0(z[2]), .in1(z[5]), .s(dir),.out(out[2]));
    mux ins_38 (.in0(z[1]), .in1(z[6]), .s(dir),.out(out[1]));
    mux ins_39 (.in0(z[0]), .in1(z[7]), .s(dir),.out(out[0]));

endmodule
 
