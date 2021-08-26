`timescale  1ns/1ps

module ripple_carry_adder_16bit_tb;
    
    reg [15:0] A = 16'b0, B = 16'b0;
    reg Ci = 1'b0;
    wire [15:0] S;
    wire Co;

    ripple_carry_adder_16bit ripple_carry_adder(A, B, Ci, S, Co);

    initial begin
        $monitor("A = %b, B = %b, Ci = %b, S = %b, Co = %b", A, B, Ci, S, Co);
        #10
        A = 16'b0100101001001010;
        B = 16'b0101101101011011;
        Ci = 1'b0;
        #10
        A = 16'b0001111100011111;
        B = 16'b1110000011100000;
        Ci = 1'b1;
        #10
        A = 16'b0111101001111010;
        B = 16'b1100011011000110;
        Ci = 1'b1;
    end

endmodule 