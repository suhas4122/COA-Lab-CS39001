module MUX_32b_2_to_1(
    input [31:0] a, 
    input [31:0] b, 
    input select, 
    output wire [31:0] out
);
	
	assign out = select ? b : a;

endmodule

module MUX_5b_2_to_1(
    input [4:0] a, 
    input [4:0] b, 
    input select, 
    output wire [4:0] out
);
	
	assign out = select ? b : a;

endmodule