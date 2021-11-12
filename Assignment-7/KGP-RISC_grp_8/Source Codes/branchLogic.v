`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module branchLogic(
    input [5:0] op_code,
    input [20:0] offset_in,
    input [31:0] alu_result,
    input clk,
    input reset,
    input zero_flag,
    input sign_flag,
    input carry_flag,
    input [31:0] PC,
    output reg [20:0] offset_out,
    output reg branch_success
);
    /*
        op_code:        6-bit op code
        offset_in:      21-bit offset calue for I type instructions
        alu_result:     32 bit input  containing the result of ALU 
        clk:            clock
        reset:          reset flag
        carry_flag:     single bit input from ALU
        zero_flag:      single bit input from ALU
                        stores 1 if alu_result = 0
        sign_flag:      single bit input from ALU
                        stores the sign of the alu_result (0 for positive, 1 for negative)
        PC:             32 bit program counter
        offset_out:     21 bit output offset value
        branch_success: single bit output to calculate next PC        

    */
    wire c_flag;
    dff d(.clk(clk), .reset(reset), .d(carry_flag), .q(c_flag));

    always @(*) begin
        if(reset) begin
            offset_out <= 21'd0;
            branch_success <= 1'd0;
        end
        else begin
            case(op_code)
                6'd6: begin                         // Branch on less than zero
                    if(alu_result[31]) begin       
                        offset_out = offset_in;     // PC will be shifted by shift amount
                        branch_success = 1'd1;
                    end 
                    else begin
                        offset_out = 21'd0;         // No jump required
                        branch_success = 1'd0;
                    end
                end
                6'd7: begin                         // Branch on flag zero
                    if(alu_result == 16'd0) begin   // if flag is 0
                        offset_out = offset_in;     // PC will be shifted by shift amount
                        branch_success = 1'd1;
                    end 
                    else begin                      // else if flag is not 0
                        offset_out = 21'd0;         // No jump required
                        branch_success = 1'd0;
                    end
                end
                6'd8: begin                         // Branch on flag not zero
                    if(alu_result != 16'd0) begin   // if flag is not zero
                        offset_out = offset_in;     // PC will be shifted by shift amount
                        branch_success = 1'd1;
                    end 
                    else begin                      // else if flag is 0
                        offset_out = 21'd0;         // No jump required
                        branch_success = 1'd0;
                    end
                end
                6'd9: begin                         // unconditional branch
                    offset_out = offset_in;         // PC will be shifted by shift amount
                    branch_success = 1'd1;
                end
                6'd10: begin                        // Branch and link
                    offset_out = offset_in;         // PC will be shifted by shift amount
                    branch_success = 1'd1;
                end
                6'd11: begin                        // Branch on carry
                    if(c_flag) begin                // if carry is not 0 
                        offset_out = offset_in;     // PC will be shifted by shift amount
                        branch_success = 1'd1;
                    end 
                    else begin                      // else if carry is 0
                        offset_out = 21'd0;         // No jump required
                        branch_success = 1'd0;
                    end
                end
                6'd12: begin                        // Branch on no carry
                    if(!c_flag) begin               // if carry is 0    
                        offset_out = offset_in;     // PC will be shifted by shift amount
                        branch_success = 1'd1;
                    end 
                    else begin                      // else if carry is not zero
                        offset_out = 21'd0;         // No jump required
                        branch_success = 1'd0;
                    end
                end
                6'd5: begin                         // Branch register
                    offset_out = (alu_result[20:0] - PC[20:0] - 21'd4) >> 2;
                    branch_success = 1'd1;
                end
                default: begin                      // Incase of an undefined opcode
                    offset_out = 21'd0;
                    branch_success = 1'd0;
                end
            endcase
        end
    end

endmodule 