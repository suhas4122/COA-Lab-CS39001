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
    input [15:0] offset_in,
    input [31:0] alu_result,
    input clk,
    input reset,
    input zero_flag,
    input sign_flag,
    input carry_flag,
    output reg [15:0] offset_out,
    output reg branch_success
);

    always @(clk or reset) begin
        if(reset) begin
            offset_out = 0;
            branch_success = 0;
        end
        else begin
            case(op_code)
                6'd5: begin
                    offset_out = alu_result[15:0]
                    branch_success = 1;
                end
                6'd6: begin
                    if(alu_result[31]) begin
                        offset_out = offset_in
                        branch_success = 1;
                    end 
                    else begin
                        offset_out = 0
                        branch_success = 0;
                    end
                end
                6'd7: begin
                    if(alu_result == 32'd0) begin
                        offset_out = offset_in
                        branch_success = 1;
                    end 
                    else begin
                        offset_out = 0
                        branch_success = 0;
                    end
                end
                6'd8: begin
                    if(alu_result != 32'd0) begin
                        offset_out = offset_in
                        branch_success = 1;
                    end 
                    else begin
                        offset_out = 0
                        branch_success = 0;
                    end
                end
                6'd9: begin
                    offset_out = offset_in
                    branch_success = 1;
                end
                6'd10: begin
                    offset_out = offset_in
                    branch_success = 1;
                end
                6'd11: begin
                    if(carry_flag) begin
                        offset_out = offset_in
                        branch_success = 1;
                    end 
                    else begin
                        offset_out = 0
                        branch_success = 0;
                    end
                end
                6'd12: begin
                    if(!carry_flag) begin
                        offset_out = offset_in
                        branch_success = 1;
                    end 
                    else begin
                        offset_out = 0
                        branch_success = 0;
                    end
                end
            endcase
        end
    end

endmodule 