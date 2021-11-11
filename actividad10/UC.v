`timescale 1ns/1ns

module UC(
    input [5:0]op,
    output reg MemToReg,//C
    output reg Memtowrite,//C
    output reg [2:0]AluOp,//C
    output reg RegWrite//C
);

always @* 
begin
    case(op)
    6'b000000:
    begin
        MemToReg=0;
        Memtowrite=0;
        AluOp=3'b111;
        RegWrite=1;
    end
    endcase

end

endmodule