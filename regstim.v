`timescale 1 ps / 100 fs

// The verilog file containing your register file must
// be named "regfile.v".
`include "regfile.v"

module RegFileStimulus();

	initial 
	begin
		$shm_open("waves.shm");
		$shm_probe("AC");
		$shm_close(0);
	end

parameter ClockDelay = 50000;

reg [4:0] ReadRegister1, ReadRegister2, WriteRegister;
reg [31:0] WriteData;
reg RegWrite, clk;
wire [31:0] ReadData1, ReadData2;

integer i;

// Your register file MUST be named "regfile".
// Also you must make sure that the port declarations
// match up with the module instance in this stimulus file.
regfile reg1(ReadData1,ReadData2,WriteData,
	ReadRegister1,ReadRegister2,WriteRegister,RegWrite,clk);

initial clk = 0;
always #(ClockDelay/2) clk = ~clk;

initial
	begin
		$monitor($time, " ReadData1=%h, ReadData2=%h, WriteData=%h, WriteReg=%b, Reg1=%h, Reg2=%h, RegWrite=%b, clk=%b",
		ReadData1, ReadData2, WriteData, WriteRegister, ReadRegister1, ReadRegister2, RegWrite,clk);

		#(ClockDelay/4); // Make all changes away from the clock edges

		// Try to write the value 0xA0 into register 0.
		// Register 0 should begin and remain at the value of 0.
		RegWrite=0;
		ReadRegister1=0;
		ReadRegister2=0;
		WriteRegister=0;
		WriteData=32'hA0;
		#(ClockDelay);
		RegWrite=1;
		#(ClockDelay);

		// Write a value into each  register.
		for (i=1; i<32; i=i+1)
		begin
			RegWrite=0;
			ReadRegister1=i-1;
			ReadRegister2=i;
			WriteRegister=i;
			WriteData=i; //*32'h01020408;
			#(ClockDelay);
			RegWrite=1;
			#(ClockDelay);
		end

		// Go back and verify that the registers
		// retained the data.
		for (i=1; i<32; i=i+1)
		begin
			RegWrite=0;
			ReadRegister1=i-1;
			ReadRegister2=i;
			WriteRegister=i;
			WriteData=i*32'h100+i;
			#(ClockDelay);
			#(ClockDelay);
		end
		$finish;
	end
endmodule


