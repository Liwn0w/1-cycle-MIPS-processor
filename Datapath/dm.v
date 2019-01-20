module dm(datain,clk,dataout,memwr,addr,memtoreg);
  //data that needs to be saved
  input [31:0] datain;
  //The clock, and controlsignals
  input clk,memwr,memtoreg;
  //address of the register for memory to be put in or taken from
  input [9:0] addr;
  //the data from the memory
  output[31:0] dataout;
  
  //created a register with 1024 fields and 32 bits space in each
  reg [31:0]memory [1023:0];
  //integer used in for loop
  integer i;
  
  //if control signal from memtoreg (to save value to regFile) is 1,
  //then set the value from the address as output else output 0.
  assign dataout=(memtoreg==1)?memory[addr]:0;
  
  //Everytime clock becomes 1, it saves data if it get a control signal
  //to save in memory
  always@(posedge clk)
  begin
    if(memwr)
      memory[addr]=datain;
  end
endmodule

    
  
  
  


