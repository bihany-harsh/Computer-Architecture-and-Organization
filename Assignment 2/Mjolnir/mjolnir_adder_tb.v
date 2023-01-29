module mjolnir_adder_tb;

reg [31:0] a, b;
wire [31:0] sum;
wire c_out;

integer i;

mjolnir_adder #(.W(32)) adder(.a(a), .b(b), .sum(sum), .c_out(c_out));

initial begin
    a <= 32'b0;
    b <= 32'b0;

    $dumpfile("mjolnir_adder.vcd");
    $dumpvars(0, mjolnir_adder_tb);
    #100;
    for (i = 0; i < 8; i = i + 1) begin
        #10 a <= $random;
        b <= $random;
    end
end

endmodule