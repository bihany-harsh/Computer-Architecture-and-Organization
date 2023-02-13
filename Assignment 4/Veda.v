module Veda_memory(clk, reset, address, data_in, write_enable, mode, data_out);
input clk, reset, write_enable, mode;
input [4:0] address;
input [31:0] data_in;
output reg [31:0] data_out;

reg [31:0] memory [0:31];
integer  i;

always @(posedge clk) begin
    if(reset) begin
      for (i = 0; i < 32; i = i + 1) begin 
        memory[i] <= 0;
      end
    end
    else if (write_enable && mode == 0) begin
        memory[address] <= data_in;
        data_out <= data_in;
    end
    else if (mode == 1) begin
        data_out <= memory[address];
    end
end

endmodule