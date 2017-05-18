module zerocheck(out, in);
	output out;
	input [31:0] in;
	wire [10:0] w;

	parameter delay = 50;
	
	or #delay or0(w[0], in[3:0]);	
	or #delay or1(w[1], in[7:4]);	
	or #delay or2(w[2], in[11:8]);	
	or #delay or3(w[3], in[15:12]);	
	or #delay or4(w[4], in[19:16]);	
	or #delay or5(w[5], in[23:20]);	
	or #delay or6(w[6], in[27:24]);	
	or #delay or7(w[7], in[31:28]);

	or #delay and0(w[8], w[3:0]);
	or #delay and1(w[9], w[7:4]);

	or #delay and3(w[10], w[9:8]);

	not #delay not0(out, w[10]);
endmodule
