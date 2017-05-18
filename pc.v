`include "alu.v"

module pc(out, in, reset, clk);
	output [29:0] out; 
	input [29:0] in;
	input reset, clk;
	
	D_FF dff0(out[0], in[0], reset, clk);	
	D_FF dff1(out[1], in[1], reset, clk);	
	D_FF dff2(out[2], in[2], reset, clk);	
	D_FF dff3(out[3], in[3], reset, clk);	
	D_FF dff4(out[4], in[4], reset, clk);	
	D_FF dfff5(out[5], in[5], reset, clk);	
	D_FF dff6(out[6], in[6], reset, clk);	
	D_FF dff7(out[7], in[7], reset, clk);	
	D_FF dff8(out[8], in[8], reset, clk);	
	D_FF dff9(out[9], in[9], reset, clk);	
	D_FF dff10(out[10], in[10], reset, clk);	
	D_FF dff11(out[11], in[11], reset, clk);	
	D_FF dff12(out[12], in[12], reset, clk);	
	D_FF dff13(out[13], in[13], reset, clk);	
	D_FF dff14(out[14], in[14], reset, clk);	
	D_FF dff15(out[15], in[15], reset, clk);	
	D_FF dff16(out[16], in[16], reset, clk);	
	D_FF dff17(out[17], in[17], reset, clk);	
	D_FF dff18(out[18], in[18], reset, clk);	
	D_FF dff19(out[19], in[19], reset, clk);	
	D_FF dff20(out[20], in[20], reset, clk);	
	D_FF dff21(out[21], in[21], reset, clk);	
	D_FF dff22(out[22], in[22], reset, clk);	
	D_FF dff23(out[23], in[23], reset, clk);	
	D_FF dff24(out[24], in[24], reset, clk);	
	D_FF dff25(out[25], in[25], reset, clk);	
	D_FF dff26(out[26], in[26], reset, clk);	
	D_FF dff27(out[27], in[27], reset, clk);	
	D_FF dff28(out[28], in[28], reset, clk);	
	D_FF dff29(out[29], in[29], reset, clk);	
	
endmodule 

