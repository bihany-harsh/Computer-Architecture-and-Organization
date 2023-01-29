module mjolnir_adder (sum, c_out, a, b);

parameter W = 32;

input [W-1:0] a, b;
output [W-1:0] sum;
output c_out;

wire c_defining;
wire [(W/2)-1:0] S0, S1;
wire C0, C1;

ripple_carry_adder #(.W((W/2))) uut1 (.sum(sum[(W/2)-1:0]), .c_out(c_defining), .a(a[(W/2)-1:0]), .b(b[(W/2)-1:0]), .c_in(1'b0));
ripple_carry_adder #(.W((W/2))) uut2 (.sum(S0), .c_out(C0), .a(a[W-1:(W/2)]), .b(b[W-1:(W/2)]), .c_in(1'b0));
ripple_carry_adder #(.W((W/2))) uut3 (.sum(S1), .c_out(C1), .a(a[W-1:(W/2)]), .b(b[W-1:(W/2)]), .c_in(1'b1));

mux #(.W((W/2))) sum_mux (.Y(sum[W-1:(W/2)]), .D0(S0), .D1(S1), .S(c_defining));
mux #(.W(1)) carry_mux (.Y(c_out), .D0(C0), .D1(C1), .S(c_defining));


endmodule