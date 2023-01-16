`timescale 1ps/1ps

module decoder_2_to_4_tb;

reg a, b, enable;
wire y0, y1, y2, y3;

decoder_2_to_4 uut (.y0(y0), .y1(y1), .y2(y2), .y3(y3), .a(a), .b(b), .enable(enable));

initial begin
    a <= 1'b0;
    b <= 1'b0;
    enable <= 1'b0;

    $monitor("a=%b, b=%b, enable=%b, y0=%b, y1=%b, y2=%b, y3=%b", a, b, enable, y0, y1, y2, y3);

    #10 a <= 1'b0;
    b <= 1'b0;
    enable <= 1'b1;

    #10 a <= 1'b0;
    b <= 1'b1;
    enable <= 1'b1;

    #10 a <= 1'b1;
    b <= 1'b0;
    enable <= 1'b1;

    #10 a <= 1'b1;
    b <= 1'b1;
    enable <= 1'b1;

    #10 a <= 1'b0;
    b <= 1'b0;
    enable <= 1'b0;

    #10 a <= 1'b0;
    b <= 1'b1;
    enable <= 1'b0;

    #10 a <= 1'b1;
    b <= 1'b0;
    enable <= 1'b0;

    #10 a <= 1'b1;
    b <= 1'b1;
    enable <= 1'b0;
end

endmodule