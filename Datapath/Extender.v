module Extender(imm,extout,extop);
  //the immediate value to be extended
  input [15:0] imm;
  //the control signal for extension type
  input extop;
  //the extendes value
  output [31:0] extout;

  //if zero extension, then add 16 0's infront of immediate
  assign extout=(extop==0)?{16'b0,imm}:
  //sign extension:
  //if the most significant bit is 0, then add 16 0's in front of immediate
         (imm[15]==0)?{16'b0,imm}:
         //if the most significant bit is 1, then add 16 1's in front of immediate
         {16'hffff,imm};
 
endmodule

