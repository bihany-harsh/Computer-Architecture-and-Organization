module full_adder(sum, c_out, a, b, c_in);

input a, b, c_in;
output sum, c_out;

assign {c_out, sum} = a + b + c_in;

endmodule