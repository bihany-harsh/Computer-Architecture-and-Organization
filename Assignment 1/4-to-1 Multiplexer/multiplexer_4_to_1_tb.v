module multiplexer_4_to_1_tb;

reg [31:0] I0, I1, I2, I3;
reg [1:0] S;
wire [31:0] Y;
integer i;

multiplexer_4_to_1 uut (.Y(Y), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .S(S));

initial begin

    $monitor("I0=%b, I1=%b, I2=%b, I3=%b, S=%b, Y=%b", I0, I1, I2, I3, S, Y);

    S <= 0;
    I0 = $random;
    I1 = $random;
    I2 = $random;
    I3 = $random;

    for (i = 0; i < 10; i = i + 1) begin
       #2 S <= 1;
    end

    #5 $finish;
end

endmodule