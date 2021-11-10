`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module programCounter_tb;
    // Inputs
    reg branch;
    reg [15:0] offset;
    reg clk;
    reg rst;

    // Output
    wire [31:0] out;
    
    // Instantiate the Unit Under Test (UUT)
    programCounter UUT (.branch(branch),.offset(offset), .clk(clk),.reset(rst), .PC(out));
    
    initial begin
         offset = 16'b1000100010001000;
         clk = 0;
         rst = 0;

        #10
        branch = 1;
        #1
        $display("branch:%d, offset:%b,clock:%d, reset:%d, out = %b", branch, offset, clk,rst, out);

        #10
        branch = 0;
        #1
        $display("branch:%d, offset:%b,clock:%d, reset:%d, out = %b", branch, offset, clk,rst, out);

    end
    

endmodule 
