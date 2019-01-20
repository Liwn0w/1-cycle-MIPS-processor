module ifu(imm,clk,reset,ins,npc_sel,zero,jal_ins);
  //clock and reset 
  input clk,reset;
  //control signal for getting another instruction (in beq)
  input zero;
  //the position of the pc
  input[1:0] npc_sel;
  //outputs the instruction
  output [31:0] ins;
  //outputs the next position of pc after jump is executed
  output [29:0] jal_ins;
  // wire to send pcout from pc to npc and newpc from npc to pc
  wire [29:0] newpc;
  //pc's address
  wire [29:0] pcout;
  //offset used in beq, received by IM in instruction
  input [15:0] imm;
  
  pc p1(clk,reset,newpc,pcout);
  im i1(pcout[9:0],ins);
  npc n1(ins[25:0],pcout,imm,npc_sel,zero,newpc,jal_ins);
  
endmodule

