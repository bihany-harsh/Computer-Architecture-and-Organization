module D_FF(q, d, clk, reset);

input clk, reset, d;
output q;
reg q;

always @(posedge reset or negedge clk) begin
  if (reset)
    q <= 1'b0;
  else
    q <= d;
end

endmodule