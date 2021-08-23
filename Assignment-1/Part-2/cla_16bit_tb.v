module tb_CLA16;

    reg [15:0] A;
    reg [15:0] B;
    reg Ci;
    wire [15:0] S;
    wire Co;
    wire [3:0] PG;
    wire [3:0] GG;

    wire [15:0] G;
    wire [15:0] P;
    wire [15:1] C;

    CLA16 u1(A, B, Ci, S, Co, PG, GG);

    initial begin
        $monitor("i_term1 = %b, i_term2 = %b, i_carry = %b, o_sum = %b, o_carry = %b PG = %b, GG = %b", A, B, Ci, S, Co, PG, GG);
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