`timescale 1ns/1ns
`include "hello.v"

module hello_tb;

reg A;
wire B;

hello uut(.A(A), .B(B));

initial begin
    $dumpfile("hello_tb.vcd");
    $dumpvars(0, hello_tb);

    A = 0;
    #10;
    A = 1;
    #10;
    A = 0;
    #10;
    $display("Test complete");
end

endmodule