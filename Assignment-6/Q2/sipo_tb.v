module sipo_tb;
reg clk,rst;
reg  a;
wire  [7:0]q;

sipo uut(.a(a), .clk(clk), .rst(rst),  .q(q));
initial
clk=1'b0;
always #10 clk=~clk;
initial begin
rst=1'b1; a=1'b1;
#10 rst=1'b0;
#10 a=1'b0;
#10 a=1'b1;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b1;
#10 a=1'b0;
end
initial begin
        $monitor("rst = %d a = %d q = %b", rst, a, q);
    end
 endmodule