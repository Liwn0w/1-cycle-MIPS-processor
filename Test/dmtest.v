module dmtest;
  reg memwr;
  reg[9:0]addr;
  reg clk;
  reg[29:0] datain;
  wire[29:0] dataout;
  dm d1(datain,clk,dataout,memwr,addr);
  
  initial
  begin
    clk=0;
    //ten nanoseconds between each operation
    
    #10
    memwr=0;
    addr=10'b1010101010;
    datain=30'b111111111111111111111111111111;
    
    #10
    memwr=0;
    addr=10'b1001001000;
    datain=30'b101111111111111111111111111111;
    
    #10
    memwr=1;
    //cell is temp[682]
    addr=10'b1010101010;
    datain=30'b111111111111111111111111111111;
    
    #10
    memwr=1;
    //cell is temp[584]
    //only this is successfully executed as clock is 1 and memwr is 1
    addr=10'b1001001000;
    datain=30'b101111111111111111111111111111;
  
  end
  always
  //clock changes every 50 ns
  #50 clk=~clk;
  
endmodule

