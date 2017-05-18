`include "pc.v"
`include "signex.v"
`include "instrmem.v"

module ifu(instr, pc8, pcOut, branch, jump, jalr, neg, temp, target, pcOld, reset, clk);
	output [31:0] instr, pc8;
	input branch, jalr, neg, reset, clk;
	input [29:0] pcOld, pcOut;
	input [1:0] jump;
	input [31:0] temp;
	input [25:0] target;
	wire [29:0] pcCounter, pc4or8, pcup, result, muxCounter, uporb, borj, SE, pc8hold;
	wire bgez, carryIn;
	parameter delay = 50;	
	
	//not #delay not0(nNeg, neg);
	and #delay and0(bgez, branch, neg);
	
	pc pc0(pcCounter, result, reset, clk);
	mux2to1a muxCarryIn(carryIn, 1'b0, 1'b1, bgez);
	adder30bitcin pcadder0(pcup, pcCounter, muxCounter, carryIn, 1'b0);
	
	signex30 signex0(SE, target[15:0]);
	//mux30x2to1 muxX(pc4or8, {30'd1, 30'd0}, jalr); //PC + 8 or + 4
	mux30x2to1 mux0(muxCounter, {SE, 30'd0}, bgez); 
	adder30bitcin pcadder8(pc8hold, pcCounter, 30'd2, 1'b0, 1'b0);

	//mux30x2to1 mux1(uporb, {pcup[27:0], 2'b00, pcup}, bgez); 
	//mux30x2to1 mux2(borj, {pcCounter[29:26], instr[25:0], uporb}, jump); 

	mux30x4to1 mux1(borj, {30'd0, pcup[29:0], pcOld[29:26], target, pcup}, jump);	//ask about the 4th choice of this mux, currently input is all zeros and output is same as 3rd output?

	mux30x2to1 mux3(result, {temp[31:2], borj}, jalr); 
	assign pc8 = {pc8hold, 2'd0};
	assign pcOut = pcCounter;
	//assign jalren = jalr;
	InstructionMem instrmem0(instr, {pcCounter, 2'd0});
	
	//pc pc8hold0(pc8hold, pcup, reset, clk);
	
endmodule


