module pctest;
  reg clk,reset;
  reg [29:0] newpc;
  wire [29:0] pcout;
  pc p1(clk,reset,newpc,pcout);
  
  initial
  begin
    clk=0;
    reset=0;
    
    #100
    reset=1;
    newpc=30'b111111111111111111111111111111;
    
    #100;
    reset=0;
    newpc=30'b111111111111111111111111111111;
  end
    
    always
    #500 clk=~clk;
  endmodule
  
  

