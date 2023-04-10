module PC_control (
    PC_old, instruction, Jump, Branch, Bne, zero, PC_next
);

input [31:0] PC_old, instruction;
input Jump, Branch, Bne, zero;
output reg [31:0] PC_next;

reg [31:0] sign_ext;
reg [31:0] PC_old_temp;
reg [31:0] jump;
reg zero_temp;

initial begin
    PC_next = 32'b0;
end

always @ (PC_old) begin
    PC_old_temp = PC_old + 4;
end

always @ (zero, Bne) begin
    zero_temp = zero;
    if (Bne == 1) begin
        zero_temp = !zero_temp;
    end
end

always @ (instruction) begin
    jump = {4'b0, instruction[25:0], 2'b0};
    // sign extension
    if (instruction[15] == 1'b0) begin
        sign_ext = {16'b0, instruction[15:0]};
    end
    else begin
        sign_ext = {{16{1'b1}}, instruction[15:0]};
    end
    sign_ext = {sign_ext[29:0], 2'b0};
end

always @ (instruction or PC_old_temp or jump) begin
    jump = {PC_old_temp[31:26], jump[27:0]};
end

always @ (PC_old_temp, sign_ext, jump, Branch, zero_temp, Jump) begin
    if (Branch == 1 & zero_temp == 1) begin
        PC_next = PC_old_temp + sign_ext;
    end
    else begin
        PC_next = PC_old_temp;
    end
    if (Jump == 1) begin
        PC_next = jump;
    end
end

endmodule