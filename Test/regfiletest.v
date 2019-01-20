module regfiletest;
  reg regwr,clk,reset;
  wire[31:0] busw;
  wire[4:0] rw,ra,rb;
  wire[31:0] busa,busb;
  RegFile r1(clk,reset,busw,regwr,rw,ra,rb,busa,busb);
  initial
  begin
    clk=0;
    reset=0;
    #100
    reset=1;
    regwr=0;
    #100
    reset=1;
    regwr=1;
    #100
    reset=0;
    regwr=1;
    #100
    reset=0;
    regwr=0;
  end
    always
    #500 clk=~clk;
endmodule
