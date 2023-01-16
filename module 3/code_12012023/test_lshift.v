module test_lshift;


//inputs and outputs
 reg clk, rstn, load_en;
 reg[7:0] load_val;
 wire[7:0] op;

// Instantiate the Unit Under Test (UUT)
lshift_reg uut (
  .clk(clk),
  .rstn(rstn),
  .load_en(load_en),
  .load_val(load_val),
  .op(op)
);

initial begin
  clk<=0;
  forever #10 clk<=~clk;
end

initial begin
  $dumpfile("test_lshift.vcd");
  $dumpvars(0,test_lshift);
  rstn=0;
  load_en=0;

  #100;
  rstn=1;
  load_en=1;
  load_val=8'b01010101;

  #100;
  rstn=1;
  load_en=0;

#2000 $finish;
end
endmodule
