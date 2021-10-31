`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:40 10/16/2019 
// Design Name: 
// Module Name:    MUX 
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
module MUX_2(
input [1:0] inputBus,
input selectLine,
output output2_1
);

	wire output2_1;
	assign output2_1 = inputBus[selectLine];

endmodule

module MUX_16(
input [15:0] inputBus,
input [3:0] selectLine,
output output16_1
);

	wire output16_1;
	assign output16_1 = inputBus[selectLine];

endmodule

module MUX(
    input [31:0] inputBus,
    input [4:0] selectLine,
    output output_32
    );

	wire temp1;
	wire temp2;

	MUX_16 mux_16_1(inputBus[31:16], selectLine[3:0], temp1);
	MUX_16 mux_16_2(inputBus[15:0], selectLine[3:0], temp2);

	MUX_2 mux_2({temp1, temp2}, selectLine[4], output_32);

endmodule
