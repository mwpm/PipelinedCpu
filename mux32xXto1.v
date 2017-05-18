`include "mux32to1.v"

module mux5x2to1(out, in, sel);
	output [4:0] out;
	input [9:0] in;
	input sel;

	wire [9:0] w;

	assign w[1:0] = {in[5], in[0]};
	assign w[3:2] = {in[6], in[1]};
	assign w[5:4] = {in[7], in[2]};
	assign w[7:6] = {in[8], in[3]};
	assign w[9:8] = {in[9], in[4]};
	
	mux2too1 mux0(out[0], w[1:0], sel);	
	mux2too1 mux1(out[1], w[3:2], sel);	
	mux2too1 mux2(out[2], w[5:4], sel);	
	mux2too1 mux3(out[3], w[7:6], sel);	
	mux2too1 mux4(out[4], w[9:8], sel);

endmodule


module mux30x2to1(out, in, sel);
	output [29:0] out;
	input [59:0] in;
	input sel;

	wire [59:0] w;

	assign w[1:0] = {in[30], in[0]};
	assign w[3:2] = {in[31], in[1]};
	assign w[5:4] = {in[32], in[2]};
	assign w[7:6] = {in[33], in[3]};
	assign w[9:8] = {in[34], in[4]};
	assign w[11:10] = {in[35], in[5]};
	assign w[13:12] = {in[36], in[6]};
	assign w[15:14] = {in[37], in[7]};
	assign w[17:16] = {in[38], in[8]};
	assign w[19:18] = {in[39], in[9]};
	assign w[21:20] = {in[40], in[10]};
	assign w[23:22] = {in[41], in[11]};
	assign w[25:24] = {in[42], in[12]};
	assign w[27:26] = {in[43], in[13]};
	assign w[29:28] = {in[44], in[14]};
	assign w[31:30] = {in[45], in[15]};
	assign w[33:32] = {in[46], in[16]};
	assign w[35:34] = {in[47], in[17]};
	assign w[37:36] = {in[48], in[18]};
	assign w[39:38] = {in[49], in[19]};
	assign w[41:40] = {in[50], in[20]};
	assign w[43:42] = {in[51], in[21]};
	assign w[45:44] = {in[52], in[22]};
	assign w[47:46] = {in[53], in[23]};
	assign w[49:48] = {in[54], in[24]};
	assign w[51:50] = {in[55], in[25]};
	assign w[53:52] = {in[56], in[26]};
	assign w[55:54] = {in[57], in[27]};
	assign w[57:56] = {in[58], in[28]};
	assign w[59:58] = {in[59], in[29]};

	mux2too1 mux0(out[0], w[1:0], sel);	
	mux2too1 mux1(out[1], w[3:2], sel);	
	mux2too1 mux2(out[2], w[5:4], sel);	
	mux2too1 mux3(out[3], w[7:6], sel);	
	mux2too1 mux4(out[4], w[9:8], sel);	
	mux2too1 mux5(out[5], w[11:10], sel);	
	mux2too1 mux7(out[6], w[13:12], sel);	
	mux2too1 mux8(out[7], w[15:14], sel);
	mux2too1 mux9(out[8], w[17:16], sel);
	mux2too1 mux10(out[9], w[19:18], sel);
	mux2too1 mux11(out[10], w[21:20], sel);
	mux2too1 mux12(out[11], w[23:22], sel);
	mux2too1 mux13(out[12], w[25:24], sel);
	mux2too1 mux14(out[13], w[27:26], sel);
	mux2too1 mux15(out[14], w[29:28], sel);
	mux2too1 mux16(out[15], w[31:30], sel);
	mux2too1 mux17(out[16], w[33:32], sel);
	mux2too1 mux18(out[17], w[35:34], sel);
	mux2too1 mux19(out[18], w[37:36], sel);
	mux2too1 mux20(out[19], w[39:38], sel);
	mux2too1 mux21(out[20], w[41:40], sel);	
	mux2too1 mux22(out[21], w[43:42], sel);
	mux2too1 mux23(out[22], w[45:44], sel);
	mux2too1 mux24(out[23], w[47:46], sel);
	mux2too1 mux25(out[24], w[49:48], sel);
	mux2too1 mux26(out[25], w[51:50], sel);
	mux2too1 mux27(out[26], w[53:52], sel);
	mux2too1 mux28(out[27], w[55:54], sel);
	mux2too1 mux29(out[28], w[57:56], sel);
	mux2too1 mux30(out[29], w[59:58], sel);


endmodule


module mux32x2to1(out, in, sel);
	output [31:0] out;
	input [63:0] in;
	input sel;

	wire [63:0] w;

	assign w[1:0] = {in[32], in[0]};
	assign w[3:2] = {in[33], in[1]};
	assign w[5:4] = {in[34], in[2]};
	assign w[7:6] = {in[35], in[3]};
	assign w[9:8] = {in[36], in[4]};
	assign w[11:10] = {in[37], in[5]};
	assign w[13:12] = {in[38], in[6]};
	assign w[15:14] = {in[39], in[7]};
	assign w[17:16] = {in[40], in[8]};
	assign w[19:18] = {in[41], in[9]};
	assign w[21:20] = {in[42], in[10]};
	assign w[23:22] = {in[43], in[11]};
	assign w[25:24] = {in[44], in[12]};
	assign w[27:26] = {in[45], in[13]};
	assign w[29:28] = {in[46], in[14]};
	assign w[31:30] = {in[47], in[15]};
	assign w[33:32] = {in[48], in[16]};
	assign w[35:34] = {in[49], in[17]};
	assign w[37:36] = {in[50], in[18]};
	assign w[39:38] = {in[51], in[19]};
	assign w[41:40] = {in[52], in[20]};
	assign w[43:42] = {in[53], in[21]};
	assign w[45:44] = {in[54], in[22]};
	assign w[47:46] = {in[55], in[23]};
	assign w[49:48] = {in[56], in[24]};
	assign w[51:50] = {in[57], in[25]};
	assign w[53:52] = {in[58], in[26]};
	assign w[55:54] = {in[59], in[27]};
	assign w[57:56] = {in[60], in[28]};
	assign w[59:58] = {in[61], in[29]};
	assign w[61:60] = {in[62], in[30]};
	assign w[63:62] = {in[63], in[31]};

	mux2too1 mux0(out[0], w[1:0], sel);	
	mux2too1 mux1(out[1], w[3:2], sel);	
	mux2too1 mux2(out[2], w[5:4], sel);	
	mux2too1 mux3(out[3], w[7:6], sel);	
	mux2too1 mux4(out[4], w[9:8], sel);	
	mux2too1 mux5(out[5], w[11:10], sel);	
	mux2too1 mux7(out[6], w[13:12], sel);	
	mux2too1 mux8(out[7], w[15:14], sel);
	mux2too1 mux9(out[8], w[17:16], sel);
	mux2too1 mux10(out[9], w[19:18], sel);
	mux2too1 mux11(out[10], w[21:20], sel);
	mux2too1 mux12(out[11], w[23:22], sel);
	mux2too1 mux13(out[12], w[25:24], sel);
	mux2too1 mux14(out[13], w[27:26], sel);
	mux2too1 mux15(out[14], w[29:28], sel);
	mux2too1 mux16(out[15], w[31:30], sel);
	mux2too1 mux17(out[16], w[33:32], sel);
	mux2too1 mux18(out[17], w[35:34], sel);
	mux2too1 mux19(out[18], w[37:36], sel);
	mux2too1 mux20(out[19], w[39:38], sel);
	mux2too1 mux21(out[20], w[41:40], sel);	
	mux2too1 mux22(out[21], w[43:42], sel);
	mux2too1 mux23(out[22], w[45:44], sel);
	mux2too1 mux24(out[23], w[47:46], sel);
	mux2too1 mux25(out[24], w[49:48], sel);
	mux2too1 mux26(out[25], w[51:50], sel);
	mux2too1 mux27(out[26], w[53:52], sel);
	mux2too1 mux28(out[27], w[55:54], sel);
	mux2too1 mux29(out[28], w[57:56], sel);
	mux2too1 mux30(out[29], w[59:58], sel);
	mux2too1 mux31(out[30], w[61:60], sel);
	mux2too1 mux32(out[31], w[63:62], sel); //skiped mux6


endmodule

module mux30x4to1(out, in, ALUControl);
	output [29:0] out;
	input [119:0] in;
	input [1:0] ALUControl;

	wire [119:0] w;

	assign w[3:0] = {in[60], in[60], in[30], in[0]};
	assign w[7:4] = {in[61], in[61], in[31], in[1]};
	assign w[11:8] = {in[62], in[62], in[32], in[2]};
	assign w[15:12] = {in[63], in[63], in[33], in[3]};
	assign w[19:16] = {in[64], in[64], in[34], in[4]};
	assign w[23:20] = {in[65], in[65], in[35], in[5]};
	assign w[27:24] = {in[66], in[66], in[36], in[6]};
	assign w[31:28] = {in[67], in[67], in[37], in[7]};
	assign w[35:32] = {in[68], in[68], in[38], in[8]};
	assign w[39:36] = {in[69], in[69], in[39], in[9]};
	assign w[43:40] = {in[70], in[70], in[40], in[10]};
	assign w[47:44] = {in[71], in[71], in[41], in[11]};
	assign w[51:48] = {in[72], in[72], in[42], in[12]};
	assign w[55:52] = {in[73], in[73], in[43], in[13]};
	assign w[59:56] = {in[74], in[74], in[44], in[14]};
	assign w[63:60] = {in[75], in[75], in[45], in[15]};
	assign w[67:64] = {in[76], in[76], in[46], in[16]};
	assign w[71:68] = {in[77], in[77], in[47], in[17]};
	assign w[75:72] = {in[78], in[78], in[48], in[18]};
	assign w[79:76] = {in[79], in[79], in[49], in[19]};
	assign w[83:80] = {in[80], in[80], in[50], in[20]};
	assign w[87:84] = {in[81], in[81], in[51], in[21]};
	assign w[91:88] = {in[82], in[82], in[52], in[22]};
	assign w[95:92] = {in[83], in[83], in[53], in[23]};
	assign w[99:96] = {in[84], in[84], in[54], in[24]};
	assign w[103:100] = {in[85], in[85], in[55], in[25]};
	assign w[107:104] = {in[86], in[86], in[56], in[26]};
	assign w[111:108] = {in[87], in[87], in[57], in[27]};
	assign w[115:112] = {in[88], in[88], in[58], in[28]};
	assign w[119:116] = {in[89], in[89], in[59], in[29]};

	mux4to1 mux0(out[0], w[3:0], ALUControl);	
	mux4to1 mux1(out[1], w[7:4], ALUControl);	
	mux4to1 mux2(out[2], w[11:8], ALUControl);	
	mux4to1 mux3(out[3], w[15:12], ALUControl);	
	mux4to1 mux4(out[4], w[19:16], ALUControl);	
	mux4to1 mux5(out[5], w[23:20], ALUControl);	
	mux4to1 mux7(out[6], w[27:24], ALUControl);	
	mux4to1 mux8(out[7], w[31:28], ALUControl);
	mux4to1 mux9(out[8], w[35:32], ALUControl);
	mux4to1 mux10(out[9], w[39:36], ALUControl);
	mux4to1 mux11(out[10], w[43:40], ALUControl);
	mux4to1 mux12(out[11], w[47:44], ALUControl);
	mux4to1 mux13(out[12], w[51:48], ALUControl);
	mux4to1 mux14(out[13], w[55:52], ALUControl);
	mux4to1 mux15(out[14], w[59:56], ALUControl);
	mux4to1 mux16(out[15], w[63:60], ALUControl);
	mux4to1 mux17(out[16], w[67:64], ALUControl);
	mux4to1 mux18(out[17], w[71:68], ALUControl);
	mux4to1 mux19(out[18], w[75:72], ALUControl);
	mux4to1 mux20(out[19], w[79:76], ALUControl);
	mux4to1 mux21(out[20], w[83:80], ALUControl);	
	mux4to1 mux22(out[21], w[87:84], ALUControl);
	mux4to1 mux23(out[22], w[91:88], ALUControl);
	mux4to1 mux24(out[23], w[95:92], ALUControl);
	mux4to1 mux25(out[24], w[99:96], ALUControl);
	mux4to1 mux26(out[25], w[103:100], ALUControl);
	mux4to1 mux27(out[26], w[107:104], ALUControl);
	mux4to1 mux28(out[27], w[111:108], ALUControl);
	mux4to1 mux29(out[28], w[115:112], ALUControl);
	mux4to1 mux30(out[29], w[119:116], ALUControl);


endmodule

module mux32x4to1(out, in, ALUControl);
	output [31:0] out;
	input [127:0] in;
	input [1:0] ALUControl;

	wire [127:0] w;

	assign w[3:0] = {in[64], in[64], in[32], in[0]};
	assign w[7:4] = {in[65], in[65], in[33], in[1]};
	assign w[11:8] = {in[66], in[66], in[34], in[2]};
	assign w[15:12] = {in[67], in[67], in[35], in[3]};
	assign w[19:16] = {in[68], in[68], in[36], in[4]};
	assign w[23:20] = {in[69], in[69], in[37], in[5]};
	assign w[27:24] = {in[70], in[70], in[38], in[6]};
	assign w[31:28] = {in[71], in[71], in[39], in[7]};
	assign w[35:32] = {in[72], in[72], in[40], in[8]};
	assign w[39:36] = {in[73], in[73], in[41], in[9]};
	assign w[43:40] = {in[74], in[74], in[42], in[10]};
	assign w[47:44] = {in[75], in[75], in[43], in[11]};
	assign w[51:48] = {in[76], in[76], in[44], in[12]};
	assign w[55:52] = {in[77], in[77], in[45], in[13]};
	assign w[59:56] = {in[78], in[78], in[46], in[14]};
	assign w[63:60] = {in[79], in[79], in[47], in[15]};
	assign w[67:64] = {in[80], in[80], in[48], in[16]};
	assign w[71:68] = {in[81], in[81], in[49], in[17]};
	assign w[75:72] = {in[82], in[82], in[50], in[18]};
	assign w[79:76] = {in[83], in[83], in[51], in[19]};
	assign w[83:80] = {in[84], in[84], in[52], in[20]};
	assign w[87:84] = {in[85], in[85], in[53], in[21]};
	assign w[91:88] = {in[86], in[86], in[54], in[22]};
	assign w[95:92] = {in[87], in[87], in[55], in[23]};
	assign w[99:96] = {in[88], in[88], in[56], in[24]};
	assign w[103:100] = {in[89], in[89], in[57], in[25]};
	assign w[107:104] = {in[90], in[90], in[58], in[26]};
	assign w[111:108] = {in[91], in[91], in[59], in[27]};
	assign w[115:112] = {in[92], in[92], in[60], in[28]};
	assign w[119:116] = {in[93], in[93], in[61], in[29]};
	assign w[123:120] = {in[94], in[94], in[62], in[30]};
	assign w[127:124] = {in[95], in[95], in[63], in[31]};

	mux4to1 mux0(out[0], w[3:0], ALUControl);	
	mux4to1 mux1(out[1], w[7:4], ALUControl);	
	mux4to1 mux2(out[2], w[11:8], ALUControl);	
	mux4to1 mux3(out[3], w[15:12], ALUControl);	
	mux4to1 mux4(out[4], w[19:16], ALUControl);	
	mux4to1 mux5(out[5], w[23:20], ALUControl);	
	mux4to1 mux7(out[6], w[27:24], ALUControl);	
	mux4to1 mux8(out[7], w[31:28], ALUControl);
	mux4to1 mux9(out[8], w[35:32], ALUControl);
	mux4to1 mux10(out[9], w[39:36], ALUControl);
	mux4to1 mux11(out[10], w[43:40], ALUControl);
	mux4to1 mux12(out[11], w[47:44], ALUControl);
	mux4to1 mux13(out[12], w[51:48], ALUControl);
	mux4to1 mux14(out[13], w[55:52], ALUControl);
	mux4to1 mux15(out[14], w[59:56], ALUControl);
	mux4to1 mux16(out[15], w[63:60], ALUControl);
	mux4to1 mux17(out[16], w[67:64], ALUControl);
	mux4to1 mux18(out[17], w[71:68], ALUControl);
	mux4to1 mux19(out[18], w[75:72], ALUControl);
	mux4to1 mux20(out[19], w[79:76], ALUControl);
	mux4to1 mux21(out[20], w[83:80], ALUControl);	
	mux4to1 mux22(out[21], w[87:84], ALUControl);
	mux4to1 mux23(out[22], w[91:88], ALUControl);
	mux4to1 mux24(out[23], w[95:92], ALUControl);
	mux4to1 mux25(out[24], w[99:96], ALUControl);
	mux4to1 mux26(out[25], w[103:100], ALUControl);
	mux4to1 mux27(out[26], w[107:104], ALUControl);
	mux4to1 mux28(out[27], w[111:108], ALUControl);
	mux4to1 mux29(out[28], w[115:112], ALUControl);
	mux4to1 mux30(out[29], w[119:116], ALUControl);
	mux4to1 mux31(out[30], w[123:120], ALUControl);
	mux4to1 mux32(out[31], w[127:124], ALUControl); //skiped mux6


endmodule

module mux32x32to1(ReadData, in, ReadRegister);
	output [31:0] ReadData;
	input [1023:0] in;
	input [4:0] ReadRegister;

	reg [1023:0] w; 	
	integer j;
	integer i;	

	//assign w[0] = in[0];
	//for loop or code to make 0th bit in mux0 and 1st bit in mux1....
	always @(in) begin 
		for(j =0; j < 32; j=j+1) begin
		
			for (i = 0; i < 32; i=i+1) begin
				w[j*32+i] = in[i*32+j];
			end
		end
	end
	
	mux32to1 mux0(ReadData[0] ,w[31:0], ReadRegister);
	mux32to1 mux1(ReadData[1] ,w[63:32], ReadRegister);
	mux32to1 mux2(ReadData[2] ,w[95:64], ReadRegister);
	mux32to1 mux3(ReadData[3] ,w[127:96], ReadRegister);
	mux32to1 mux4(ReadData[4] ,w[159:128], ReadRegister);
	mux32to1 mux5(ReadData[5] ,w[191:160], ReadRegister);
	mux32to1 mux6(ReadData[6] ,w[223:192], ReadRegister);
	mux32to1 mux7(ReadData[7] ,w[255:224], ReadRegister);
	mux32to1 mux8(ReadData[8] ,w[287:256], ReadRegister);
	mux32to1 mux9(ReadData[9] ,w[319:288], ReadRegister);
	mux32to1 mux10(ReadData[10] ,w[351:320], ReadRegister);
	mux32to1 mux11(ReadData[11] ,w[383:352], ReadRegister);
	mux32to1 mux12(ReadData[12] ,w[415:384], ReadRegister);
	mux32to1 mux13(ReadData[13] ,w[447:416], ReadRegister);
	mux32to1 mux14(ReadData[14] ,w[479:448], ReadRegister);
	mux32to1 mux15(ReadData[15] ,w[511:480], ReadRegister);
	mux32to1 mux16(ReadData[16] ,w[543:512], ReadRegister);
	mux32to1 mux17(ReadData[17] ,w[575:544], ReadRegister);
	mux32to1 mux18(ReadData[18] ,w[607:576], ReadRegister);
	mux32to1 mux19(ReadData[19] ,w[639:608], ReadRegister);
	mux32to1 mux20(ReadData[20] ,w[671:640], ReadRegister);
	mux32to1 mux21(ReadData[21] ,w[703:672], ReadRegister);
	mux32to1 mux22(ReadData[22] ,w[735:704], ReadRegister);
	mux32to1 mux23(ReadData[23] ,w[767:736], ReadRegister);
	mux32to1 mux24(ReadData[24] ,w[799:768], ReadRegister);
	mux32to1 mux25(ReadData[25] ,w[831:800], ReadRegister);
	mux32to1 mux26(ReadData[26] ,w[863:832], ReadRegister);
	mux32to1 mux27(ReadData[27] ,w[895:864], ReadRegister);
	mux32to1 mux28(ReadData[28] ,w[927:896], ReadRegister);
	mux32to1 mux29(ReadData[29] ,w[959:928], ReadRegister);
	mux32to1 mux30(ReadData[30] ,w[991:960], ReadRegister);
	mux32to1 mux031(ReadData[31] ,w[1023:992], ReadRegister);


	//end
	
	//assign w[32:0] = {in[992], in[960], in[928], in[896], in[864], in[832], in[800], in[768].....


endmodule

