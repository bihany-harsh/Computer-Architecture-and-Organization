module ripple_carry_adder(sum, c_out, a, b, c_in);

parameter W = 32;

input [W-1:0] a, b;
input c_in;
output [W-1:0] sum;
output c_out;

genvar i;

wire [W-1:0] c_out_temp;

generate

    for (i = 0; i < W; i = i + 1) begin

        if (i == 0)
            full_adder uut (.sum(sum[i]), .c_out(c_out_temp[i]), .a(a[i]), .b(b[i]), .c_in(c_in));
        else
            full_adder uut (.sum(sum[i]), .c_out(c_out_temp[i]), .a(a[i]), .b(b[i]), .c_in(c_out_temp[i-1]));

    end

endgenerate

assign c_out = c_out_temp[W-1];

endmodule