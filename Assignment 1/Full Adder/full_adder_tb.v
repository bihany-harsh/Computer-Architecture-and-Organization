`timescale 1ns / 1ps

module full_adder_tb;

reg a, b, c_in;
wire s, c_out;
integer i;

full_adder uut (
    .s(s),
    .c_out(c_out),
    .a(a),
    .b(b),
    .c_in(c_in)
);

initial begin
    a <= 1'b0;
    b <= 1'b0;
    c_in <= 1'b0;

    $monitor("a=%b, b=%b, c_in=%b, s=%b, c_out=%b", a, b, c_in, s, c_out);

    for (i = 0; i < 8; i = i + 1) begin
        #10 a <= $random;
        b <= $random;
        c_in <= $random;
    end
end
endmodule