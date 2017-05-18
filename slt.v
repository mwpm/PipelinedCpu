
module slt(out, OF, Neg);
	output [31:0] out;
	input OF, Neg;
	parameter delay = 50;
	
	assign out[31:1] = 31'd0;


	xor #delay xor0(out[0], OF, Neg);
	

endmodule
