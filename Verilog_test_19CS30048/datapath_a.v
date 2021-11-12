/*
    Ashutosh Kumar Singh
    19CS30008
    COA Laboratory Test 2
*/

`timescale 1ns / 1ps

module datapath(
    input clk, 
    input start, 
    input [6:0] a, 
    input [6:0] b, 
    input done, 
    output reg [12:0] product
);
    reg [11:0] p, a_temp, b_temp, p_temp;
    reg carry;

    always @(posedge clk or posedge start) begin
        if(start) begin
            p <= 0;
            carry <= 0;
            a_temp <= a[5:0];
            b_temp <= b[5:0];
        end
        else begin
            if(!done) begin
                carry <= 0;
                if(a_temp[0]) begin
                    {carry, p[11:6]} = p[11:6] + b_temp;
                end
                a_temp <= a_temp >> 1;
                p <= {carry, p[11:1]};
                p_temp = p;
            end
        end
        product <= {1'b0, p_temp};
    end

endmodule
