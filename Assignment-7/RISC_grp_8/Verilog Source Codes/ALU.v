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
    output reg [31:0] alu_result,
    output reg carry_flag,
    output wire zero_flag,
    output wire sign_flag
);

    wire [31:0] A_out, B_out, sum;
    wire carry;

    MUX_32b_2_to_1 m1(.a(A), .b(~A), .select(ab_set), .out(A_out));
    MUX_32b_2_to_1 m2(.a(B), .b(32'd1), .select(ab_set), .out(A_out));

    carry_look_ahead_32bit cla1(.A(A_out), .B(B_out), .Ci(1'd0), .S(sum), .Co(carry));

    wire [31:0] mem_offser_sum;
    wire temp_carry;
    wire [31:0] temp_B;
    assign temp_B = {16'd0, B[15:0]};

    carry_look_ahead_32bit cla2(.A(A), .B(temp_B), .Ci(1'd0), .S(mem_offser_sum), .Co(temp_carry));

    assign sign_flag = alu_result[31];
    assign zero_flag = (alu_result == 32'd0) ? 1'd1 : 1'd0;

    always @(A or B or alu_control) begin
        case(alu_control)
            4'd0: begin
                {carry_flag, alu_result} <= A + B;
                // alu_result <= sum;
                // carry_flag <= carry;
            end
            4'd1: begin
                alu_control <= ~A + 32'd1;
                // alu_result <= sum;
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
            default: begin
                alu_result <= 32'd0;
            end
        endcase
    end

endmodule 
