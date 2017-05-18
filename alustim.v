`timescale 1 ps / 100 fs

// If the verilog file containing your register file is
// not named "alu.v" then you will have to change
// to next line as appropriate.
`include "alu.v"

module ALUStimulus();
	initial 
	begin
		$shm_open("alu.shm");
		$shm_probe("AC");
		$shm_close(0);
	end

parameter ClockDelay = 100000;

reg [31:0] BussA, BussB;
reg [1:0] ALUControl;

wire [31:0] Output;
wire zero, overflow, CarryOut, negative;

integer i;

// If your register file module is not named "alu" then you will
// have to change the following line in order to create an instance of
// your register file.  Also you must make sure that the port declarations
// match up with the module instance in this stimulus file.
alu alu1(Output, CarryOut, zero, overflow, negative, BussA, BussB, ALUControl);

initial
	begin
		$monitor($time, " Output=%h, CarryOut=%b, BussA=%h, BussB=%h, ALUControl=%b, Zero=%b, Overflow=%b, Negative=%b",
		Output, CarryOut, BussA, BussB, ALUControl, zero, overflow, negative);

	/* Addition unit testing */
		ALUControl=10; 
		BussA=32'h00000DEF; BussB=32'h00000ABC; // Should output 000018AB
		#(ClockDelay);
		BussA=32'h00001234; BussB=32'h00000105; // Should output 00001339
		#(ClockDelay);
		BussA=32'h7FFFFFFF; BussB=32'h00000001; // Should output 80000000, overflow, negative
		#(ClockDelay);
		BussA=32'h00001234; BussB=32'b11111100000001010100101010101010;
		#(ClockDelay);
		BussA=32'b11111100000001010100101010101010; BussB=32'h00001234;
		#(ClockDelay);

	/* Subtraction unit testing */
		ALUControl=11; 
		BussA=32'h00000DEF; BussB=32'h00000ABC; // Should output 00000333
		#(ClockDelay);
		BussA=32'h00001234; BussB=32'h00000105; // Should output 0000112F
		#(ClockDelay);
		BussA=32'h80000000; BussB=32'h00000001; // Should output 7FFFFFFF, overflow
		#(ClockDelay);

	/* You should test your units EXTENSIVELY here.  We just gave a few ideas
         above to get you started.  Make sure you�ve checked all outputs for
         all �interesting� cases. */

	/* Nor unit testing */
		ALUControl=00; 
		BussA=32'd1; BussB=32'b11111111111111111111111111111110; // Should output 			//all 0's
		#(ClockDelay);
		BussA=32'h00001234; BussB=32'h00000105; // Should output 0000112F
		#(ClockDelay);
		BussA=32'h80000000; BussB=32'h00000001; // Should output 7FFFFFFF, overflow
		#(ClockDelay);

	/* slt unit testing */
		ALUControl=01; 
		BussA=32'd10; BussB=32'b11111111111111111111111111111110; // false
		#(ClockDelay);
		BussA=32'd10; BussB=32'h00000105; // true
		#(ClockDelay);
		BussA=32'h80000000; BussB=32'h80000000; // equal, false?
		#(ClockDelay);

	end
endmodule

