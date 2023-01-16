module decoder_2_to_4(y0, y1, y2, y3, a, b, enable);

input a, b, enable;
output wire y0, y1, y2, y3;

assign y0 = enable & (~a & ~b);
assign y1 = enable & (~a & b);
assign y2 = enable & (a & ~b);
assign y3 = enable & (a & b);

endmodule