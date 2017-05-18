module register32bit (Q, D, reset, clk, sel);
	output [31:0] Q;
	input [31:0] D;
	input reset, clk, sel;
	

	register16bit reg0(Q[15:0], D[15:0], reset, clk, sel);
	register16bit reg1(Q[31:16], D[31:16], reset, clk, sel);
	
endmodule

module register16bit (Q, D, reset, clk, sel);
	output [15:0] Q;
	input [15:0] D;
	input reset, clk, sel;
	

	register8bit reg0(Q[7:0], D[7:0], reset, clk, sel);
	register8bit reg1(Q[15:8], D[15:8], reset, clk, sel);
	
endmodule

module register8bit (Q, D, reset, clk, sel);
	output [7:0] Q;
	input [7:0] D;
	input reset, clk, sel;
	

	register4bit reg0(Q[3:0], D[3:0], reset, clk, sel);
	register4bit reg1(Q[7:4], D[7:4], reset, clk, sel);
	
endmodule

module register4bit (Q, D, reset, clk, sel);
	output [3:0] Q;
	input [3:0] D;
	input reset, clk, sel;
	

	register2bit reg0(Q[1:0], D[1:0], reset, clk, sel);
	register2bit reg1(Q[3:2], D[3:2], reset, clk, sel);
	
endmodule



module register2bit (Q, D, reset, clk, sel);
	output [1:0] Q;
	input [1:0] D;
	input reset, clk, sel;

	register1bit reg0(Q[0], D[0], reset, clk, sel);
	register1bit reg1(Q[1], D[1], reset, clk, sel);

	
endmodule

module register1bit (Q, D, reset, clk, sel);
	output Q;
	input D, sel;
	input reset, clk;
	wire a;
	
	mux2to1 mux0(a, D, Q, sel);

	D_FF df0(Q, a, reset, clk);

	
endmodule

module D_FF (q, d, reset, clk);
	output q;
	input d, reset, clk;
	reg q; // Indicate that q is stateholding

	always @(posedge clk or posedge reset)
	if (reset)
		q = 0; // On reset, set to 0
	else
		q = d; //Otherwise out = d
endmodule

module mux2to1 (out, in1, in0, sel);
	output out;
	input in1, in0; 
	input sel;
	wire and1Out, and0Out;
	parameter delay = 50;

	not #delay not0(nSel, sel);
	and #delay a0(and0Out, in0, nSel);
	and #delay a1(and1Out, in1, sel);
	
	or #delay or0(out, and0Out, and1Out);

endmodule


