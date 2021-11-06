`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module registerfile(
    input reg_write,
    input [31:0] reg_write_data,
    input [4:0] reg_1,
    input [4:0] reg_2,
    input [4:0] reg_write_adder,
    input clk, 
    input reset,
    output wire [31:0] reg_data_1,
    output wire [31:0] reg_data_2,
);

    reg [31:0] bank [31:0];
    integer i;

    assign reg_data_1 = bank[reg_1];
    assign reg_data_2 = bank[reg_2];

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(i=0; i<32; i=i+1) begin
                bank[i] = 32'd0; 
            end
        end
        else if(reg_write) begin
            bank[reg_write_adder] = reg_write_data;
        end
    end

endmodule 