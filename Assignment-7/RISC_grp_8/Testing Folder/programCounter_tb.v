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
    reg [20:0] offset;
    reg clk;
    reg reset;

    // Output
    wire [31:0] out;
    
    // Instantiate the Unit Under Test (UUT)
    programCounter uut(.branch(branch),.offset(offset), .clk(clk),.reset(reset), .PC(out));
    
    initial begin
        reset = 1;
        clk = 0;

        #10;
        reset = 0;
        branch = 1;
        offset = 21'd21;

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
