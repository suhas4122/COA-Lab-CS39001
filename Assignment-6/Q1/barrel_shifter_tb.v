//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 1
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a testbench for 8 bit bidirectional barrel shifter  

module barrel_shifter_tb;
    reg [7:0] in ;
    reg dir;
    reg [2:0] shamt;
    wire [7:0] out; 
  
    barrel_shifter uut(.in(in), .shamt(shamt), .dir(dir), .out(out));

    initial begin
        $display(" << TESTING LEFT SHIFT >>");
        in = 8'd0;  shamt = 3'd0; dir = 1; //no shift
        #10 in = 8'd13; shamt = 3'd1; dir = 1; // left shift by 1 bit
        #10 in = 8'd13; shamt = 3'd3; dir = 1; // left shift by 3 bit
        #10 in = 8'd13; shamt = 3'd5; dir = 1; // left shift by 5 bit
        #10 in = 8'd13; shamt = 3'd7; dir = 1; // left shift by 7 bit
        #10
        $display("\n << TESTING RIGHT SHIFT >>");
        #10 in = 8'd255; shamt = 3'd1; dir = 0; // right shift by 1 bit 
        #10 in = 8'd255; shamt = 3'd3; dir = 0; // right shift by 3 bit 
        #10 in = 8'd255; shamt = 3'd5; dir = 0; // right shift by 5 bit 
        #10 in = 8'd255; shamt = 3'd7; dir = 0; // right shift by 7 bit 
    end

    initial begin
        $monitor("Input = %0d, Shift Amount = %0d, Output = %0d",in,shamt,out);
    end

endmodule
