`timescale 1ns/1ns

module datapath(
    input [31:0]intTr,
    output TR_ZF
);


//unidad de control
wire c_MemToReg,c_MemToWrite,c_RegWrite;
wire [2:0]c_AluOp;

//Banco de registros
wire [31:0]c_ReadData1;
wire [31:0]c_ReadData2;

//Alu Control
wire [2:0]c_Sel;

//Alu
wire [31:0]c_res;

//Memoria
wire c_EWR;
wire [31:0]c_ReadData;

//Mux21
wire [31:0]c_R;

UC UC_1(
    .op(intTr[31:26]),   
    .RegWrite(c_RegWrite),
    .Memtowrite(c_MemToWrite),
    .MemToReg(c_MemToReg),
    .AluOp(c_AluOp)
);

BR BR_1(
    .ReadRegister1(intTr[25:21]),
    .ReadRegister2(intTr[20:16]),
    .WriteRegister(intTr[15:11]),
    .RegEn(c_RegWrite), 
    .ReadData1(c_ReadData1),
    .ReadData2(c_ReadData2),
    .WriteData(c_R)
);

AluC AluC_1(
    .func(intTr[5:0]),
    .AluOp(c_AluOp),
    .sel(c_Sel)
);

Alu Alu_1(
    .op1(c_ReadData1),
    .op2(c_ReadData2),
    .sel(c_Sel),
    .zeroflag(TR_zf),
    .res(c_res)
);

Mem Mem_1(
    .Adress(c_res),
    .WD(c_ReadData2),
    .EWR(c_MemToWrite),
    .ReadData(c_ReadData)
);

mux21 mux21_1(
    .A(c_ReadData),
    .B(c_res),
    .sel(c_MemToReg),
    .R(c_R)
);

endmodule