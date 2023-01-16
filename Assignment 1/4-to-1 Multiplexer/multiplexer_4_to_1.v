module multiplexer_4_to_1(Y, I0, I1, I2, I3, S);

input [31:0] I0, I1, I2, I3;
input [1: 0] S;
output reg [31:0] Y;

always @(I0 or I1 or I2 or I3 or S) begin
    case (S)
        2'b00: Y = I0;
        2'b01: Y = I1;
        2'b10: Y = I2;
        2'b11: Y = I3;
    endcase
end

endmodule