`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:25 01/11/2023 
// Design Name: 
// Module Name:    T_FF 
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
module T_FF(q,clk,reset);

output q;
input clk, reset;
wire d;

D_FF dff_0 (q,d,clk,reset);
not n1(d,q);

endmodule
