`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:43 01/26/2023 
// Design Name: 
// Module Name:    simple_adder_delay 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module simple_adder_delay(clk,a,b,cin,sum,cout);
parameter W=256;

input [W-1:0] a,b;
input cin,clk;
output reg [W-1:0] sum;
output reg cout;

reg [W-1:0] a_reg, b_reg;
reg cin_reg;
wire [W-1:0] sum_wire;
wire cout_wire;

always@(posedge clk)
begin
a_reg<=a;b_reg<=b; cin_reg<=cin;sum<=sum_wire;cout<=cout_wire;
end

simple_adder add(a_reg,b_reg, cin_reg,sum_wire,cout_wire);


endmodule
