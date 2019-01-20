module pc(clk,reset,newpc,pcout);
  //clock and reset input
  input clk,reset;
  // address of instruction npc points at
  input [29:0] newpc;
  //output that partly goes to npc
  //first ten bits go to IM, ass address of instructions are only 10 bits
  output [29:0] pcout;
  //register the address of the instruction for PC
  reg [29:0] temp;
  
  //pc out is 0, if reset is 1, else pcout is the input address from npc
  assign pcout=temp;
  always@(posedge clk,posedge reset)
  begin
    if(reset)
      temp=0;
    else
      temp=newpc;
      
  end
endmodule


