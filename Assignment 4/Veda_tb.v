`timescale 1ns/1ps

module Veda_tb;
reg clk, reset, write_enable, mode;
reg [4:0] address;
reg [31:0] data_in;
wire [31:0] data_out;

Veda_memory uut (
    .clk(clk),
    .reset(reset),
    .write_enable(write_enable),
    .mode(mode),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
);

initial begin
    $dumpfile("Veda_tb.vcd");
    $dumpvars(0, Veda_tb);
    clk = 0;
    reset = 0;
    address = 0;
    data_in = 0;
    write_enable = 0;
    mode = 0;
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;
end

always #5 clk = ~clk;

initial begin
    address = 5;
    data_in = 32'h12345678;
    write_enable = 1;
    mode = 0;
    #10 write_enable = 0;
    mode = 1;
    address = 5;

    #10 $display("Data read from memory: %h", data_out);

end

endmodule