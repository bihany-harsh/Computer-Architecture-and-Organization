module mux (Y, D0, D1, S);

parameter W = 32;

output [W-1:0] Y;
input [W-1:0] D0, D1;
input S;

assign Y = (S) ? D1 : D0;

endmodule