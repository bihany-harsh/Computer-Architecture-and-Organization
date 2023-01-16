`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:08 01/11/2023 
// Design Name: 
// Module Name:    D_FF 
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

module D_FF(q,d,clk,reset);
output q;
input d, clk,reset;
reg q; 

always@(posedge reset or negedge clk)
begin
	if(reset)
		q<=1'b0;
	else
  		q<=d;
end
endmodule