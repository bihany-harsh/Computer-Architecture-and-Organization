module datapath (clk);

input clk;

wire [31:0] pc_in, pc_out;
wire [5:0] opcode;
wire [5:0] funcode;
wire [31:0] instruction, read_wbdata, read_data1, read_data2;
wire RegDst, Jump, Branch, Bne, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;
wire [3:0] ALUCnt;
wire zero;
wire [31:0] ALUResult;

Program_counter uPC (
    .clk(clk),
    .PC_next(pc_in),
    .PC_out(pc_out)
);

instructionRegister uIR (
    .address(pc_out),
    .opcode(opcode),
    .funcode(funcode),
    .instruction(instruction)
);

Veda uVeda (
    .clk(clk),
    .instruction(instruction),
    .RegWrite(RegWrite),
    .RegDst(RegDst),
    .WriteData(read_wbdata),
    .ReadData1(read_data1),
    .ReadData2(read_data2)
);

ALU uALU (
    .data1(read_data1),
    .read2(read_data2),
    .instruction(instruction),
    .ALUSrc(ALUSrc),
    .ALUCnt(ALUCnt),
    .zero(zero),
    .ALUResult(ALUResult)
);

ALU_control uALU_control (
    .ALUOp(ALUOp),
    .funcode(funcode),
    .ALUCnt(ALUCnt)
);

Control_Unit uControl(
    .instruction(instruction),
    .RegDst(RegDst),
    .Jump(Jump),
    .Branch(Branch),
    .Bne(Bne),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
);

dataMemory uDataMemory (
    .clk(clk),
    .address(ALUResult),
    .writeData(read_data2),
    .ALUResult(ALUResult),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .readData(read_wbdata)
);

PC_control uPC_control (
    .PC_old(pc_out),
    .instruction(instruction),
    .Jump(Jump),
    .Branch(Branch),
    .Bne(Bne),
    .zero(zero),
    .PC_next(pc_in)
);

endmodule