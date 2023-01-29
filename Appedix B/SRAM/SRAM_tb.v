`timescale 1ns/1ps 

module SRAM_tb;

reg [7:0] dataIn;
reg [7:0] Addr;
reg ChipSelect;
reg WriteEnable;
reg ReadEnable;
reg Clock;

wire [7:0] dataOut;

SRAM uut(
    .dataIn(dataIn),
    .dataOut(dataOut),
    .Addr(Addr),
    .ChipSelect(ChipSelect),
    .WriteEnable(WriteEnable),
    .ReadEnable(ReadEnable),
    .Clock(Clock)
);

initial begin
    $dumpfile("SRAM_tb.vcd");
    $dumpvars(0, SRAM_tb);

    dataIn = 8'h0;
    Addr = 8'h0;
    ChipSelect = 1'b0;
    WriteEnable = 1'b0;
    ReadEnable = 1'b0;
    Clock = 1'b0;

    #100;
    dataIn = 8'h0;
    Addr = 8'h0;
    ChipSelect = 1'b1;
    WriteEnable = 1'b1;
    ReadEnable = 1'b0;

    #20;
    dataIn = 8'h0;
    Addr = 8'h0;

    #20;
    dataIn = 8'h1;
    Addr = 8'h1;

    #20;
    dataIn = 8'h10;
    Addr = 8'h2;

    #20;
    dataIn = 8'h6;
    Addr = 8'h3;

    #20;
    dataIn = 8'h12;
    Addr = 8'h4;

    #40;
    Addr = 8'h0;
    WriteEnable = 1'b0;
    ReadEnable = 1'b1;

    #20;
    Addr = 8'h1;
    #20;
    Addr = 8'h2;
    #20;
    Addr = 8'h3;
    #20;
    Addr = 8'h4;
end

always #10 Clock = ~Clock;

endmodule