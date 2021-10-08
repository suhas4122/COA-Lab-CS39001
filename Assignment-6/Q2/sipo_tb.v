`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 2
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for sipo module

module sipo_tb;
reg clk,rst;
reg  a;
wire  [7:0]q;

sipo uut(.clk(clk), .rst(rst),.a(a),  .sum(q));
initial
clk=1'b0;
always #10 clk=~clk;
initial begin
rst=1'b1; a=1'b1; display;
#10 rst=1'b0; display;
#10 a=1'b0; display;
#10 a=1'b1; display;
#10 a=1'b0; display;
#10 a=1'b0; display;
#10 a=1'b1; display;
#10 a=1'b0; display;
$finish;
end

task display;
        #1 
        $monitor("rst = %d a = %d q = %b", rst, a, q);
    endtask


 endmodule