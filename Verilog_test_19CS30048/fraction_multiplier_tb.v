// SUHAS JAIN
// 19CS30048
// COA LAB TEST-2 (VERILOG)

`timescale 1ns / 1ps

module fraction_multiplier_tb;

    reg clk, start;
    reg [6:0] a, b;

    wire done;
    wire [12:0] prod;

    fraction_multiplier bfsm(.clk(clk), .start(start), .a(a), .b(b), .done(done), .prod(prod));

    always begin
        #5 
        clk = ~clk;
    end

    initial begin
        $monitor("time = %0d, prod = %b", $time, prod);

        clk = 0;
        
        // TEST
        start = 1; 
        a = 7'b0111011; 
        b = 7'b0111001;
        #3 start = 0;
        #200 $display("FINAL PRODUCT: %b\n", prod);

        $finish;
    end

endmodule