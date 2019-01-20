module mips(clk,reset);
  input clk,reset;
  wire regdst,memwr,memtoreg,alusrc,extop,regwr;
  wire [1:0] npc_sel;
  wire [1:0]aluctr; 
  
  wire [31:0] reg_a;
  wire [31:0] ext_a;
  wire [31:0] alu_val;
  wire [31:0] dm_val;
  wire zero;
  wire [31:0] ins;
  wire [31:0]busa,busb,memtoregout;
  wire [4:0]rd;
  wire [4:0]rs,rt,rw;
  wire [15:0] imm;
  
  
  assign busb=(alusrc==1)?ext_a:reg_a;
  assign memtoregout=(memtoreg==1)?dm_val:alu_val;
  assign imm=(aluctr==2'b10)?ins[15:0]:
             (aluctr==2'b11)?ins[15:0]:
              aluctr;
  assign rs=ins[25:21];
  assign rt=ins[20:16];
  assign rd=ins[15:11];
  assign rw=(regdst==1)?rd:rt;

  
  RegFile regfile(clk,reset,memtoregout,regwr,rw,rs,rt,busa,reg_a,jal_ins,npc_sel);
  ALU alu(busa,busb,aluctr,alu_val,zero);
  Extender extender(imm,ext_a,extop);
  dm datamem(reg_a,clk,dm_val,memwr,alu_val[11:2],memtoreg);
  ifu iiffuu(imm,clk,reset,ins,npc_sel,zero,jal_ins);
  ctr control(ins[31:26],ins[5:0],npc_sel,regwr,regdst,extop,aluctr,memwr,memtoreg,alusrc);
  
endmodule
  
