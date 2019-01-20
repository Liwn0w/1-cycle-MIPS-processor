module im(adr,ins);
  //10 bit address of instruction to be fetched
  input [9:0] adr;
  //the instruction
  output [31:0] ins;
  //the register of instructions
  reg [31:0]ins_memory[1023:0];
  //save instructions in array
  initial
   $readmemh("code.txt",ins_memory);
   assign ins=ins_memory[adr];
endmodule


