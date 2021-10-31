`timescale 1ns / 1ps

module LoadStoreUnit(input clk, input reset, input write_to_memory, input read_from_memory, input [31:0] address, input [31:0] input_data, output [31:0] output_data);

	wire Ram_Control;
	
	assign Ram_Control = (write_to_memory & (~read_from_memory));
	dataMemory_v7_3 RAMemory (.clka(~clk), .rsta(reset), .wea(Ram_Control), .addra(address), .dina(input_data), .douta(output_data));

endmodule
