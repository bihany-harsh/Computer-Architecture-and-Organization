module ALU (
    data1,        // data 1
    read2,        // data 2 from MUX
    instruction,  // used for sign-extension
    ALUSrc,
    ALUCnt,
    zero,
    ALUResult
);

input [31:0] data1, read2, instruction;
input ALUSrc;
input [3:0] ALUCnt;
output reg zero;
output reg [31:0] ALUResult;

reg [31:0] data2;

// deciding inputs to ALU

always @ (ALUSrc, read2, instruction) begin
    if (ALUSrc == 0) begin
        data2 = read2;
    end else begin
        if (instruction[15] == 0) begin
            data2 = {16'b0, instruction[15:0]};
        end else begin
            data2 = {{16{1'b1}}, instruction[15:0]};
        end
        // simple sign extension
    end
end

always @ (data1, data2, ALUCnt) begin
    case (ALUCnt)
        4'b0000:
            ALUResult = data1 & data2;  // AND
        4'b0001:
            ALUResult = data1 | data2;  // OR
        4'b0010:
            ALUResult = data1 + data2;  // ADD
        4'b0110:
            ALUResult = data1 - data2;  // SUB
        4'b0111:
            ALUResult = (data1 < data2) ? 1 : 0;  // SLT
        4'b1100:
            ALUResult = data1 | ~data2;  // NOR
        default:
            ALUResult = 0;
    endcase
    // assigning zero
    zero = (ALUResult == 0) ? 1 : 0;
end


endmodule