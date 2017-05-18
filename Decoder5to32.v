module Decoder5to32(out, in, RegWrite);
	output [31:0] out;
	input [4:0] in; 
	input RegWrite;
	wire [3:0] w;

	Decoder3to8 dec0(out[7:0], in[2:0], w[0]);
	Decoder3to8 dec1(out[15:8], in[2:0], w[1]);
	Decoder3to8 dec2(out[23:16], in[2:0], w[2]);
	Decoder3to8 dec3(out[31:24], in[2:0], w[3]);
	Decoder2to4 dec4(w[3:0], in[4:3], RegWrite);


endmodule

module Decoder2to4(out, in, enable);
	output [3:0] out;
	input [1:0] in; 
	input enable;
	parameter delay = 50;
	wire	[1:0] nin;
	
	not #delay not0(nin[0], in[0]);
	not #delay not1(nin[1], in[1]);
	
	and #delay a3(out[3], in[1], in[0], enable);
	and #delay a2(out[2], in[1], nin[0], enable);
	and #delay a1(out[1], nin[1], in[0], enable);
	and #delay a0(out[0], nin[1], nin[0], enable);


endmodule 

module Decoder3to8(out, in, enable);
	output [7:0] out;
	input [2:0] in;
	input enable;
	parameter delay = 50;
	wire nenable,realE0, realE1;

	not #delay not0(nenable, in[2]);
	and #delay and0(realE0, nenable, enable);
	and #delay and1(realE1, in[2], enable);

	Decoder2to4 dec0(out[3:0], in[1:0], realE0);
	Decoder2to4 dec1(out[7:4], in[1:0], realE1);
	

endmodule

