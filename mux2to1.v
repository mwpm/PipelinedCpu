module mux2to1a (out, in1, in0, sel);
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

