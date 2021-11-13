`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for topmodule
module KGPRISC_tb;

    // Inputs
    reg clk;
    reg reset;

    topModule tm(.clk(clk), .reset(reset));

    initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#2;	
        reset = 0;	   
       
	end
    
    always @(*) begin 
        if(tm.dp.rf.bank[16] == 1) begin
            $display("\n\nSorting of 10 numbers complete\n\n");
            $finish;
        end
    end
    
	always begin
		#5 clk = ~clk;
	end

endmodule 