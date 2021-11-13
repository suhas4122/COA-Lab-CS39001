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
    output wire [31:0] reg_data_2
);
    /*
        reg_write: 1 if write is to be performed
        reg_write_data: data to be written to register
        reg_1: register number to be written to
        reg_2: register number to be read from
        reg_write_adder: register number to be written to
        clk: clock
        reset: reset
        reg_data_1: data read from register 1
        reg_data_2: data read from register 2
    */

    reg signed [31:0] bank [31:0];                         // 32*32-bit register file
    integer i;                                             // loop variable

    assign reg_data_1 = bank[reg_1];                       // read register 1
    assign reg_data_2 = bank[reg_2];                       // read register 2 

    always @(posedge clk or posedge reset) begin           
        if(reset) begin
            for(i=0; i<32; i=i+1) begin
                bank[i] = 32'd0;                           // initialize register file 
            end
        end
        else if(reg_write) begin
            bank[reg_write_adder] = reg_write_data;        // write to register
        end
    end

endmodule 