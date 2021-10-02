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
  
initial 
 begin
    $display($time, " << Starting the Simulation >>");
        in= 8'd0;  shamt=3'd0; dir = 1; //no shift
    #10 in=8'd8; shamt= 3'd4; //dir = 0;//shift 4 bit
    #10 in=8'd8; shamt= 3'd2; //dir = 0;//shift 2 bit
    #10 in=8'd8; shamt= 3'd1; //dir = 0;//shift by 1 bit
    #10 in=8'd8; shamt= 3'd7; //dir = 0;//shift by 7bit
  end
    initial begin
      $monitor("Input=%d, Shift Amount =%d, Output=%d",in,shamt,out);
    end
endmodule
