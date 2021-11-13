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
    /*
        op_code: operation code from the instruction
        func_code: function code from the instruction
        clk: clock signal
        reset: reset signal
        alu_control: ALU control signal 
        ab_set: ALU set signal indicating carry operation 
        reg_write: register write signal 
        mem_write: memory write signal (for store operation)
        mem_read: memory read signal (for load operation)
        ALU_src: ALU source signal (0: register, 1: immediate)
        reg_data: register data signal 
        const_src: constant source signal (for immediate addressing)
        reg_to_PC: register to PC signal indicating jump 
        reg_write_select: register write select signal (for writing to register file)
    */

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
                11'd2:                          // AND operation       
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
                11'd3:                          // XOR operation
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
                11'd4:                            // Shift left logical 
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
                11'd5:                              // Shift Right logical
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
                11'd6:                              // Shift left logical variable
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
                11'd7:                              // Shift right logical variable
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
                11'd8:                              // Shift right arithmetic
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
                11'd9:                              // Shift right arithmetic variable
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
                default:                            // In case of undefined function code
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
                // I type instructions                      
                6'd1:                               // Load word
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
                    begin                           // Store word
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
                6'd3:                               // Add immediate
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
                6'd4:                               // Comp immediate
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
                    // Branch type instructions
                6'd5:                               // Branch register
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
                6'd6:                               // Branch on less than zero
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
                    begin                           // Branch on flag zero
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
                6'd8:                               // Branch on flag not zero
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
                6'd9:                               // Unconditional Branch
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
                6'd10:                              // Branch and link
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
                6'd11:                              // Branch on carry
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
                6'd12:                              // Branch on no carry
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
                default:                            // In case of undefined opcode
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