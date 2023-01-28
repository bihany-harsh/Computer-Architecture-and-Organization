module reg_file (clk, wr_en, w_addr, r_addr, w_data, r_data);

input clk, wr_en;
input [1:0] w_addr, r_addr;
input [7:0] w_data;
output reg [7:0] r_data;

reg [7:0] array_reg [3:0];

always @ (posedge clk) begin
if (wr_en)
  array_reg[w_addr] <= w_data;
r_data = array_reg[r_addr];
end

endmodule