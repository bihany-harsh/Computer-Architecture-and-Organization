module SRAM(dataIn, dataOut, Addr, ChipSelect, WriteEnable, ReadEnable, Clock);

parameter ADR = 8;
parameter DAT = 8;
parameter DPTH = 8; // for simplicity only 8 words are used

input [DAT-1:0] dataIn;
output reg [DAT-1:0] dataOut;
input [ADR-1:0] Addr;
input ChipSelect;
input WriteEnable;
input ReadEnable;
input Clock;

reg [DAT-1:0] memory [DPTH-1:0];

always @(posedge Clock)
begin
if (ChipSelect) begin
    if (WriteEnable && ~ReadEnable) begin
        memory[Addr] <= dataIn;
    end
    else if (~WriteEnable && ReadEnable) begin
        dataOut <= memory[Addr];
    end
    else;
end
else;
end

endmodule