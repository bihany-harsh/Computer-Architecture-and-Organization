module Veda_modified (clk, reset, write_enable, address_a, data_in, address_b, mode, data_out);

	parameter scribble = 1'b0, interpret = 1'b1;
	input clk, reset, write_enable, mode;
	input [4:0] address_a, address_b;
	input [31:0] data_in;
	output [31:0] data_out;
	
	always @ (posedge clk or posedge reset) begin
	if (reset) begin
		for (i = 0; i < 32; i = i + 1) begin
			memory[i] <= 32'b0;
		end
	end
	else begin
		if (write_enable && mode == scribble) begin
			memory[address_a] <= data_in;
			intermediate_reg <= data_in;
		end
		else if (write_enable) begin
			memory[address] <= data_in;
			intermediate_data <= memory[address_b];
		end
		else if (mode == scribble) begin
			intermediate_reg <= data_in;
		end
		else if (mode == interpret) begin
			intermediate_reg <= memory[address_b];
		end
	end
	end

	always @ (posedge clk) begin
		data_out <= intermediate_reg;
	end

endmodule