`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:31 10/30/2019 
// Design Name: 
// Module Name:    branchingLogic 
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
module branchingLogic(
    input clk,
    input [5:0] selector,
    input [15:0] input_offset,
    input [31:0] rs,
    input reset,
    input zflag_input,
    input oflag_input,
    input cflag_input,
    input sflag_input,
    output reg [15:0] output_offset,
    output reg branch_flag
    );
	 
	wire zflag_output, oflag_output, cflag_output, sflag_output;
	DFlipFlop zFlagFF (.clk(clk),.rst(reset),.in(zflag_input),.out(zflag_output));
	DFlipFlop oFlagFF (.clk(clk),.rst(reset),.in(oflag_input),.out(oflag_output));
	DFlipFlop cFlagFF (.clk(clk),.rst(reset),.in(cflag_input),.out(cflag_output));
	DFlipFlop sFlagFF (.clk(clk),.rst(reset),.in(sflag_input),.out(sflag_output)); // Dflipflops to preserve the flags for accurate branching
	
	always @(*)
	begin
		if(reset)
			begin
				output_offset = 0;
				branch_flag = 0;
			end
		else
			begin
				branch_flag = 1;
				case(selector)
					6'b100000: 
						begin 						// unconditional jump
							output_offset = input_offset;
						end
					6'b100001: 
						begin 						// jump to register value
							output_offset = rs[15:0];
						end
					6'b100010: 
						begin 						// branch on zero
							if(zflag_output)
								output_offset = input_offset;
							else 
								begin 						// branch condition fails
									branch_flag = 0;
									output_offset = 0;
								end
						end
					6'b100011: 
						begin 						// branch on not zero
							if(!zflag_output)
								output_offset = input_offset;
							else 
								begin 						// branch condition fails
									branch_flag = 0;
									output_offset = 0;
								end
						end
					6'b100100: 
						begin							// branch on carry flag
							if(cflag_output)
								output_offset = input_offset;
							else 
								begin 						// branch condition fails
									branch_flag = 0;
									output_offset = 0;
								end
						end
					6'b100101: 
						begin 						// branch on not carry
							if(!cflag_output)
								output_offset = input_offset;
							else 
								begin						// branch condition fails
									branch_flag = 0;
									output_offset = 0;
								end
						end
					6'b100110: 
						begin 						// branch on sign flag, i.e negative number
							if(sflag_output)
								output_offset = input_offset; 	
							else 
								begin						// branch condition fails
									branch_flag = 0;
									output_offset = 0;
							end
						end
					6'b100111: 
						begin 						// branch on not sign, i.e non negative number
							if(!sflag_output)
								output_offset = input_offset;
						else 
							begin 						// branch condition fails
								branch_flag = 0;
								output_offset = 0;
							end
						end
					6'b101000: 
						begin 						// branch on overflow
							if(oflag_output)
								output_offset = input_offset;
							else begin 						// branch condition fails
								branch_flag = 0;
								output_offset = 0;
							end
						end
					6'b101001: 
						begin 						// branch on not overflow
							if(!oflag_output)
								output_offset = input_offset;
							else begin 						// branch condition fails
								branch_flag = 0;
								output_offset = 0;
							end
						end
					6'b101010: 
						begin 						// function call
							output_offset = input_offset;
						end
					6'b101011: 
						begin 						// return - jump to (ra)
							output_offset = rs[15:0];
						end
					default: 
						begin 					// default vaule - no branch_flag and 0 offset
							branch_flag = 0;
							output_offset = 0;
						end
				endcase
			end
		end 

endmodule

module DFlipFlop( input wire clk, input wire rst, output reg out, input wire in);
	always @(posedge clk  or posedge rst)
	begin
		if(rst)
		 out <= 0; // reset condition
		else
			out <= in;
	end
endmodule
