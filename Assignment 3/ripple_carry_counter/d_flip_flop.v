module d_flip_flop(q, d, clk, reset);

output reg q;
input d, clk, reset;

always @(posedge reset or negedge clk) begin
    if (reset) begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end

endmodule