`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment No: 6
// Group No     : 8
// Problem No   : 3
// Group Members: Suhas Jain    (19CS30048)
//                Monal Prasad  (19CS30030)
// Semester No  : 5 (Autumn 2021-22)
//////////////////////////////////////////////////////////////////////////////////
// Module to implement a 8-bit booth multiplier 

module booth_multiplier(
    input clk,
    input reset,
    input load,
    input signed [7:0] Mc,
    input signed [7:0] Mp,
    output reg [15:0] product
);

    reg signed [7:0] A, Q, B;
    reg Q_1;
    reg [3:0] count;
    reg [1:0] temp;
    reg [7:0] sum, diff;

    always @(posedge clk) begin
        if (reset) begin
            A <= 8'b0;
            B <= 8'b0;
            Q <= 8'b0;
            Q_1 <= 1'b0;
            count <= 4'b0;
        end
        else if (load) begin
            A <= 8'b0;
            B <= Mc;
            Q <= Mp;
            Q_1 <= 1'b0;
            count <= 4'b0;
        end
        else if(count <= 8) begin
            temp = {Q[0], Q_1};
            case (temp)
                2'b01 : begin
                    sum = A + B;
                    A <= {sum[7], sum[7:1]};
                    Q <= {sum[0], Q[7:1]};
                end
                2'b10 : begin
                    diff = A - B; 
                    A <= {diff[7], diff[7:1]};
                    Q <= {diff[0], Q[7:1]};
                end
                default: begin
                    A <= {A[7], A[7:1]};
                    Q <= {A[0], Q[7:1]};
                end
            endcase
            Q_1 <= Q[0];
            count <= count + 1'b1;
            product <= {A, Q};
        end
    end

endmodule
