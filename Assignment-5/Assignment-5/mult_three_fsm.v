`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:19 09/28/2021 
// Design Name: 
// Module Name:    mult_three_fsm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mult_three_fsm(
	input clk,
	input inp,
	input reset,
	output reg out
);
    parameter S0 = 0, S1 = 1, S2 = 2;
	reg [1:0]PS, NS;

    always @(posedge clk or posedge reset) begin
        if(reset)
            PS <= S0;
        else
            PS <= NS;
    end 

	always @(*) begin
	    case (PS)
            S0 : begin
                out = 1;
                NS = inp ? S1 : S0;
            end
            S1 : begin 
                out = 0;
                NS = inp ? S0 : S2;
            end 
            S2 : begin
                out = 0;
                NS = inp ? S2 : S1;
            end 
        endcase	
	end
endmodule
