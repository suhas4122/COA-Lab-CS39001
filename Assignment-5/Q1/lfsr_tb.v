module lfsr_tb;
    reg clk = 0;
    reg sel = 0;
    reg [3:0]seed = 4'b1111;
    reg reset = 0;
    wire [3:0]w;

    lfsr LFSR(.clk(clk), .sel(sel), .seed(seed), .reset(reset), .w(w));

    initial begin
        #6
        $monitor("w[0]:%b, w[1]:%b, w[2]:%b, w[3]:%b", w[0], w[1], w[2], w[3]);
        #1
        sel = 1;
        #150
        $finish;
    end
    
    always 
        #5 clk = ~clk;
    

endmodule