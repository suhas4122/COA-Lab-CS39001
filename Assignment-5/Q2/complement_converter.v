module complement_converter (
    input clk,
    input inp,
    input reset,
    output reg out  
);
    parameter S0 = 0, S1 = 1;
    reg PS, NS;

    always @(posedge clk or posedge reset) begin
        if(reset)
            PS <= S0;
        else
            PS <= NS;
    end

    always @(*) begin
        case (PS)
            S0: begin
                out = inp;
                NS = inp ? S1 : S0;
            end 

            S1: begin
                out = ~inp;
                NS = S1;
            end
        endcase
    end
endmodule

