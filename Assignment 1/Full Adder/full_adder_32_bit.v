module full_adder_32_bit(sum, c_out, a, b, c_in);

input [31:0] a, b;
input c_in;
output [31:0] sum;
output c_out;
genvar i;

// using full_adder
wire [31:0] c_out_temp;

generate
    for(i = 0; i < 32; i = i + 1) begin
        if (i == 0)
            full_adder uut(.s(sum[i]), .c_out(c_out_temp[i]), .a(a[i]), .b(b[i]), .c_in(c_in));
        else
            full_adder uut(.s(sum[i]), .c_out(c_out_temp[i]), .a(a[i]), .b(b[i]), .c_in(c_out_temp[i-1]));
    end
endgenerate

assign c_out = c_out_temp[31];

endmodule