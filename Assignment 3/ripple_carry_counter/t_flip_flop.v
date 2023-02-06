module t_flip_flop(q, clk, reset);

output q;
input clk, reset;

wire d;

d_flip_flop dff(.q(q), .d(d), .clk(clk), .reset(reset));

not n1(d, q);

endmodule