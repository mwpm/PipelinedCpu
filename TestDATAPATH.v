`include "datapath.v"
//not finished
module TestDATAPATH();
	initial 
	begin
		$shm_open("data.shm");
		$shm_probe("AC");
		$shm_close(0);
	end

	parameter ClockDelay = 50000;

	reg [31:0] temp;
	reg [1:0] jump;
	reg branch, jalr, neg, reset, clk;
	wire [31:0] instr, pc8;
	wire jalren, branchen, clkout;

	ifu UUT(instr, pc8, jalren, branchen, clkout, branch, jump, jalr, neg, temp, reset, clk);

	initial clk = 0;
	always #(ClockDelay/2) clk = ~clk;
	initial
	begin
		reset = 1;
		temp = 32'd21;
		branch = 0;
		jump = 0;
		jalr = 0;
		neg = 0;
		#(ClockDelay/4);
				
		reset = 0;
		
		#(ClockDelay); 
		temp = 32'd41;
		#(ClockDelay);
		temp = 32'd90;
		#(ClockDelay);
		jalr = 1;
		#(ClockDelay);
		jalr = 0;
		jump = 0;
		#(ClockDelay);
		#(ClockDelay);
		$finish;
	end


endmodule 
