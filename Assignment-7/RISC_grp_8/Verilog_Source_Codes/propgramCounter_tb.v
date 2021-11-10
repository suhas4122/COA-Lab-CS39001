`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module programCounter_tb;
    reg branch;
    reg [15:0] offset;
    reg clk;
    reg rst;

    wire [31:0] out;
    
    programCounter UUT (.branch(branch),.offset(offset), .clk(clk),.reset(rst), .PC(out));
    initial begin
         offset = 16'b1000100010001000;
         branch = 1;
         clk = 0;
         rst = 0;
        #10
        $display("branch:%d, offset:%d,clock:%d, reset:%d, out = %d", branch, offset, clk,rst, out);

        #10
        branch = 0;
        $display("branch:%d, offset:%d,clock:%d, reset:%d, out = %d", branch, offset, clk,rst, out);

    end
    

endmodule 
