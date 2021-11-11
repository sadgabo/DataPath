`timescale 1ns/1ns

module BR(
    input [4:0]ReadRegister1,
    input [4:0]ReadRegister2,
    input [4:0]WriteRegister,
    input RegEn,
    input [31:0]WriteData,
    output reg[31:0]ReadData1,//C
    output reg[31:0]ReadData2//C
);

reg [31:0]BR[0:310];

always @*
begin
    if(RegEn)
        begin
            BR[WriteRegister]=WriteData;
        end
    ReadData1=BR[ReadRegister1];
    ReadData2=BR[ReadRegister2];
end
initial 
begin
  $readmemb("Data.mem",BR);
end
endmodule
