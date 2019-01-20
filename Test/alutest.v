module alutest;
  reg[31:0]a,b;
  reg[1:0]aluctr;
  wire[31:0]aluout;
  ALU a1(a,b,aluctr,aluout,zero);
  
  initial
  begin
    //a = 305419896
    //b = 1164413185
    a=32'h12345678;
    b=32'h45678901;
    //a-b = -858993289 --> CCCCCD77 correct
    aluctr=2'b01;
    
    #100
    //a = 591751049
    a=32'h23456789;
    //b = 1450741778
    b=32'h56789012;
    //a + b = 2042492827 --> correct
    aluctr=2'b00;
  end
endmodule

