`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module arithmeticLogicalUnit(
    input [31:0] A,
    input [31:0] B,
    input [3:0] alu_control,
    input ab_set,
    input clk, 
    input reset,
    output reg [31:0] alu_result,
    output reg carry_flag,
    output reg zero_flag,
    output reg sign_flag
);

    wire [31:0] A_out, B_out, sum;
    wire carry, zero, sign;

    MUX_32b_2_to_1 m1(.a(A), .b(~A), .select(ab_set), .out(A_out));
    MUX_32b_2_to_1 m1(.a(B), .b(32'd1), .select(ab_set), .out(A_out));

    carry_look_ahead_32bit(.A(A_out), .B(B_out), .Ci(1'd0), .S(sum), .Co(carry));

    wire [31:0] mem_offser_sum;
    wire temp_carry;
    wire temp_B = {16'd0, B[15:0]};

    carry_look_ahead_32bit(.A(A), .B(temp_B), .Ci(1'd0), .S(mem_offser_sum), .Co(temp_carry));

    assign sign = sum[31];
    assign zero = (sum == 32'd0) ? 1'd1 : 1'd0;

    always @(A or B or alu_control or posedge clk) begin
        if(reset) begin
            alu_result <= 0;
            carry_flag <= 0;
            zero_flag <= 0;
            sign_flag <= 0;
        end
        else begin
            case(alu_control)
                4'd0: begin
                    alu_result <= sum;
                    carry_flag <= carry;
                    zero_flag <= zero;
                    sign_flag <= sign;
                end
                4'd1: begin
                    alu_result <= sum;
                end
                4'd2: begin
                    alu_result <= A & B;
                end
                4'd3: begin
                    alu_result <= A ^ B;
                end
                4'd4: begin
                    alu_result <= A << B;
                end
                4'd5: begin
                    alu_result <= A >> B;
                end
                4'd6: begin
                    alu_result <= A >>> B;
                end
                4'd7: begin
                    alu_result <= A;
                end
                4'd8: begin
                    alu_result <= B;
                end
                4'd9: begin
                    alu_result <= mem_offser_sum;
                end
            endcase
        end
    end

endmodule 
