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
    /*
        branch: single bit input denoting whether the instruction is of branching type
        offset: 21 bit offset for branching instructions
        clk: clock signal
        reset: reset signal
        PC: 32 bit output program counter 
        PC_next: 32 bit output going to the Data Path
    */

    wire [31:0] PC_no_branch;       // PC in case of non-branching instructions
    wire [31:0] PC_branch;          // PC in case of branching instructions
    wire [31:0] jump;
    wire carry_temp1;
    wire carry_temp2;

    assign jump = {{11{offset[20]}}, offset} << 2;      // Variable storing value to be added to PC + 4 if there is branch

    // Calculate PC for non-branching instructions and store in PC_no_branch
    carry_look_ahead_32bit cla1(.A(PC), .B(32'd4), .Ci(1'd0), .S(PC_no_branch), .Co(carry_temp1));

    // Calculate PC for branching instructions and store in PC_branch
    carry_look_ahead_32bit cla2(.A(PC_no_branch), .B(jump), .Ci(1'd0), .S(PC_branch), .Co(carry_temp2));
    
    // Select next PC value
    assign PC_next = (branch) ? PC_branch : PC_no_branch;

    always @(posedge clk or posedge reset) begin
        if(reset)
            PC = -32'd4;        // reset condition
        else 
            PC = PC_next;       // set next value of PC
    end

endmodule 