`include "cpu.v"

module TestCPU();
	initial 
	begin
		$shm_open("cpu.shm");
		$shm_probe("AC");
		$shm_close(0);
	end	
	//singel cylc clockDelay = 50000
	parameter ClockDelay = 10000;
	reg reset, clock;
	
	cpu cpu0(reset, clock);

	initial clock = 0;
	always #(ClockDelay/2) clock = ~clock;
	initial
	begin	
		reset = 1;
		#(ClockDelay/4);
		reset = 0;		
		//#60000000;
		#10000000;
		
		$finish;
	end
	
endmodule 

	
