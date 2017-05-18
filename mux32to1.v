//`include "mux2too1.v"
//`include "mux16to1.v"

module mux32to1(out, in, sel);
	output	out;
	input [31:0] in;
	input [4:0] sel;
	wire [1:0] w;	

	mux16to1 mux0(w[0], in[15:0], sel[3:0]);
	mux16to1 mux1(w[1], in[31:16], sel[3:0]);
	mux2too1 mux2(out, w, sel[4]);
		

endmodule

module mux16to1(out, in, sel);
	output	out;
	input [15:0] in;
	input [3:0] sel;
	wire [1:0] w;	

	mux8to1 mux0(w[0], in[7:0], sel[2:0]);
	mux8to1 mux1(w[1], in[15:8], sel[2:0]);
	mux2too1 mux2(out, w, sel[3]);
		

endmodule

module mux8to1(out, in, sel);
	output	out;
	input [7:0] in;
	input [2:0] sel;
	wire [1:0] w;	

	mux4to1 mux0(w[0], in[3:0], sel[1:0]);
	mux4to1 mux1(w[1], in[7:4], sel[1:0]);
	mux2too1 mux2(out, w, sel[2]);	

		

endmodule

module mux4to1(out, in, sel);
	output	out;
	input [3:0] in;
	input [1:0] sel;
	wire [1:0] w;	

	mux2too1 mux0(w[0], in[1:0], sel[0]);
	mux2too1 mux1(w[1], in[3:2], sel[0]);
	mux2too1 mux2(out, w, sel[1]);
		

endmodule

module mux2too1 (out, in, sel);
	output out;
	input [1:0] in; 
	input sel;
	wire and1Out, and0Out;
	parameter delay = 50;
	
	not #delay not0(nsel, sel); //added not gate 11/7/2013 if code doesnt work check this!
	and #delay a0(and0Out, in[0], nsel);
	and #delay a1(and1Out, in[1], sel);
	
	or #delay or0(out, and0Out, and1Out);

endmodule

