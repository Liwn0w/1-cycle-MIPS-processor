module ctr(opcode,funct,npc_sel,regwr,regdst,extop,aluctr,memwr,memtoreg,alusrc);
  input [5:0] opcode;
  input [5:0] funct;
  output [1:0] npc_sel;
  output regwr;
  output regdst;
  output extop;
  output alusrc;
  output [1:0] aluctr;
  output memwr;
  output memtoreg;
  
  wire addu,subu,ori,lw,sw,beq,lui,j,jal;
  
  assign addu=(opcode==6'b000000)&&(funct==6'b100001);
  assign subu=(opcode==6'b000000)&&(funct==6'b100011);
  assign ori=(opcode==6'b001101);
  assign lw=(opcode==6'b100011);
  assign sw=(opcode==6'b101011);
  assign beq=(opcode==6'b000100);
  assign lui=(opcode==6'b001111);
  assign j=(opcode==6'b000010);
  assign jal=(opcode==6'b000011);
  
  assign regdst=addu|subu;
  assign alusrc=ori|lw|sw|lui;
  assign memtoreg=lw;
  assign regwr=addu|subu|ori|lw|lui;
  assign memwr=sw|ori;
  assign npc_sel[0]=beq|jal;
  assign npc_sel[1]=j|jal;
  assign aluctr[0]=subu|lui|beq;
  assign aluctr[1]=ori|lui;
  assign extop=sw|lw;         	 	
  
endmodule

