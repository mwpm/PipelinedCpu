`include "ifu.v"
`include "datamem.v"
`include "FU.v"

module datapath(temp, negA, instr, pc8, RegDst, ALUSrc, MemToReg, RegWr, MemWr, ALUCntrl, jalren, clk, reset);
	output [31:0] temp;
	output negA;
	input [31:0] instr, pc8;
	input RegDst, MemToReg, RegWr, MemWr, jalren, clk, reset;
	input [1:0] ALUSrc, ALUCntrl;
	wire [31:0] ReadData1, ReadData2, aluresult, WriteData, memORreg, memORreg1, db, SE, dataout, Ds, Dt, SEOut;	
	wire [4:0] WriteRegister, WriteRegister1;
	wire [104:0] out2; 
	wire [100:0] out3; 
	wire [66:0] out4;
	//pipeline2
	wire [31:0] instrOutP2, pc8OutP2, rsDSelectOutP2, rtDSelectOutP2;
	wire [4:0] AwOutP2;
	wire [1:0] ALUSrcOutP2, ALUCntrlOutP2, rsDSelect, rtDSelect;
	wire RegDstOutP2, MemToRegOutP2, RegWrOutP2, MemWrOutP2, jalrenOutP2;

	//pipeline3 
	wire [31:0] instrOutP3, pc8OutP3, aluresultOutP3, rtDSelectOutP3;
	wire [4:0] AwOutP3;
	wire RegDstOutP3, MemToRegOutP3, RegWrOutP3, MemWrOutP3, jalrenOutP3;

	//pipeline4
	wire [31:0] instrOutP4, pc8OutP4, memOutP4, aluresultOutP4;
	wire [4:0] AwOutP4;
	wire RegDstOutP4, MemToRegOutP4, RegWrOutP4, jalrenOutP4;

	parameter delay = 50;

	not #delay not0(nclk, clk);

	FU fu0(rsDSelect, rtDSelect, instr[25:21], instr[20:16], AwOutP2, AwOutP3, RegWrOutP2, RegWrOutP3);
	
	//mux5x2to1 muxDst(WriteRegister, {instrOutP4[15:11], instrOutP4[20:16]}, RegDstOutP4);
	mux5x2to1 muxDst1(WriteRegister1, {instr[15:11], instr[20:16]},RegDst); //find out which adress is being written too
	mux32x2to1 muxDataWr(WriteData, {pc8OutP4, memORreg}, jalrenOutP4); 
	regfile reg0(ReadData1, ReadData2, WriteData, instr[25:21], instr[20:16], AwOutP4, RegWrOutP4, nclk);
	signex32 signex0(SE, instr[15:0]);
	not #delay not1(negA, Ds[31]);
	
	mux32x4to1 muxfowardRS(Ds, {32'd0, memORreg1, aluresult, ReadData1}, rsDSelect);
	mux32x4to1 muxfowardRT(Dt, {32'd0, memORreg1, aluresult, ReadData2}, rtDSelect);

	pipeline2 pip0(
			instrOutP2, 
			pc8OutP2, 
			rsDSelectOutP2, 
			rtDSelectOutP2, 
			SEOut, 
			ALUSrcOutP2, 
			ALUCntrlOutP2, 
			AwOutP2, 
			RegDstOutP2, 
			MemToRegOutP2, 
			RegWrOutP2, 
			MemWrOutP2, 
			jalrenOutP2,
	 instr, pc8, Ds, Dt, SE, ALUSrc, ALUCntrl, WriteRegister1, RegDst, MemToReg, RegWr, MemWr, jalren, reset, clk, 1'b1);	
	
	assign temp = Ds;

	//signex32 signex0(SE, instr[15:0]);
	mux32x4to1 muxaluDb(db, {32'd0, 32'd0, SEOut, rtDSelectOutP2}, ALUSrcOutP2);
	alu alu0(aluresult, CarryOut, zero, overflow, neg, rsDSelectOutP2, db, ALUCntrlOutP2);
	
	//pipeline3 pip1(out3, {instr, aluresult, out2[40:9], out2[8], out2[5], out2[4], out2[3], out2[0]}, reset, clk, 1'b1);
	pipeline3 pip1(instrOutP3, pc8OutP3, aluresultOutP3, rtDSelectOutP3, AwOutP3, RegDstOutP3, MemToRegOutP3, RegWrOutP3, MemWrOutP3, jalrenOutP3,
	 instrOutP2, pc8OutP2, aluresult, rtDSelectOutP2, AwOutP2, RegDstOutP2, MemToRegOutP2, RegWrOutP2, MemWrOutP2, jalrenOutP2, reset, clk, 1'b1);

	dataMem datamem0(dataout, aluresultOutP3, rtDSelectOutP3, MemWrOutP3, clk);
	mux32x2to1 muxmem2reg1(memORreg1, {dataout, aluresultOutP3}, MemToRegOutP3);

	//pipeline4 pip2(out4, {instr, memORreg, out3[4], out3[2], out3[0]}, reset, clk, 1'b1);
	pipeline4 pip2(instrOutP4, pc8OutP4, memOutP4, aluresultOutP4, AwOutP4, RegDstOutP4, MemToRegOutP4, RegWrOutP4, jalrenOutP4,
 	instrOutP3, pc8OutP3, dataout, aluresultOutP3, AwOutP3, RegDstOutP3, MemToRegOutP3, RegWrOutP3, jalrenOutP3, reset, clk, 1'b1);

	mux32x2to1 muxmem2reg(memORreg, {memOutP4, aluresultOutP4}, MemToRegOutP4);

endmodule
//
//******** ADD DW in pipeline 2 and 3 and 4. Need to decided which Data to pick (right now only have right adress to compare). 
//


module pipeline2(instrOut, pc8Out, rsDSelectOut, rtDSelectOut, SEOut, ALUSrcOut, ALUCntrlOut, AwOut, RegDstOut, MemToRegOut, RegWrOut, MemWrOut, jalrenOut,
 instr, pc8, rsDSelect, rtDSelect, SE, ALUSrc, ALUCntrl, Aw, RegDst, MemToReg, RegWr, MemWr, jalren, reset, clk, sel);

	output [31:0] instrOut, pc8Out, rsDSelectOut, rtDSelectOut, SEOut;
	output [4:0] AwOut;
	output [1:0] ALUSrcOut, ALUCntrlOut;
	output RegDstOut, MemToRegOut, RegWrOut, MemWrOut, jalrenOut;
	input [31:0] instr, pc8, rsDSelect, rtDSelect, SE;
	input [4:0] Aw;
	input [1:0] ALUSrc, ALUCntrl;
	input RegDst, MemToReg, RegWr, MemWr, jalren, reset, clk, sel;
	//input order {read1, read2, control}

	register32bit reg0(instrOut, instr, reset, clk, sel);
	register32bit reg1(pc8Out, pc8, reset, clk, sel);
	register32bit reg2(rsDSelectOut, rsDSelect, reset, clk, sel);
	register32bit reg3(rtDSelectOut, rtDSelect, reset, clk, sel);
	register32bit reg13(SEOut, SE, reset, clk, sel);
	register2bit reg4(ALUSrcOut, ALUSrc, reset, clk, sel);
	register2bit reg5(ALUCntrlOut, ALUCntrl, reset, clk, sel);
	register1bit reg6(RegDstOut, RegDst, reset, clk, sel);
	register1bit reg7(MemToRegOut, MemToReg, reset, clk, sel);
	register1bit reg8(RegWrOut, RegWr, reset, clk, sel);
	register1bit reg9(MemWrOut, MemWr, reset, clk, sel);
	register1bit reg10(jalrenOut, jalren, reset, clk, sel);

	register4bit reg11(AwOut[3:0], Aw[3:0], reset, clk, sel);
	register1bit reg12(AwOut[4], Aw[4], reset, clk, sel);

endmodule

module pipeline3(instrOut, pc8Out, aluresultOut, rtDSelectOut, AwOut, RegDstOut, MemToRegOut, RegWrOut, MemWrOut, jalrenOut,
 instr, pc8, aluresult, rtDSelect, Aw, RegDst, MemToReg, RegWr, MemWr, jalren, reset, clk, sel);

	output [31:0] instrOut, pc8Out, aluresultOut, rtDSelectOut;
	output [4:0] AwOut;
	output RegDstOut, MemToRegOut, RegWrOut, MemWrOut, jalrenOut;
	input [31:0] instr, pc8, aluresult, rtDSelect;
	input [4:0] Aw;
	input RegDst, MemToReg, RegWr, MemWr, jalren, reset, clk, sel;
	
	//input order {aluout, read2, control}

	register32bit reg0(instrOut, instr, reset, clk, sel);
	register32bit reg1(pc8Out, pc8, reset, clk, sel);
	register32bit reg2(rtDSelectOut, rtDSelect, reset, clk, sel);
	register32bit reg3(aluresultOut, aluresult, reset, clk, sel);
	
	register1bit reg6(RegDstOut, RegDst, reset, clk, sel);
	register1bit reg7(MemToRegOut, MemToReg, reset, clk, sel);
	register1bit reg8(RegWrOut, RegWr, reset, clk, sel);
	register1bit reg9(MemWrOut, MemWr, reset, clk, sel);
	register1bit reg10(jalrenOut, jalren, reset, clk, sel);

	register4bit reg11(AwOut[3:0], Aw[3:0], reset, clk, sel);
	register1bit reg12(AwOut[4], Aw[4], reset, clk, sel);

endmodule

module pipeline4(instrOut, pc8Out, memOut, dataOut, AwOut, RegDstOut, MemToRegOut, RegWrOut, jalrenOut,
 instr, pc8, mem, data, Aw, RegDst, MemToReg, RegWr, jalren, reset, clk, sel);

	output [31:0] instrOut, pc8Out, memOut, dataOut;
	output [4:0] AwOut;
	output RegDstOut, MemToRegOut, RegWrOut, jalrenOut;
	input [31:0] instr, pc8, mem, data;
	input [4:0] Aw;
	input RegDst, MemToReg, RegWr, jalren, reset, clk, sel;
	
	//input order {read1, read2, control}

	register32bit reg0(instrOut, instr, reset, clk, sel);
	register32bit reg1(pc8Out, pc8, reset, clk, sel);
	register32bit reg2(memOut, mem, reset, clk, sel);
	register32bit reg3(dataOut, data, reset, clk, sel);
	register1bit reg6(RegDstOut, RegDst, reset, clk, sel);
	register1bit reg7(MemToRegOut, MemToReg, reset, clk, sel);
	register1bit reg8(RegWrOut, RegWr, reset, clk, sel);
	register1bit reg10(jalrenOut, jalren, reset, clk, sel);

	register4bit reg11(AwOut[3:0], Aw[3:0], reset, clk, sel);
	register1bit reg12(AwOut[4], Aw[4], reset, clk, sel);

endmodule

