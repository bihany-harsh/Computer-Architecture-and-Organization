`timescale 1 ns / 10 ps
`include "eq2.v"

module eq2_tb;

reg [1:0] test_in0, test_in1;
wire test_out;

eq2 uut(.a(test_in0), .b(test_in1), .aeqb(test_out));

initial begin

$dumpfile("eq2_tb.vcd");
$dumpvars(0, eq2_tb);

test_in0 = 2'b00;
test_in1 = 2'b00;
#200
test_in0 = 2'b01;
test_in1 = 2'b00;
#200
test_in0 = 2'b01;
test_in1 = 2'b11;
#200
test_in0 = 2'b10;
test_in1 = 2'b10;
#200
test_in0 = 2'b10;
test_in1 = 2'b00;
#200
test_in0 = 2'b11;
test_in1 = 2'b11;
#200
test_in0 = 2'b11;
test_in1 = 2'b01;
#200

$stop;

end

endmodule