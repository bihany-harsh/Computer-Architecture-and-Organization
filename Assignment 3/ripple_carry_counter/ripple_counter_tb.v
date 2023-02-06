module ripple_counter_tb;
    // input to be stored in reg and output as net(wire)
    reg clk;
    reg rst;
    wire [3:0]q;
    reg dir;

    // instantiate the ripplecounter design block
    ripple_counter dut(q, clk, dir, rst);

    // generate clock pulse
    // initially provide 0
    // then inside always block toggle 
    // clock every 5 time units
    initial begin
      dir = 1;
      clk = 0;
    end
    always
      #5 clk = ~clk;

    // provide reset values as the input
    initial
       begin
         dir = 1;
         rst = 1;
         #15 rst = 0;
         #170 dir = 0;
         #180 rst = 1;
         #10 rst = 1;
         #20 $finish;
       end
       initial
        $monitor("time=%g,rst=%b,clk=%b,q=%d,dir=%d",$time,rst,clk,q,dir);
endmodule