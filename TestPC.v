`include "pc.v"

module TestPC();
	initial 
	begin
		$shm_open("pc.shm");
		$shm_probe("AC");
		$shm_close(0);
	end

	parameter ClockDelay = 50000;

	reg [29:0] in;
	reg clk, reset;
	wire [29:0] out;

	pc pc0(out, in, reset, clk);

	initial clk = 0;
	always #(ClockDelay/2) clk = ~clk;
	initial
	begin	
		reset = 1;
		#(ClockDelay/4);
		reset = 0;		
		in = 32'd1;
		#(ClockDelay); 
		in = 32'd4;
		#(ClockDelay); 
		in = 32'd8;
		#(ClockDelay);
		in = 32'd12;
		#(ClockDelay);
		$finish;
	end



endmodule 
