// TESTBENCH

module testbench;

reg clk;
reg reset;
wire [3:0] q;
reg dir;

ripple_counter uut (q, clk, reset, dir);

initial begin
	dir = 1;
	clk = 0;
end

always
	#5 clk = ~clk;

initial begin
	dir = 1;
	reset = 1;
	#15 reset = 0;
	#170 dir = 0;
	#180 reset = 1;
	#02 $finish;
end

initial $monitor ("time=%g,rst=%b,clk=%b,q=%d,dir=%d",$time,reset,clk,q,dir);

endmodule

// RIPPLE UP/DOWN COUNTER

module ripple_counter (q, clk, reset, dir);

input clk, reset, dir;
output [3:0] q;

wire clk1, clk2, clk3;

t_ff uut1 (.q(q[0]), .clk(clk), .reset(reset));
t_ff uut2 (.q(q[1]), .clk(dir^q[0]), .reset(reset));
t_ff uut3 (.q(q[2]), .clk(dir^q[1]), .reset(reset));
t_ff uut4 (.q(q[3]), .clk(dir^q[2]), .reset(reset));

endmodule

// T_FF

module t_ff (q, clk, reset);

input clk, reset;
output q;

wire d;

d_ff df1(q, d, clk, reset);
not n1(d, q);

endmodule

// D_FF

module d_ff (q, d, clk, reset);

input clk, d, reset;
output reg q;

always @ (posedge clk or posedge reset) begin
	
	if (reset) begin
		q <= 1'b0;
	end
	else begin
		q <= d;
	end

end

endmodule

