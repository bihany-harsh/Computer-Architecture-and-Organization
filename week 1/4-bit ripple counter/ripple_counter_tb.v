`timescale 1 ns/ 1ns

module ripple_counter_tb;

reg clk, reset;
wire [3:0] q;

ripple_carry_counter uut(.q(q), .clk(clk), .reset(reset));

initial begin
    clk <= 0;
    forever #10 clk <= ~clk;
end

initial begin

    $dumpfile("ripple_counter_tb.vcd");
    $dumpvars(0, ripple_counter_tb);

    reset = 1;
    #100 reset = 0;

    #2000 $finish;
end

endmodule