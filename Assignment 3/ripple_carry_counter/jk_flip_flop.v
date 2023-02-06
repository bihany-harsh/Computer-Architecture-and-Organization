module jk_flip_flop(q, q_bar, j, k, clk, reset);

input j, k, clk, reset;
output q, q_bar;

reg q_temp;
assign q = q_temp;
assign q_bar = ~q_temp;

initial begin
    q_temp = 1'b0;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q_temp <= 1'b0;
    end
    else begin
        case({j, k})
        2'b00: begin
            q_temp <= q_temp;
        end
        2'b01: begin
            q_temp <= 1'b0;
        end
        2'b10: begin
            q_temp <= 1'b1;
        end
        2'b11: begin
            q_temp <= ~q_temp;
        end
        endcase 
    end 
end

endmodule