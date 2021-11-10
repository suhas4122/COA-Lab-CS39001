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
    reg reset;

    wire [31:0] out;
    
    programCounter UUT (.branch(branch), .offset(offset), .clk(clk), .reset(reset), .PC(out));
    
    initial begin
        reset = 1;
        clk = 0;
        #10 
        $display("branch:%d, offset:%d, clock:%d, reset:%d, out = %d", branch, offset, clk, reset, out);

        reset = 0;
        offset = 16'b0000100010001000;
        branch = 1;
        #10
        $display("branch:%d, offset:%d, clock:%d, reset:%d, out = %d", branch, offset, clk, reset, out);
        branch = 0;
        #10
        $display("branch:%d, offset:%d, clock:%d, reset:%d, out = %d", branch, offset, clk, reset, out);
        $finish;
    end
    
    always begin
        #5 clk = ~clk;
    end

endmodule 