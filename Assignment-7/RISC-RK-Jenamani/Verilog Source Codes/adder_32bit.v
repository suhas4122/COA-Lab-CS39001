`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:12 10/30/2019 
// Design Name: 
// Module Name:    adder_32bit 
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
module adder_32bit(
    input [31:0] A,
    input [31:0] B,
    output [31:0] sum,
    output cout
    );

	wire  cout;
   wire [31:0] carry;

   genvar i;
   for(i=0;i<32;i=i+1)
     begin
		if(i==0) 
			full_adder f(A[i],B[i],0,sum[i],carry[i]);
		else
			full_adder f(A[i],B[i],carry[i-1],sum[i],carry[i]);
     end
  assign cout = carry[31]; 

endmodule 

module full_adder(
	input a,
	input b,
	input cin,
	output sum,
	output cout);
   
	assign sum = (a ^ b) ^ cin;
	assign cout = (b & cin) | (a & b) | (a & cin);

endmodule // full_adder
