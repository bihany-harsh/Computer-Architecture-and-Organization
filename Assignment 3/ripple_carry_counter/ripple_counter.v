module ripple_counter(q, clk, m, reset);

input clk, reset, m;
output [3:0] q;

wire clk1, clk2, clk3;

xor x1(clk1, m, q[0]);
xor x2(clk2, m, q[1]);
xor x3(clk3, m, q[2]);

t_flip_flop t1(q[0], clk, reset);
t_flip_flop t2(q[1], clk1, reset);
t_flip_flop t3(q[2], clk2, reset);
t_flip_flop t4(q[3], clk3, reset);

endmodule
