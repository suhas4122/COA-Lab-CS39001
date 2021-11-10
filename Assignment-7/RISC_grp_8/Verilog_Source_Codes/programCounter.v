`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module programCounter(
    input branch,
    input [15:0] offset,
    input clk,
    input reset,
    output reg [31:0] PC
);

    wire [31:0] PC_no_banch;
    wire [31:0] PC_branch;
    wire [31:0] PC_next;
    wire [31:0] jump;

    signExtend16to32 uut(.inp(offset), .out(jump));

    assign PC_no_banch = PC + 32'd1;
    assign PC_branch = PC + 32'd1 + jump;

    assign PC_next = (branch) ? PC_branch : PC_no_banch;

    always @(posedge clk or posedge reset) begin
        if(reset)
            PC <= 32'd0;
        else 
            PC <= PC_next;
    end

endmodule 