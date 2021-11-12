`timescale 1ns / 1ps

// SUHAS JAIN
// 19CS30048
// COA LAB TEST-2 (VERILOG)

module control_unit(clk, start, done);

    input clk, start;
    output reg done;

    reg [5:0] iter;
    reg carry;

    always @(posedge clk or posedge start) begin
        if(start == 1'b1) begin
            done <= 1'b0;
            iter <= 6'd0;
        end
        else if(iter >= 6'd6) 
            done <= 1'b1;
        else 
            if(done == 1'b0) 
                iter <= iter + 6'd1;
    end

endmodule