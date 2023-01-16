`timescale 1ns / 1ps

module full_adder_tb;

reg a, b, b_in;
wire diff, b_out;
integer i;

full_subtractor uut (
    .diff(diff),
    .b_out(b_out),
    .a(a),
    .b(b),
    .b_in(b_in)
);

initial begin
    a <= 1'b0;
    b <= 1'b0;
    b_in <= 1'b0;

    $monitor("a=%b, b=%b, b_in=%b, diff=%b, b_out=%b", a, b, b_in, diff, b_out);

    for (i = 0; i < 8; i = i + 1) begin
        #10 a <= $random;
        b <= $random;
        b_in <= $random;
    end
end
endmodule