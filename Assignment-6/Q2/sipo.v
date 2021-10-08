module sipo(
	input clk,
	input rst,
	input a,
	output reg [7:0] sum
	);

	// Positive edge triggered flip flop
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			sum=8'b0;
		else
			sum = {a, sum[7:1]};
	end
endmodule