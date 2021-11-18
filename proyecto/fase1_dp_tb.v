`timescale 1ns/1ns
module fase1_dp_tb();
reg clk;

Fase1 instancia(
	.clk(clk)
);
	initial 
	begin
	forever begin
	clk=0;
	#50 clk = ~clk;
	end 
end
endmodule