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
    wire c_flag;
    dff d(.clk(clk), .reset(reset), .d(carry_flag), .q(c_flag));

    always @(*) begin
        if(reset) begin
            offset_out <= 21'd0;
            branch_success <= 1'd0;
        end
        else begin
            case(op_code)
                6'd6: begin
                    if(alu_result[31]) begin
                        offset_out = offset_in;
                        branch_success = 1'd1;
                    end 
                    else begin
                        offset_out = 21'd0;
                        branch_success = 1'd0;
                    end
                end
                6'd7: begin
                    if(alu_result == 16'd0) begin
                        offset_out = offset_in;
                        branch_success = 1'd1;
                    end 
                    else begin
                        offset_out = 21'd0;
                        branch_success = 1'd0;
                    end
                end
                6'd8: begin
                    if(alu_result != 16'd0) begin
                        offset_out = offset_in;
                        branch_success = 1'd1;
                    end 
                    else begin
                        offset_out = 21'd0;
                        branch_success = 1'd0;
                    end
                end
                6'd9: begin
                    offset_out = offset_in;
                    branch_success = 1'd1;
                end
                6'd10: begin
                    offset_out = offset_in;
                    branch_success = 1'd1;
                end
                6'd11: begin
                    if(c_flag) begin
                        offset_out = offset_in;
                        branch_success = 1'd1;
                    end 
                    else begin
                        offset_out = 21'd0;
                        branch_success = 1'd0;
                    end
                end
                6'd12: begin
                    if(!c_flag) begin
                        offset_out = offset_in;
                        branch_success = 1'd1;
                    end 
                    else begin
                        offset_out = 21'd0;
                        branch_success = 1'd0;
                    end
                end
                6'd5: begin
                    offset_out = (alu_result[20:0] - PC[20:0] - 21'd4) >> 2;
                    branch_success = 1'd1;
                end
                default: begin
                    offset_out = 21'd0;
                    branch_success = 1'd0;
                end
            endcase
        end
    end

endmodule 