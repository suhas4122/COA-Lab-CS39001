module seq_comparator_tb;
	// Inputs
	reg clk, reset, OP;
	reg [31:0] a,b;

	// Outputs
	wire L,E,G;

	integer i;

	// Instantiate the Unit Under Test (UUT)
	seq_comparator FSM(.clk(clk),.reset(reset), .OP(OP), .temp_a(a),.temp_b(b) ,  .L(L) , .E(E) , .G(G));

	initial begin
		// Initialize Inputs
		clk = 0;
		a = 32'd50;
		b = 32'd50;
		reset = 1;
		OP = 0;

		// Wait 10 ns for global reset to finish
		#10;
		reset = 0; // Make reset 0
		for (i=0;i<32;i=i+1)
            #10;
        
		OP= 1;
        #10;
		//$monitor("clk: %d, a: %d, b: %d, out: %d", clk, a, b, out);
		$display("Comparison complete");
		$finish;
	end
   
	always
		#5 clk = !clk;

endmodule
