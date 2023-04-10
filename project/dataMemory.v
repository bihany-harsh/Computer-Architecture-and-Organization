module dataMemory(
    clk, address, writeData, ALUResult, MemWrite, MemRead, MemtoReg, readData
);

input clk;
input [31:0] address, writeData, ALUResult;
input MemWrite, MemRead, MemtoReg;
output reg [31:0] readData;

parameter DATA_MEM_SIZE = 128;
reg [31:0] dataMemory[DATA_MEM_SIZE-1:0];

integer i;
initial begin
    for (i = 0; i < DATA_MEM_SIZE; i = i + 1) begin
        dataMemory[i] = 32'b0;
    end
end

// reading from memory

always @(address or MemRead or MemtoReg or ALUResult) begin
    if (MemRead == 1) begin
        if (MemtoReg == 1) begin
            readData = dataMemory[address];
        end else begin
            readData = ALUResult;
        end
    end else begin
        readData = ALUResult;
    end
end

// writing to memory

always @(posedge clk) begin
    if (MemWrite == 1) begin
        dataMemory[address] = writeData;
    end
end

endmodule