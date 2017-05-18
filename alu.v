`include "regfile.v"
`include "nor1bit.v"
`include "slt.v"
`include "adder.v"
`include "zerocheck.v"

module alu(Output, CarryOut, zero, overflow, negative, BussA, BussB, ALUControl);
	output [31:0] Output;
	output CarryOut, zero, overflow, negative;
	input [31:0] BussA, BussB;
	input [1:0] ALUControl;
	wire [127:0] w;
	
	parameter delay = 50;

	nor32bit nor0(w[31:0], BussA, BussB);
	slt slt0(w[63:32], overflow, w[95]);
	adder32bit add0(CarryOut, overflow, w[95:64], BussA, BussB, ALUControl[0]);	
	mux32x4to1 mux0(Output, w, ALUControl);
	
	zerocheck zero0(zero, Output);
	assign negative = Output[31];
	
endmodule
