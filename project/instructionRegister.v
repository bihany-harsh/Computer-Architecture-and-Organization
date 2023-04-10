module instructionRegister(
    address, opcode, funcode, instruction
);

input [31:0] address;
output reg [5:0] opcode, funcode;
output reg [31:0] instruction;

parameter INSTRUCTION_MEM_SIZE = 128;
reg [31:0] instructionMemory[INSTRUCTION_MEM_SIZE-1:0];

integer i;
initial begin
    for (i = 0; i < INSTRUCTION_MEM_SIZE; i = i + 1) begin
        instructionMemory[i] = 32'b11111100000000000000000000000000;
    end
    $readmemb("instructions.mem", instructionMemory);

    instruction = 32'b11111100000000000000000000000000;
end

always @ (address) begin
    if (address == -4) begin  // init
        instruction = 32'b11111100000000000000000000000000;
    end else begin
        instruction = instructionMemory[address>>2];
    end
    opcode = instruction[31:26];
    funcode = instruction[5:0];
end

endmodule
