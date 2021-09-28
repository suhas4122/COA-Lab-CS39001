`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 5
// Group No     : 8
// Problem No   : 4
// Group Members: Suhas Jain    (19CS30048)
//				  Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a fsm of sequential seq_comparator 

module seq_comparator_fsm(
	input clk,
	input inp_bit1,
	input inp_bit2, 
    input reset,
    input OP, 
	output reg L,
	output reg E,
	output reg G
); 
    // Declare states of the fsm (same as numbeer % 3)
    parameter EQUAL = 0, LESS = 1, GREATER = 2;
    // Declare present state and next state 
	reg [1:0]PS, NS;

    // Sequential contol block
    // Asynchronous reset 
    always @(posedge clk) begin
        if(reset) begin                     // If reset is 1, set L, E, G to 0 and PS and NS to EQUAL 
            L <= 0;             
            E <= 0;
            G <= 0;
            PS <= EQUAL;
            NS <= EQUAL;
        end
        else begin   
            PS <= NS;                       // Else go to the next state 
        end
    end 

    // Next state block 
    // If we go in LESS or GREATER state we will 
    // remain in those states because we are reading 
    // from MSB to LSB side 
    always @(*) begin
	    case (PS)
            EQUAL : begin
                if(inp_bit1 == inp_bit2)            // If both the inputs are equal, stay in EQUAL
                    NS = EQUAL;
                else if(inp_bit1 < inp_bit2)        // If input-1 < input-2, go to LESS
                    NS = LESS;
                else if(inp_bit1 > inp_bit2)        // If input-1 > input-2, go to GREATER
                    NS = GREATER;
                else 
                    NS = EQUAL;
            end                         
            LESS : begin
                NS = LESS;                  // If in state LESS, stay in state LESS unless reset
            end                         
            GREATER : begin
                NS = GREATER;               // If in state GREATER, stay in state GREATER unless reset
            end                       
        endcase	
	end

    // Output control block
    // Whenever OP becomes 1 set the  
    // values of L, E, G accordingly 
    always @(posedge OP) begin
	    case (PS)
            EQUAL : begin                    // For state EQUAL, L = G = 0 and E = 1
                L <= 0;
                E <= 1;
                G <= 0;
            end                         
            LESS : begin                    // For state LESS, E = G = 0 and L = 1
                L <= 1;
                E <= 0;
                G <= 0;
            end                         
            GREATER : begin                 // For state GREATER, L = E = 0 and G = 1
                L <= 0;
                E <= 0;
                G <= 1;
            end                       
        endcase	
	end

endmodule 