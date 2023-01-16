module decoder_3_to_8(y0, y1, y2, y3, y4, y5, y6, y7, a, b, c, enable);

input a, b, c, enable;
output y0, y1, y2, y3, y4, y5, y6, y7;

wire intermediate1, intermediate2;
wire empty1, empty2;

decoder_2_to_4 d24_0 (.y0(intermediate1), .y1(intermediate2), .y2(empty1), .y3(empty2), .a(c), .b(1'b0), .enable(enable));
decoder_2_to_4 d24_1 (.y0(y0), .y1(y1), .y2(y2), .y3(y3), .a(a), .b(b), .enable(intermediate1));
decoder_2_to_4 d24_2 (.y0(y4), .y1(y5), .y2(y6), .y3(y7), .a(a), .b(b), .enable(intermediate2));

endmodule