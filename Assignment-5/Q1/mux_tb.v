module mux_tb;
    reg in0, in1, s;
    wire out;

    mux MUX(.in0(in0), .in1(in1), .s(s), .out(out));
    integer i;

    initial begin
        for(i = 0; i < 8; i++) begin
            #1
            {s, in0, in1} = i;
            #1
            $display("s:%0h, in0:%0h, in1:%0h, out:%0h", s, in0, in1, out);
        end
    end 
endmodule
   