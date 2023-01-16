module full_adder(s, c_out, a, b, c_in);

input a, b, c_in;
output s, c_out;

// s = c_in (xor) (a (xor) b)
// c_out = c_in (and) (a (xor) b) (or) (a (and) b)

wire a_xor_b;

xor(a_xor_b, a, b);
xor(s, a_xor_b, c_in);

wire c_out_temp, a_and_b;

and(c_out_temp, a_xor_b, c_in);
and(a_and_b, a, b);
or(c_out, c_out_temp, a_and_b);

endmodule