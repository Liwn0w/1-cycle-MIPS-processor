module extendertest;
  reg extop;
  reg [15:0]imm;
  wire [31:0] extout;
  Extender e(imm,extout,extop);
  
  initial
  begin
    extop=0;
    imm=16'h1234;
    
    #100
    extop=0;
    imm=16'h2345;
    
    //most significant bit is 0
    #100
    extop=1;
    imm=16'h1234;
    
    //most significant bit is 1
    #100
    extop=1;
    imm=16'he001;
  end
endmodule

