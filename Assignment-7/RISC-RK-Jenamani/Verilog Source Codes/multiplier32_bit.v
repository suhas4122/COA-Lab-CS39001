`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:21:55 10/30/2019 
// Design Name: 
// Module Name:    multiplier32_bit 
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
module multiplier32_bit(
    input [31:0] A,
    input [31:0] B,
    output [63:0] product
    );
      
	wire [63:0] product;                  
	wire [2047:0] temp;       
	genvar i;        
	assign temp[63:0] = A[0] ? B : 0;  //first output size bits          
	generate          
		for (i = 1; i < 32; i = i+1)      
		begin        
			assign temp[(32*(4+(2*(i-1))))-1 : 64*i] = (A[i]? B<<i :0)+ temp[(32*(4+(2*(i-2))))-1:64*(i-1)];      
		end
	endgenerate          
	assign product=temp[2047:1984];     //taking last output size bits            

endmodule
