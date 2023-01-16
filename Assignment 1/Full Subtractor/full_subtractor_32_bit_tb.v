module full_subtractor_32_bit_tb;

reg [31:0] a, b;
reg b_in;
wire [31:0] diff;
wire b_out;

integer i;

full_subtractor_32_bit uut (
    .diff(diff),
    .b_out(b_out),
    .a(a),
    .b(b),
    .b_in(b_in)
);

initial begin
    a <= 32'b0;
    b <= 32'b0;
    b_in <= 1'b0;

    $monitor("a=%b, b=%b, b_in=%b, diff=%b, b_out=%b", a, b, b_in, diff, b_out);

    for (i = 0; i < 8; i = i + 1) begin
        #10 a <= $random;
        b <= $random;
        b_in <= $random;
    end
end

endmodule