// TESTBENCH
module testbench;

reg [127:0] a, b;
wire [127:0] s;
wire c_out;

stormbreaker_adder uut (.s(s), .c_out(c_out), .a(a), .b(b));

initial begin
	a <= 128'b0;
	b <= 128'b0;
	
	$monitor("a=%d, b=%d, s=%d, c_out=%d", a, b, s, c_out);
	
	#10;
	a <= 128'd127;
	b <= 128'd45;
	#10;
	a <= 128'd27;
	b <= 128'd4;
end

endmodule

// STORMBREAKER ADDER

module stormbreaker_adder (s, c_out, a, b);

input [127:0] a, b;
output [127:0] s;
output c_out;

parameter k = 16;

genvar i;

wire [(128/k)-1:0] c_out_temp;
wire [(128/k)-1:0] c_in_temp;
wire [(128/k)-1:0] p;

generate
	
	for (i = 0; i < 128/k; i = i + 1) begin
		if (i == 0)	begin		
			full_adder #(.k(k)) uut_adder(.s(s[((i+1)*k)-1:i*k]), .c_out(c_out_temp[i]), .a(a[((i+1)*k)-1:i*k]), .b(b[((i+1)*k)-1:i*k]), .c_in(1'b0));
			P #(.k(k)) uut_p(.p(p[i]), .a(a[((i+1)*k)-1:i*k]), .b(b[((i+1)*k)-1:i*k]));
			mux uut_mux(.out(c_in_temp[i]), .S(p[i]), .I0(c_out_temp[i]), .I1(1'b0));
		end
		else begin
			full_adder #(.k(k)) uut_adder(.s(s[((i+1)*k)-1:i*k]), .c_out(c_out_temp[i]), .a(a[((i+1)*k)-1:i*k]), .b(b[((i+1)*k)-1:i*k]), .c_in(c_in_temp[i-1]));
			P #(.k(k)) uut_p(.p(p[i]), .a(a[((i+1)*k)-1:i*k]), .b(b[((i+1)*k)-1:i*k]));
			mux uut_mux(.out(c_in_temp[i]), .S(p[i]), .I0(c_out_temp[i]), .I1(c_in_temp[i-1]));
		end
	end

endgenerate

assign c_out = c_in_temp[(128/k)-1];

endmodule

// P module
module P (p, a, b);

parameter k = 16;
input [k-1:0] a, b;
output reg p;

integer i;

always @ (*) begin
	p = 1'b1;
	for (i=0; i < k; i = i + 1) begin
		p = p && (a[i]^b[i]);
	end
end

endmodule


// FULL ADDER

module full_adder (s, c_out, a, b, c_in);

parameter k = 32;
output [k-1:0] s;
output c_out;

input [k-1:0] a, b;
input c_in;

wire [k-1:0] c_out_temp;

genvar i;

generate
    for (i = 0; i < k; i = i + 1) begin
        if (i == 0)
            simple_full_adder uut (.s(s[i]), .c_out(c_out_temp[i]), .a(a[i]), .b(b[i]), .c_in(c_in));
        else
            simple_full_adder uut (.s(s[i]), .c_out(c_out_temp[i]), .a(a[i]), .b(b[i]), .c_in(c_out_temp[i-1]));
    end
endgenerate

assign c_out = c_out_temp[k-1];

endmodule

// SIMPLE ADDER

module simple_full_adder(s, c_out, a, b, c_in);

output s, c_out;
input a, b, c_in;

assign {c_out, s} = a + b + c_in;

endmodule

// MULTIPLEXOR

module mux (out, S, I0, I1);

input I0, I1;
input S;

output out;

assign out = S ? I1 : I0;

endmodule
