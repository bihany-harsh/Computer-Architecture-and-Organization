module decoder_3_to_8_tb;

reg a, b, c, enable;
wire y0, y1, y2, y3, y4, y5, y6, y7;

decoder_3_to_8 uut (.y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7), .a(a), .b(b), .c(c), .enable(enable));

initial begin
    a <= 1'b0;
    b <= 1'b0;
    c <= 1'b0;
    enable <= 1'b0;

    $monitor("a=%b, b=%b, c=%b, enable=%b, y0=%b, y1=%b, y2=%b, y3=%b, y4=%b, y5=%b, y6=%b, y7=%b", a, b, c, enable, y0, y1, y2, y3, y4, y5, y6, y7);

    #10 a <= 1'b0;
    b <= 1'b0;
    c <= 1'b0;
    enable <= 1'b1;

    #10 a <= 1'b0;
    b <= 1'b0;
    c <= 1'b1;
    enable <= 1'b1;

    #10 a <= 1'b0;
    b <= 1'b1;
    c <= 1'b0;
    enable <= 1'b1;

    #10 a <= 1'b0;
    b <= 1'b1;
    c <= 1'b1;
    enable <= 1'b1;

    #10 a <= 1'b1;
    b <= 1'b0;
    c <= 1'b0;
    enable <= 1'b1;

    #10 a <= 1'b1;
    b <= 1'b0;
    c <= 1'b1;
    enable <= 1'b1;

    #10 a <= 1'b1;
    b <= 1'b1;
    c <= 1'b0;
    enable <= 1'b1;

    #10 a <= 1'b1;
    b <= 1'b1;
    c <= 1'b1;
    enable <= 1'b1;

    #10 a <= 1'b0;
    b <= 1'b0;
    c <= 1'b0;
    enable <= 1'b0;

    #10 a <= 1'b0;
    b <= 1'b0;
    c <= 1'b1;
    enable <= 1'b0;

    #10 a <= 1'b0;
    b <= 1'b1;
    c <= 1'b0;
    enable <= 1'b1;
end

endmodule