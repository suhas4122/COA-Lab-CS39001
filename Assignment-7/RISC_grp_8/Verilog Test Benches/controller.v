`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////
// Assignment No: 7
// Group No     : 8
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////

module controller(
    input [5:0] op_code,
    input [10:0] func_code,
    input clk,
    input reset,
    output reg [3:0] alu_control,
    output reg ab_set,
    output reg reg_write,
    output reg mem_write,
    output reg mem_read,
    output reg ALU_src,
    output reg reg_data,
    output reg const_src,
    output reg reg_to_PC,
    output reg reg_write_select
);

    always @(*) begin
        if(reset == 1) begin        // Setting all flags to 0 on reset signal
            alu_control <= 0;
            ab_set <= 0;
            reg_write <= 0;
            mem_write <= 0;
            mem_read <= 0;
            ALU_src <= 0;
            reg_data <= 0;
            const_src <= 0;
            reg_to_PC <= 0;
            reg_write_select <= 0;
        end
        else if(op_code == 6'd0)                 // R- type operations 
            case(func_code)
                11'd0:                          // Addition operation 
                    begin
                        alu_control <= 0;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd1:                          // Complement operation
                    begin
                        alu_control <= 1;
                        ab_set <= 1;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd2:
                    begin
                        alu_control <= 2;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd3:
                    begin
                        alu_control <= 3;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd4:
                    begin
                        alu_control <= 4;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 1;
                        const_src <= 1;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd5:
                    begin
                        alu_control <= 5;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 1;
                        const_src <= 1;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd6:
                    begin
                        alu_control <= 4;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd7:
                    begin
                        alu_control <= 5;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd8:
                    begin
                        alu_control <= 6;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 1;
                        const_src <= 1;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                11'd9:
                    begin
                        alu_control <= 6;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                default:
                    begin
                        alu_control <= 0;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
            endcase
        else begin
            case(op_code)                         
                6'd1:
                    begin
                        alu_control <= 0;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                6'd2:
                    begin
                        alu_control <= 1;
                        ab_set <= 1;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                6'd3:
                    begin
                        alu_control <= 9;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 1;
                        ALU_src <= 1;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 1;
                    end 
                6'd4:
                    begin
                        alu_control <= 9;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 1;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 1;
                    end 
                6'd5:
                    begin
                        alu_control <= 7;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                6'd6:
                    begin
                        alu_control <= 7;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                6'd7:
                    begin
                        alu_control <= 7;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 1;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                6'd8:
                    begin
                        alu_control <= 7;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                6'd9:
                    begin
                        alu_control <= 8;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                6'd10:
                    begin
                        alu_control <= 0;
                        ab_set <= 0;
                        reg_write <= 1;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 1;
                        reg_write_select <= 0;
                    end 
                6'd11:
                    begin
                        alu_control <= 8;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end 
                6'd12:
                    begin
                        alu_control <= 8;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 1;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end    
                default:
                    begin
                        alu_control <= 0;
                        ab_set <= 0;
                        reg_write <= 0;
                        mem_write <= 0;
                        mem_read <= 0;
                        ALU_src <= 0;
                        reg_data <= 0;
                        const_src <= 0;
                        reg_to_PC <= 0;
                        reg_write_select <= 0;
                    end      
            endcase
        end
    end

endmodule 