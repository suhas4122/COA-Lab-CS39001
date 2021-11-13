`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module arithmeticLogicalUnit(
    input signed [31:0] A,
    input signed [31:0] B,
    input [3:0] alu_control,
    input ab_set,
    output reg [31:0] alu_result,
    output reg carry_flag,
    output wire zero_flag,
    output wire sign_flag
);

    /*
        A:              32-bit signed input
        B:              32-bit signed input 
        alu_control:    4 bit input to determine the operation to be carried out
        ab_set:         single bit input to determine the operands
        alu_result:     32 bit Output  containing the result of ALU 
        carry_flag:     stores resultant carry value (0/1)
        zero_flag:      stores 1 if alu_result = 0
        sign_flag:      stores the sign of the alu_result (0 for positive, 1 for negative)
    */
    wire signed [31:0] A_out, B_out, sum;
    wire carry;

    MUX_32b_2_to_1 m1(.a(A), .b(~B), .select(ab_set), .out(A_out));                                  // Setting input to cla in case of complement
    MUX_32b_2_to_1 m2(.a(B), .b(32'd1), .select(ab_set), .out(B_out));                               // B is 32'b1 if there is a complement

    carry_look_ahead_32bit cla1(.A(A_out), .B(B_out), .Ci(1'd0), .S(sum), .Co(carry));               // Carry look ahead adder for add and addi 

    wire [31:0] mem_offser_sum;           // Memory offset in case of branch 
    wire temp_carry;                      // temporary carry value
    wire [31:0] temp_B;                   // temp_B is used to store the value of B in case of branch 
    assign temp_B = {16'd0, B[15:0]};     // Taking first 16 bits of B as offset

    carry_look_ahead_32bit cla2(.A(A), .B(temp_B), .Ci(1'd0), .S(mem_offser_sum), .Co(temp_carry));  // Carry look ahead adder for memory offset

    assign sign_flag = alu_result[31];                              // Setting the value of sign_flag
    assign zero_flag = (alu_result == 32'd0) ? 1'd1 : 1'd0;         // Setting the value of zero_flag 

    always @(*) begin
        case(alu_control)
            4'd0: begin                     // Addition operation
                alu_result = sum;
                carry_flag = carry;
            end
            4'd1: begin                     // Complement operation
                alu_result = sum;           
            end
            4'd2: begin                     // AND operation
                alu_result = A & B;
            end
            4'd3: begin                     // XOR operation
                alu_result = A ^ B;
            end
            4'd4: begin                     // Logical Left shift
                alu_result = A << B;
            end
            4'd5: begin                     // Logical Right shift
                alu_result = A >> B;
            end
            4'd6: begin
                alu_result = A_out >>> B_out;   // Arithmetic Right shift
            end
            4'd7: begin
                alu_result = A;             // return A
            end
            4'd8: begin
                alu_result = B;             // return B
            end
            4'd9: begin
                alu_result = mem_offser_sum;
            end
            default: begin
                alu_result = 32'd0;         // Return 0
            end
        endcase
    end

endmodule 
