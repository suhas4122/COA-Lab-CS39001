/*
Computer Organisation and Architecture Lab
Assignment no. 1
Group no. 8
Suhas Jain and Monal Prasad
*/

module carry_look_ahead_16bit_tb;

    reg [15:0] A = 16'b0, B = 16'b0;
    reg Ci;
    wire [15:0] S;
    wire Co, PG, GG;

    carry_look_ahead_16bit carry_look_ahead(A, B, Ci, S, Co, PG, GG);

    initial begin
        $monitor("A = %b, i_teBrm2 = %b, Ci = %b, S = %b, Co = %b PG = %b, GG = %b", A, B, Ci, S, Co, PG, GG);
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