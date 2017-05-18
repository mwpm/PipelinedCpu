module nor1bit(Out, A, B);
	output Out;
	input A, B;
	parameter delay = 50;

	nor #delay nor0(Out, A, B);

endmodule

module nor2bit(Out, A, B);
	output [1:0] Out;
	input [1:0] A, B;
	wire [1:0] z;
	parameter delay = 50;

	nor1bit nor0(Out[0], A[0], B[0]);
	nor1bit nor1(Out[1], A[1], B[1]);
	
endmodule


module nor4bit(Out, A, B);
	output [3:0] Out;
	input [3:0] A, B;
	parameter delay = 50;

	nor2bit nor2_0(Out[1:0], A[1:0], B[1:0]);	
	nor2bit nor2_1(Out[3:2], A[3:2], B[3:2]);
	
endmodule

module nor8bit(Out, A, B);
	output [7:0] Out;
	input [7:0] A, B;
	parameter delay = 50;

	nor4bit nor2_0(Out[3:0], A[3:0], B[3:0]);	
	nor4bit nor2_1(Out[7:4], A[7:4], B[7:4]);
	
endmodule

module nor16bit(Out, A, B);
	output [15:0] Out;
	input [15:0] A, B;
	parameter delay = 50;

	nor8bit nor2_0(Out[7:0], A[7:0], B[7:0]);	
	nor8bit nor2_1(Out[15:8], A[15:8], B[15:8]);
	
endmodule

module nor32bit(Out, A, B);
	output [31:0] Out;
	input [31:0] A, B;
	parameter delay = 50;

	nor16bit nor2_0(Out[15:0], A[15:0], B[15:0]);	
	nor16bit nor2_1(Out[31:16], A[31:16], B[31:16]);
	
endmodule
