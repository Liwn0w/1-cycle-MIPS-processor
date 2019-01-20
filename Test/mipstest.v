module mipstest;
  reg clk,reset;
  
  mips c(clk,reset);
  initial
  begin
    reset=0;
    clk=0;
    #5
    reset=1;
    #5
    reset=0;
  end
  
  always
  #50 clk=~clk;
endmodule

