`timescale 1ns/1ns

module mux21(
    input [31:0]A,
    input [31:0]B,
    input sel,
    output reg[31:0]R//C
    );
    
always @*
begin

    case(sel)
    1'b1:
    begin
        R = A;
    end

    1'b0:
    begin
        R = B;
    end

    endcase

end

endmodule