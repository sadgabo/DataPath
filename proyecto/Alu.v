`timescale 1ns/1ns
module Alu(input [2:0]sel, input [31:0]op1, input [31:0]op2, output reg zflag, output reg[31:0]Result);
always @*
begin
      case (sel)
3'b001:
begin 
Result = op1+op2;
end
3'b010:
begin 
Result = op1*op2;
end
3'b110:
begin 
Result = op2<<1;
end
3'b100:
begin 
Result = op1-op2;
end
3'b101:
begin 
Result = op1<op2?1:0;
end
3'b111:
begin 
Result = op1&op2;
end
3'b000:
begin 
Result = op1|op2;
end
3'b011:
begin 
Result = op1^op2;
end
    endcase
if(Result==0)
begin
zflag =1'b1;
end
else
begin
zflag =1'b0;
end

end
endmodule
