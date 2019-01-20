module ALU(a,b,aluctr,aluout,zero);
  //The operands
  input [31:0] a,b;
  //The operation
  input [1:0] aluctr;
  //The result
  output [31:0] aluout;
  //when results is zero
  output zero;
  
  //depending on the ctr value, different operations occur
  assign aluout=(aluctr==2'b00)?a+b:
                (aluctr==2'b01)?a-b:
                (aluctr==2'b10)?a|b:
                (aluctr==2'b11)?{b[15:0],16'b0}:
                 aluctr;
  assign zero=(aluout==0);

endmodule
                 


