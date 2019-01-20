module imtest;
  reg [9:0] adr;
  wire [31:0] ins;
  im i(adr,ins);
  
  initial
  begin
    adr=10'b0000000001;
    
    #100
    adr=10'b0000000110;
    
  end
endmodule
