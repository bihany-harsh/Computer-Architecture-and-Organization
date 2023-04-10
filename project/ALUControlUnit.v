module ALU_control(ALUCnt, ALUOp, funcode);

input [1:0] ALUOp;
input [5:0] funcode;
output reg [3:0] ALUCnt;

always @ (ALUOp, funcode) begin
    if (ALUOp == 2'b00) begin
        ALUCnt = 4'b0010;   // add and lw/sw
    end 
    else if (ALUOp == 2'b01) begin
        ALUCnt = 4'b0110;   // sub and beq
    end
    else if (ALUOp == 2'b10) begin  // R-Type
        case (funcode)
            6'b100000:  // add
                ALUCnt = 4'b0010;
            6'b100010:  // sub
                ALUCnt = 4'b0110;
            6'b100100:  // and
                ALUCnt = 4'b0000;
            6'b100101:  // or
                ALUCnt = 4'b0001;
            6'b101010:  // slt
                ALUCnt = 4'b0111;
            default:
                ALUCnt = 4'b0000;
        endcase
    end
    else if (ALUOp == 2'b11) begin  // NOR
        ALUCnt = 4'b0000;
    end
    else begin
        ALUCnt = 4'b0000;
    end
end


endmodule