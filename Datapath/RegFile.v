module RegFile(clk,reset,busw,regwr,rw,ra,rb,busa,busb,jal_ins,npc_sel);
  //data from as either ALU calculation or from DM
  input [31:0] busw;
  input clk,regwr,reset;
  //rw = rt (second operand value from Mips instruction - R format, or
  // rw = rd
  // rb = rd (destination for/of value from R-format instruction
  //ra = rs (first operand value)
  input [4:0] rw,ra,rb;
  //temporary address of instruction from npc
  input [29:0] jal_ins;
  //outputs to be sent to ALU for calculation or DM for saving
  output [31:0] busa,busb;
  //operation from npc_sel, to know if npc is doing a jump
  input [1:0] npc_sel;
  //unnecesary wire to DM
  wire t1;
  //register for temp data
  reg [31:0]temp [31:0];
  integer i;
  
  //get the values from register
  assign busa=temp[ra];
  assign busb=temp[rb];
  
  //send the instruction address from after jump instruction to DM
  assign t1={{jal_ins},{2'b00}};
  
  always@(posedge clk,posedge reset)
  begin
    if(reset)
      //if reset then set all cells to 0
      for(i=0;i<32;i=i+1)
      temp[i]=0;
    else
      //if control signal register write is one, and rw isn't 0, meaning
      // the instruction isn't I-format
      if(regwr && rw!=0)
        temp[rw]=busw;
  end
  
  always@(*)
  begin
    //sends the instruction address (after j address) to DM, for JAL instruction
  if(npc_sel==2'b11)
      temp[31]=t1;
  end
    
endmodule


