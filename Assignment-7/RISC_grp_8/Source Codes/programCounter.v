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
    input [20:0] offset,
    input clk,
    input reset,
    output reg [31:0] PC,
    output wire [31:0] PC_next
);

    wire [31:0] PC_no_branch;
    wire [31:0] PC_branch;
    wire [31:0] jump;
    wire carry_temp1;
    wire carry_temp2;

    assign jump = {{11{offset[20]}}, offset} << 2;

    carry_look_ahead_32bit cla1(.A(PC), .B(32'd4), .Ci(1'd0), .S(PC_no_branch), .Co(carry_temp1));
    carry_look_ahead_32bit cla2(.A(PC_no_branch), .B(jump), .Ci(1'd0), .S(PC_branch), .Co(carry_temp2));

    assign PC_next = (branch) ? PC_branch : PC_no_branch;

    always @(posedge clk or posedge reset) begin
        if(reset)
            PC = -32'd4;
        else 
            PC = PC_next;
    end

endmodule 