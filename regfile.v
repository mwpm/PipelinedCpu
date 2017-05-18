`include "register32x32bit.v"
`include "mux32xXto1.v"

module regfile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk);
	output [31:0] ReadData1, ReadData2;
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input [31:0] WriteData;
	input RegWrite, clk;
	wire [31:0] reg31, reg30, reg29, reg28, reg27, reg26, reg25, reg24, reg23, reg22, reg21, reg20, reg19, reg18, reg17, reg16, reg15, reg14, reg13, reg12, reg11, reg10, reg9, reg8, reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0;  
		

	register32x32bit regs_dec0({reg31, reg30, reg29, reg28, reg27, reg26, reg25, reg24, reg23, reg22, reg21, reg20, reg19, reg18, reg17, reg16, reg15, reg14, reg13, reg12, reg11, reg10, reg9, reg8, reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0}, RegWrite, WriteRegister, WriteData, clk);
	mux32x32to1 muxs0(ReadData1, {reg31, reg30, reg29, reg28, reg27, reg26, reg25, reg24, reg23, reg22, reg21, reg20, reg19, reg18, reg17, reg16, reg15, reg14, reg13, reg12, reg11, reg10, reg9, reg8, reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0}, ReadRegister1);
	mux32x32to1 muxs1(ReadData2, {reg31, reg30, reg29, reg28, reg27, reg26, reg25, reg24, reg23, reg22, reg21, reg20, reg19, reg18, reg17, reg16, reg15, reg14, reg13, reg12, reg11, reg10, reg9, reg8, reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0}, ReadRegister2);	
		

	/*wire [1023:0] out;
		

	register32x32bit regs_dec0(out, RegWrite, WriteRegister, WriteData, clk);
	mux32x32to1 muxs0(ReadData1, out, ReadRegister1);
	mux32x32to1 muxs1(ReadData2, out, ReadRegister2);	
	*/
endmodule
