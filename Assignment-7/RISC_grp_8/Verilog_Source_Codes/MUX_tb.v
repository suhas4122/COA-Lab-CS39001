`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Problem No   : 1
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////


module mux_32b_tb;

    // Declare inputs and outputs 
    reg [31:0] in0;
    reg [31:0] in1;
    reg s;
    wire [31:0] out;

    // Instantiate the Unit Under Test (UUT)
    MUX_32b_2_to_1 UUT(.a(in0), .b(in1), .select(s), .out(out));
    

    initial begin
        // Check all possible combinations of s, in0, in1

            #10
            in0 = 51;
            in1 = 22;
            s = 0;
            $display("s:%d, in0:%d, in1:%d, out:%d", s, in0, in1, out);

            #10
            s = 1;
            #1
            $display("s:%d, in0:%d, in1:%d, out:%d", s, in0, in1, out);
            
        
    end 

endmodule

module mux_5b_tb;

    // Declare inputs and outputs 
    reg [4:0] in0;
    reg [4:0] in1;
    reg s;
    wire [4:0] out;

    // Instantiate the Unit Under Test (UUT)
    MUX_5b_2_to_1 UUT(.a(in0), .b(in1), .select(s), .out(out));
    


    initial begin
        // Check all possible combinations of s, in0, in1

            #10
            in0 = 15;
            in1 = 22;
            s = 0;
            $display("s:%b, in0:%d, in1:%d, out:%d", s, in0, in1, out);

            #10
            s = 1;
            #1
            $display("s:%b, in0:%d, in1:%d, out:%d", s, in0, in1, out);
            
        
    end 

endmodule