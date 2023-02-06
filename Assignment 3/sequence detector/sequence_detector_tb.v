`timescale 1ns / 1ps
module sequence_test_bench;
reg clk;
reg rst;
reg data_in; 
wire  data_out;

seq_detector seq( clk, rst,data_in,data_out);

initial begin 
clk = 1'b1;
forever #5 clk = ~clk;
end

initial begin

$dumpfile("sequence_detector.vcd");
$dumpvars(0,sequence_test_bench);

#5;
rst = 1'b1;
#10; 
rst = 1'b0;
#5;
data_in = 1'b1;
#8;
data_in = 1'b0;
#8;
data_in = 1'b1;
#8;
data_in = 1'b0;
#8;
data_in = 1'b1;
#8;
data_in = 1'b0;
#8;
data_in = 1'b1;
#8;
data_in = 1'b1;
#8;
data_in = 1'b0;
#8;
data_in = 1'b1;
#12;
data_in = 1'b0;
#8;
data_in = 1'b1;
#8;
data_in = 1'b0;
#8;
data_in = 1'b1;
#8;
$finish;
end
endmodule