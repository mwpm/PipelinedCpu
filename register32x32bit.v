`include "register32bit.v"
`include "Decoder5to32.v"

module register32x32bit(Q, RegWrite, WriteRegister, WriteData, clk);
	output [1023:0] Q;
	input [31:0] WriteData;
	input RegWrite, clk;
	input [4:0] WriteRegister;
	wire [31:0] w;

	Decoder5to32 dec0(w, WriteRegister, RegWrite);
	
	register32bit reg0(Q[31:0], WriteData, 1'b1, clk, w[0]);
	register32bit reg1(Q[63:32], WriteData, 1'b0, clk, w[1]);
	register32bit reg2(Q[95:64], WriteData, 1'b0, clk, w[2]);
	register32bit reg3(Q[127:96], WriteData, 1'b0, clk, w[3]);
	register32bit reg4(Q[159:128], WriteData, 1'b0, clk, w[4]);
	register32bit reg5(Q[191:160], WriteData, 1'b0, clk, w[5]);
	register32bit reg6(Q[223:192], WriteData, 1'b0, clk, w[6]);
	register32bit reg7(Q[255:224], WriteData, 1'b0, clk, w[7]);
	register32bit reg8(Q[287:256], WriteData, 1'b0, clk, w[8]);
	register32bit reg9(Q[319:288], WriteData, 1'b0, clk, w[9]);
	register32bit reg10(Q[351:320], WriteData, 1'b0, clk, w[10]);
	register32bit reg11(Q[383:352], WriteData, 1'b0, clk, w[11]);
	register32bit reg12(Q[415:384], WriteData, 1'b0, clk, w[12]);
	register32bit reg13(Q[447:416], WriteData, 1'b0, clk, w[13]);
	register32bit reg14(Q[479:448], WriteData, 1'b0, clk, w[14]);
	register32bit reg15(Q[511:480], WriteData, 1'b0, clk, w[15]);
	register32bit reg16(Q[543:512], WriteData, 1'b0, clk, w[16]);
	register32bit reg17(Q[575:544], WriteData, 1'b0, clk, w[17]);
	register32bit reg18(Q[607:576], WriteData, 1'b0, clk, w[18]);
	register32bit reg19(Q[639:608], WriteData, 1'b0, clk, w[19]);
	register32bit reg20(Q[671:640], WriteData, 1'b0, clk, w[20]);
	register32bit reg21(Q[703:672], WriteData, 1'b0, clk, w[21]);
	register32bit reg22(Q[735:704], WriteData, 1'b0, clk, w[22]);
	register32bit reg23(Q[767:736], WriteData, 1'b0, clk, w[23]);
	register32bit reg24(Q[799:768], WriteData, 1'b0, clk, w[24]);
	register32bit reg25(Q[831:800], WriteData, 1'b0, clk, w[25]);
	register32bit reg26(Q[863:832], WriteData, 1'b0, clk, w[26]);
	register32bit reg27(Q[895:864], WriteData, 1'b0, clk, w[27]);
	register32bit reg28(Q[927:896], WriteData, 1'b0, clk, w[28]);
	register32bit reg29(Q[959:928], WriteData, 1'b0, clk, w[29]);
	register32bit reg30(Q[991:960], WriteData, 1'b0, clk, w[30]);
	register32bit reg31(Q[1023:992], WriteData, 1'b0, clk, w[31]);


endmodule
