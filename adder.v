`include "mux2to1.v"

module FullAdder(Cout, S, A, B, Cin, sel);
	output Cout, S;
	input A, B, Cin, sel;
	parameter delay = 50; 
	wire [2:0] out;	
	wire sub;
	
	not not0(nB, B);
	mux2to1a mux0(sub, nB, B, sel); //sel 0 = add, sel 1 = subtract
	
	and #delay and0(out[0], A, Cin);
	and #delay and1(out[1], Cin, sub);
	and #delay and2(out[2], A, sub);	
	
	or #delay or0(Cout, out);

	xor #delay xor0(S, A, sub, Cin);

endmodule

module adder2bit(Cout, S, A, B, Cin, sel);
	output Cout;
	output [1:0] S;
	input [1:0] A, B;
	input Cin, sel;

	parameter delay = 50;
	wire w;

	FullAdder add0(w, S[0], A[0], B[0], Cin, sel);
	FullAdder add1(Cout, S[1], A[1], B[1], w, sel);
	

endmodule

module adder4bit(Cout, S, A, B, Cin, sel);
	output Cout;
	output [3:0] S;
	input [3:0] A, B;
	input Cin, sel;

	parameter delay = 50;
	wire  w;

	adder2bit add0(w, S[1:0], A[1:0], B[1:0], Cin, sel);
	adder2bit add1(Cout, S[3:2], A[3:2], B[3:2], w, sel);

endmodule

module adder8bit(Cout, S, A, B, Cin, sel);
	output Cout;
	output [7:0] S;
	input [7:0] A, B;
	input Cin, sel;
	wire  w;

	parameter delay = 50;

	adder4bit add0(w, S[3:0], A[3:0], B[3:0], Cin, sel);
	adder4bit add1(Cout, S[7:4], A[7:4], B[7:4], w, sel);	

endmodule

module adder16bit(Cout, S, A, B, Cin, sel);
	output Cout;
	output [15:0] S;
	input [15:0] A, B;
	input Cin, sel;
	wire  w;

	parameter delay = 50;

	adder8bit add0(w, S[7:0], A[7:0], B[7:0], Cin, sel);
	adder8bit add1(Cout, S[15:8], A[15:8], B[15:8], w, sel);

endmodule

module adder32bit(Cout, OF, S, A, B, sel);
	output Cout, OF;
	output [31:0] S;
	input [31:0] A, B;
	input sel;
	wire  [4:0] w;

	parameter delay = 50;

	adder16bit add0(w[0], S[15:0], A[15:0], B[15:0], sel, sel);
	adder8bit add1(w[1], S[23:16], A[23:16], B[23:16], w[0], sel);
	adder4bit add2(w[2], S[27:24], A[27:24], B[27:24], w[1], sel);
	adder2bit add3(w[3], S[29:28], A[29:28], B[29:28], w[2], sel);
	FullAdder add4(w[4], S[30], A[30], B[30], w[3], sel);
	FullAdder add5(Cout, S[31], A[31], B[31], w[4], sel);
	
	xor #delay xor0(OF, Cout, w[4]); //overflow	

endmodule

module adder30bitcin(S, A, B, cin ,sel);
	output [29:0] S;
	input [29:0] A, B;
	input cin, sel;
	wire [2:0] w;
	
	adder16bit adder0(w[0], S[15:0], A[15:0], B[15:0], cin, sel);
	adder8bit adder1(w[1], S[23:16], A[23:16], B[23:16], w[0], sel);
	adder4bit adder2(w[2], S[27:24], A[27:24], B[27:24], w[1], sel);
	adder2bit adder3(Cout, S[29:28], A[29:28], B[29:28], w[2], sel);


endmodule

module adder32bitcin(Cout, OF, S, A, B, cin, sel);
	output Cout, OF;
	output [31:0] S;
	input [31:0] A, B;
	input cin, sel;
	wire  [4:0] w;

	parameter delay = 50;

	adder16bit add0(w[0], S[15:0], A[15:0], B[15:0], cin, sel);
	adder8bit add1(w[1], S[23:16], A[23:16], B[23:16], w[0], sel);
	adder4bit add2(w[2], S[27:24], A[27:24], B[27:24], w[1], sel);
	adder2bit add3(w[3], S[29:28], A[29:28], B[29:28], w[2], sel);
	FullAdder add4(w[4], S[30], A[30], B[30], w[3], sel);
	FullAdder add5(Cout, S[31], A[31], B[31], w[4], sel);
	
	xor #delay xor0(OF, Cout, w[4]); //overflow	

endmodule

