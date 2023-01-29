`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:20 01/26/2023 
// Design Name: 
// Module Name:    serial_adder 
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
module serial_adder(a,b,cin,clk,sum,cout,rst);

input [255:0] a,b;
input cin,rst,clk;
output reg [255:0] sum;
output reg cout;
reg [255:0] a_reg,b_reg;
reg cin_reg;
wire [31:0] s_temp;
wire c_temp;

always@(posedge clk)
begin
if(rst) begin
a_reg<=a;b_reg<=b;sum<=0;cout<=0;cin_reg<=cin;
end
else begin
a_reg<={32'd0,a_reg[255:32]};b_reg<={32'd0,b_reg[255:32]};cin_reg<=c_temp;
cout<=c_temp;
sum<={s_temp,sum[255:32]};
end
end

simple_adder #(.W(32)) add(a_reg[31:0],b_reg[31:0], cin_reg,s_temp,c_temp);





endmodule
