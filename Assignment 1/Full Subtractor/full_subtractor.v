module full_subtractor(diff, b_out, a, b, b_in);

input a, b, b_in;
output diff, b_out;

// diff = b_in (xor) (a (xor) b)
// b_out = b_in (and) (not)(a (xor) b) (or) ((not)a (and) b)

wire a_xor_b;

xor(a_xor_b, a, b);
xor(diff, a_xor_b, b_in);

wire b_out_temp, not_a_and_b;

and(b_out_temp, ~a_xor_b, b_in);
and(not_a_and_b, ~a, b);
or(b_out, b_out_temp, not_a_and_b);

endmodule