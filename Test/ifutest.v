module ifutest;
  reg clk,reset;
  wire [31:0] ins;
  reg[1:0] npc_sel;
  reg zero;
  ifu iiffuu(clk,reset,ins,npc_sel,zero);
    initial
    begin
      clk=0;
      reset=0;
      
      //go one instruction down
      #100
      reset=1;
      zero=0;
      npc_sel=2'b00;
      
      //go one instruction down
      #100
      reset=1;
      zero=0;
      npc_sel=2'b01;
      
      //jump to 4 bits of pcout+1 + taraddress + 00
      #100
      reset=1;
      zero=0;
      npc_sel=2'b10;
      
      //go one down
      #100
      reset=1;
      zero=1;
      npc_sel=2'b00;
      
      //beq immediate address
      #100
      reset=1;
      zero=1;
      npc_sel=2'b01;
      
      //jump to pcout+1+taraddress
      #100
      reset=1;
      zero=1;
      npc_sel=2'b10;
      
      #100
      reset=0;
      zero=0;
      npc_sel=2'b00;
      
      #100
      reset=0;
      zero=0;
      npc_sel=2'b01;
      
      #100
      reset=0;
      zero=0;
      npc_sel=2'b10;
      
      #100
      reset=0;
      zero=1;
      npc_sel=2'b00;
      
      #100
      reset=0;
      zero=1;
      npc_sel=2'b01;
      
      #100
      reset=0;
      zero=1;
      npc_sel=2'b10;
    end
  endmodule
  
      

