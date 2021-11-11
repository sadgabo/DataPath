module Mem(
    input [31:0]Adress,
    input EWR,//c
    input[31:0]WD,
    output reg [31:0]ReadData//c
);
reg [31:0]mem [0:31];

  
always@*
begin
  if(EWR==1'b1)
    begin 
        mem[Adress]=WD;
    end
  else
    begin
      ReadData=mem[Adress];
    end
end


endmodule 