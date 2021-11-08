module MUX_32b_2_to_1(
    input [31:0] a, 
    input [31:0] b, 
    input select, 
    output [31:0] out
);
	
	assign out = select ? b : a;

endmodule