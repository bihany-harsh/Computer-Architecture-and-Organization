`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:35:18 01/26/2023
// Design Name:   serial_adder
// Module Name:   /home/ise/vm_share/three_to_eight_decoder/test_serial_adder.v
// Project Name:  three_to_eight_decoder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: serial_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_serial_adder;

	// Inputs
	reg [255:0] a;
	reg [255:0] b;
	reg cin,clk;
	reg rst;

	// Outputs
	wire [255:0] sum;
	wire cout;
	wire [255:0] test,result;

	// Instantiate the Unit Under Test (UUT)
	serial_adder uut (
		.a(a), 
		.b(b), 
		.clk(clk),
		.cin(cin), 
		.sum(sum), 
		.cout(cout), 
		.rst(rst)
	);
	initial begin
	clk<=0;
	forever #10 clk<=~clk;
	end
	
	assign result=a+b+cin;
	assign test=result^{cout,sum};
	initial begin
		// Initialize Inputs
		a = {$random,$random,$random,$random,$random,$random,$random,$random};
		b = {$random,$random,$random,$random,$random,$random,$random,$random};
		cin = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#200;
       
		rst=0; 
		// Add stimulus here

	end
      
endmodule

