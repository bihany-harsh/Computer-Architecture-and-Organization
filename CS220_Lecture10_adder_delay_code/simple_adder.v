`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:31 01/26/2023 
// Design Name: 
// Module Name:    simple_adder 
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
module simple_adder(a,b, cin,sum,cout);
parameter W=256;

input [W-1:0] a,b;
input cin;
output [W-1:0] sum;
output cout;

assign {cout,sum}=a+b+cin;

endmodule
