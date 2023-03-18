module testbench;

reg clk, reset, write_enable, mode;
reg [4:0] address;
reg [31:0] data_in;
wire [31:0] data_out;

Veda uut (clk, reset, write_enable, address, data_in, data_out, mode);

initial begin
	clk = 0;
	reset = 0;
	address = 0;
	data_in = 0;
	write_enable = 0;
	mode = 0;
	forever #5 clk = ~clk;
end

initial begin
	$dumpfile ("Veda.vcd");
	$dumpvars(0, testbench);

	address = 5;
	data_in = 32'h12345678;
	write_enable = 1;
	mode = 0;
	#10;
	write_enable = 1;
	mode = 1;
	address = 7;
	data_in = 32'h12238897;
	#10;
	write_enable = 0;
	mode = 1;
	address = 7;
	
	#100 $finish;
	
end

endmodule

// VEDA MEMORY

module Veda (clk, reset, write_enable, address, data_in, data_out, mode);

parameter scribble = 1'b0, interpret = 1'b1;
input clk, reset, write_enable, mode;
input [4:0] address;
input [31:0] data_in;
output reg [31:0] data_out;

reg [31:0] memory [0:31];
integer i;
reg [31:0] intermediate_reg;

always @ (posedge clk or posedge reset) begin
	if (reset) begin
		for (i = 0; i < 32; i = i + 1) begin
			memory[i] <= 32'b0;
		end
	end
	else begin
		if (write_enable && mode == scribble) begin
			memory[address] <= data_in;
			intermediate_reg <= data_in;
		end
		else if (write_enable) begin
			memory[address] <= data_in;
		end
		else if (mode == scribble) begin
			intermediate_reg <= data_in;
		end
		else if (mode == interpret) begin
			intermediate_reg <= memory[address];
		end
	end
end

always @ (posedge clk) begin
	data_out <= intermediate_reg;
end

endmodule