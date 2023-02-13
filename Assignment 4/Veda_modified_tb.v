`timescale 1ns / 1ps

module Veda_modified_tb;

    reg clk;
    reg reset;
    reg [4:0] address_a;
    reg [4:0] address_b;
    reg [31:0] data_in;
    reg write_enable;
    reg mode;
    wire [31:0] data_out;

    Veda_memory_modified dut (
        .clk(clk),
        .reset(reset),
        .address_a(address_a),
        .address_b(address_b),
        .data_in(data_in),
        .write_enable(write_enable),
        .mode(mode),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        address_a = 0;
        address_b = 0;
        data_in = 32'h0;
        write_enable = 0;
        mode = 0;

        #5 reset = 0;

        // write test data to memory in scribble mode
        address_a = 5;
        data_in = 32'h12345678;
        mode = 0;
        write_enable = 1;
        #5 write_enable = 0;

        address_a = 10;
        data_in = 32'h87654321;
        mode = 0;
        write_enable = 1;
        #5 write_enable = 0;

        // read test data from memory in interpret mode
        address_b = 5;
        mode = 1;
        #5 $display("Address 5: %h", data_out);

        address_b = 10;
        #5 $display("Address 10: %h", data_out);

        #100 $finish;
    end

    always #5 clk = ~clk;

endmodule
