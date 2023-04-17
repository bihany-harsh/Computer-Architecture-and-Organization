`define CYCLE_TIME 40

module tb;

  reg clk;
  integer i; // integer  counter

  always #(`CYCLE_TIME / 2) clk = ~clk;

  datapath uut (.clk(clk));

  initial begin
    // Initialize data memory
    for (i = 9; i < 32; i = i + 1) begin
      uut.uDataMemory.dataMemory[i] = 32'b0;
    end
      uut.uDataMemory.dataMemory[0] = 11;
      uut.uDataMemory.dataMemory[1] = 13;
      uut.uDataMemory.dataMemory[2] = 255;
      uut.uDataMemory.dataMemory[3] = 10;
      uut.uDataMemory.dataMemory[4] = 69;
      uut.uDataMemory.dataMemory[5] = 24;
      uut.uDataMemory.dataMemory[6] = 48;
      uut.uDataMemory.dataMemory[7] = 802;
      uut.uDataMemory.dataMemory[8] = 10;

    $dumpfile("tb.vcd");
    $dumpvars(0, tb);

    clk = 0;
  end

  always @(posedge clk) begin

    $display("_________________________________________________________________________________________________________");
    $display($time,, "PC: %d \n Data_memory:= %d %d %d %d %d %d %d %d %d ", uut.uPC.PC_out, 
             uut.uDataMemory.dataMemory[0], uut.uDataMemory.dataMemory[1], uut.uDataMemory.dataMemory[2], uut.uDataMemory.dataMemory[3],uut.uDataMemory.dataMemory[4], uut.uDataMemory.dataMemory[5], uut.uDataMemory.dataMemory[6], uut.uDataMemory.dataMemory[7], uut.
             uDataMemory.dataMemory[8]);
    $display("_________________________________________________________________________________________________________");
  end

  
  initial begin
    #10000 $finish;
  end


endmodule