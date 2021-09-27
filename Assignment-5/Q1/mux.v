module mux(
    input in0, 
    input in1,
    input s, 
    output reg out
);

    always @(*) begin
        if(s)
            out <= in1;
        else
            out <= in0;
    end
endmodule 