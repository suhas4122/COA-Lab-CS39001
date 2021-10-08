module sipo(a,clk,rst,q);
input clk,rst;
input a;
output [7:0]q;

reg [7:0]temp;
always@(posedge clk,posedge rst)
begin
if(rst==1'b1)
temp<=8'b00000000;
else
begin
temp<=temp<<1'b1;
temp[0]<=a;
end
end
assign q=temp;
endmodule