module npctest;
  reg[25:0]taraddr;
  wire[29:0]newpc;
  reg[15:0]imm;
  reg[1:0]npc_sel;
  reg zero;
  reg[29:0]pcout;
  npc n(taraddr,pcout,imm,npc_sel,zero,newpc);
  
  initial
  begin
    //since npe_sel is 00, it should just go one down, pcout+1
    taraddr=26'b11111111111101111111111111;
    imm=16'h1234;
    npc_sel=2'b00;
    zero=0;
    pcout=30'b111111111111111111111111111110;
    
    //similarly it should just go one down (since zero is 0), pcout + 1
    #100
    taraddr=26'b11111111111111111111111111;
    imm=16'h1234;
    npc_sel=2'b01;
    zero=0;
    pcout=30'b111111111111111111111111111110;
    
    //jump to 4 bits of pcout +1 + taraddress 
    #100
    taraddr=26'b11111111111001111111111111;
    imm=16'h1234;
    npc_sel=2'b11;
    zero=0;
    pcout=30'b111111111111111111111111111110;
    
    //go one down
    #100
    taraddr=26'b11111111111111111111111111;
    imm=16'h1234;
    npc_sel=2'b00;
    zero=1;
    pcout=30'b111111111111111111111111111100;
    
    //jump x instructions down, where x is an immediate
    #100
    taraddr=26'b11111111111111111111111111;
    imm=16'h1234;
    npc_sel=2'b01;
    zero=1;
    pcout=30'b000011111111111111111111111111;
    
    //jump to 4 bits of pcout+1+ taraddress
    #100
    taraddr=26'b11100111111111111111100111;
    imm=16'h1234;
    npc_sel=2'b11;
    zero=1;
    pcout=30'b111111111111111111111111111111;
  end
endmodule

  

