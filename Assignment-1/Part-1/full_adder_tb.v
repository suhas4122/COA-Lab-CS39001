`timescale 1ns/1ps

module full_adder_tb;
 
    reg A = 0;
    reg B = 0;
    reg Ci = 0;
    wire S;
    wire Co;
    
    full_adder full_adder_inst(A, B, Ci, S, Co);
    
    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);
        #10;
        A = 1'b0;
        B = 1'b0;
        Ci = 1'b1;
        #10;
        A = 1'b0;
        B = 1'b1;
        Ci = 1'b0;
        #10;
        A = 1'b0;
        B = 1'b1;
        Ci = 1'b1;
        #10;
        A = 1'b1;
        B = 1'b0;
        Ci = 1'b0;
        #10;
        A = 1'b1;
        B = 1'b0;
        Ci = 1'b1;
        #10;
        A = 1'b1;
        B = 1'b1;
        Ci = 1'b0;
        #10;
        A = 1'b1;
        B = 1'b1;
        Ci = 1'b1;
    end 
 
endmodule