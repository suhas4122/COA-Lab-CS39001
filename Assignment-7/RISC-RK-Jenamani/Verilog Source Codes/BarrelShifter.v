`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:41 11/06/2019 
// Design Name: 
// Module Name:    BarrelShifter 
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
module BarrelShifter(
   input [31:0] in,
	input [4:0] shamt,
	input dir,
	output [31:0] out
    );
	 
	//	assign out = in << shamt; 
	 
	 wire [31:0] out_1;
	 wire [31:0] out_2;
	 wire [31:0] out_3;
	 wire [31:0] out_4;

	 wire [31:0] temp_1;
	 assign temp_1=dir?{in[15:0],16'b0}:{16'b0,in[31:16]};
	 MUX_2_to_1 M1(in,temp_1,shamt[4],out_1);
	 
    wire [31:0] temp_2;
	 assign temp_2=dir?{out_1[23:0],8'b0}:{8'b0,out_1[31:8]};
	 MUX_2_to_1 M2(out_1,temp_2,shamt[3],out_2);

	 wire [31:0] temp_3;	 
	 assign temp_3=dir?{out_2[27:0],4'b0}:{4'b0,out_2[31:4]};
	 MUX_2_to_1 M3(out_2,temp_3,shamt[2],out_3);

	 wire [31:0] temp_4;
	 assign temp_4=dir?{out_3[29:0],2'b0}:{2'b0,out_3[31:2]};
	 MUX_2_to_1 M4(out_3,temp_4,shamt[1],out_4);

	 wire [31:0] temp_5;
	 assign temp_5=dir?{out_4[30:0],1'b0}:{1'b0,out_4[31:1]};
	 MUX_2_to_1 M5(out_4,temp_5,shamt[0],out);

endmodule

module MUX_2_to_1(
	 input [31:0] in_0,
	 input [31:0] in_1,
	 input select,
	 output [31:0] out);
	 
	 assign out = select ? in_1 : in_0;

endmodule

module rightArithmeticBarrelShifter(
   input [31:0] in,
	input [4:0] shamt,
	output [31:0] out
	);
	
	//assign out = in << shamt; 

	 wire [31:0] out_1;
	 wire [31:0] out_2;
	 wire [31:0] out_3;
	 wire [31:0] out_4;

	 wire [31:0] temp_1;
	 assign temp_1=in[31]?{16'b1111111111111111,in[31:16]}:{16'b0,in[31:16]};
	 MUX_2_to_1 M1(in,temp_1,shamt[4],out_1);

	 wire [31:0] temp_2;
	 assign temp_2=out_1[31]?{8'b11111111,out_1[31:8]}:{8'b0,out_1[31:8]};
	 MUX_2_to_1 M2(out_1,temp_2,shamt[3],out_2);

	 wire [31:0] temp_3;	 
	 assign temp_3=out_2[31]?{4'b1111,out_2[31:4]}:{4'b0,out_2[31:4]};
	 MUX_2_to_1 M3(out_2,temp_3,shamt[2],out_3);

	 wire [31:0] temp_4;
	 assign temp_4=out_3[31]?{2'b11,out_3[31:2]}:{2'b0,out_3[31:2]};
	 MUX_2_to_1 M4(out_3,temp_4,shamt[1],out_4);

	 wire [31:0] temp_5;
	 assign temp_5=out_4[31]?{1'b1,out_4[31:1]}:{1'b0,out_4[31:1]};
	 MUX_2_to_1 M5(out4,temp_5,shamt[0],out);
 
endmodule

