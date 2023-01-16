module full_subtractor_32_bit(diff, b_out, a, b, b_in);

input [31:0] a, b;
input b_in;
output [31:0] diff;
output b_out;
genvar i;

// using full_subtractor
wire [31:0] b_out_temp;

generate
    for(i = 0; i < 32; i = i + 1) begin
        if (i == 0)
            full_subtractor uut(.diff(diff[i]), .b_out(b_out_temp[i]), .a(a[i]), .b(b[i]), .b_in(b_in));
        else
            full_subtractor uut(.diff(diff[i]), .b_out(b_out_temp[i]), .a(a[i]), .b(b[i]), .b_in(b_out_temp[i-1]));
    end
endgenerate

assign b_out = b_out_temp[31];

endmodule