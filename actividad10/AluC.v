`timescale 1ns/1ns

module AluC(
    input [5:0]func,
    input [2:0]AluOp,
    output reg[2:0]sel
);

always @*
begin
    case(AluOp)
    3'b111:
    begin
        case(func)
        100000://add
        begin   
            sel=3'b000;
        end
        100100://and
        begin
            sel=3'b101;
        end
        100010://sub
        begin
            sel=3'b001;
        end
        100101://or
        begin
            sel=3'b111;
        end
        101010://SLT
        begin
            sel=3'b010;
        end
        endcase
    end
    endcase
end

endmodule