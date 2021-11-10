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

    // Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg s;

    // Output
    wire [31:0] out;

    // Instantiate the Unit Under Test (UUT)
    MUX_32b_2_to_1 UUT(.a(a), .b(b), .select(s), .out(out));
    

    initial begin
        // Add stimulus here
        a = 51;
        b = 122;

        #10
        s = 0;
        #1
        $display("s:%b, a:%b, b:%b, out:%b", s, a, b, out);

        #10
        s = 1;
        #1
        $display("s:%b, a:%b, b:%b, out:%b", s, a, b, out);

    end 

endmodule

module mux_5b_tb;

    // Inputs
    reg [4:0] a;
    reg [4:0] b;
    reg s;

    // Output
    wire [4:0] out;

    // Instantiate the Unit Under Test (UUT)
    MUX_5b_2_to_1 UUT(.a(a), .b(b), .select(s), .out(out));
    


    initial begin
        // Add stimulus here
        a = 15;
        b = 22;

        #10
        s = 0;
        #1
        $display("s:%b, a:%b, b:%b, out:%b", s, a, b, out);

        #10
        s = 1;
        #1
        $display("s:%b, a:%b, b:%b, out:%b", s, a, b, out);
        
        
    end 

endmodule