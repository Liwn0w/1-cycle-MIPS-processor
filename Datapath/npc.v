module npc(taraddr,pcout,imm,npc_sel,zero,newpc,jal_ins);
  input [29:0] pcout;
  input [15:0] imm;
  input zero;
  input [1:0] npc_sel;
  //the target address
  input [25:0] taraddr;
  output [29:0] newpc;
  //next address after a jump
  output [29:0] jal_ins;
  wire [29:0] temp1,temp2,temp3,temp4;
  
  //wire to the 0 at the MUX in diagram, is PC value + 1 (as each cell holds 32 bits),
  //When the PC goes one instruction down
  assign temp1=pcout+1;
  //Wire to the 1 at the MUX in diagram
  //the immediate is the offset
  //The immediate extended by signextension
  assign temp2={{14{imm[15]}},imm};
  //PC +1 + offset immediate
  assign temp3=temp1+temp2;
  //jump to target address
  assign temp4={temp1[29:26],taraddr};
  //address after JAL to be sent to RegFile and DM
  assign jal_ins=temp4+1;
  
  //output of the npc
  //BEQ
  //if npc_sel i 01 and zero is 1, then jump to new position
  assign newpc=(npc_sel==2'b01 && zero==1)?temp3:
                //if npc_sel is 00, then just go one position down
               (npc_sel==2'b00)?temp1:
                //if npc_sel is 01 and zero = 0, then just go one position down               
               (npc_sel==2'b01 && zero==0)?temp1:
               //J
               //if npc_sel is 10 or 11 jump to target address
               (npc_sel==2'b10)?temp4:
               (npc_sel==2'b11)?temp4:
                npc_sel;

endmodule

