`timescale  1ns/1ps

module ripple_carry_adder_4bit_tb;
    
    reg [3:0] A = 4'b0000, B = 4'b0000;
    reg Ci = 1'b0;
    wire [3:0] S;
    wire Co;

    ripple_carry_adder_4bit ripple_carry_adder(A, B, Ci, S, Co);

    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);
        #10
        A = 4'b0100;
        B = 4'b0101;
        Ci = 1'b0;
        #10
        A = 4'b0001;
        B = 4'b1110;
        Ci = 1'b1;
        #10
        A = 4'b0111;
        B = 4'b1100;
        Ci = 1'b1;
    end

endmodule 