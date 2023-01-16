module full_adder_32_bit_tb;

reg [31:0] a, b;
reg c_in;
wire [31:0] sum;
wire c_out;

integer i;

full_adder_32_bit uut (
    .sum(sum),
    .c_out(c_out),
    .a(a),
    .b(b),
    .c_in(c_in)
);

initial begin
    a <= 32'b0;
    b <= 32'b0;
    c_in <= 1'b0;

    $monitor("a=%b, b=%b, c_in=%b, sum=%b, c_out=%b", a, b, c_in, sum, c_out);

    for (i = 0; i < 8; i = i + 1) begin
        #10 a <= $random;
        b <= $random;
        c_in <= $random;
    end
end

endmodule