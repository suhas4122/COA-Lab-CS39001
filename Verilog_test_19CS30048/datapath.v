`timescale 1ns / 1ps

// SUHAS JAIN
// 19CS30048
// COA LAB TEST-2 (VERILOG)

module datapath_unit(clk, start, a, b, done, prod);

    input clk, start, done; 
    input [6:0] a, b; 
    output reg [12:0] prod;
    
    reg [11:0] p, temp_a, temp_b, temp_prod;
    reg carry;

    always @(posedge clk or posedge start) begin
        if(start == 1'b0) begin
            if(done == 1'b0) begin
                carry <= 0;
                if(temp_a[0] == 1'b1)
                    {carry, p[11:6]} = p[11:6] + temp_b;
                if(done == 1'b0) begin
                    temp_a <= temp_a >> 1;
                    temp_prod = p;
                    p[11] <= carry;
                    p[10:0] <= p[11:1];
                    temp_prod = p;
                end
            end
        end
        else begin
            temp_a <= a[5:0];
            temp_b <= b[5:0];
            p <= 0;
            carry <= 0;
        end
        prod[12] <= 1'b0;
        prod[11:0] <= temp_prod;
    end

endmodule