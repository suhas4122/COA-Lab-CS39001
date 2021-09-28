module seq_comparator(
    input clk,
    input reset,
    input OP,
    input [31:0] temp_a,
    input [31:0] temp_b,
    output reg L,
    output reg E,
    output reg G
    
);
reg [31:0] a,b;
parameter  l = 3'b100,  e = 3'b010, g = 3'b001;
reg [2:0]PS,NS;            

always @(posedge clk or posedge reset) begin
        if(reset)
            PS <= e;
        else
            PS <= NS;
    end 

always @(posedge clk) begin
        a <= (a << 1);
        b <= (b << 1);
    end


always @(posedge clk) begin
    NS= PS;
    case(PS)
        l:  begin
            NS = l;
            end
        e: begin
            if(! (a[32] ^ b[32]))
                NS = e;
            else if (a[31] && !b[31])
                NS = g;
            else if (b[31] && !a[31])
                NS = l;  
            end
        g: begin
            NS = g;
            end
        
    endcase
end

always @(OP) begin
    if(OP)
    begin
    case(PS)
        l:  begin
            L<=1;
            E<=0;
            G<=0;
            end
        e:  begin
            L<=0;
            E<=1;
            G<=0;
            end
        g:  begin
            L<=0;
            E<=0;
            G<=1;
            end
    endcase
    end 
end               
endmodule