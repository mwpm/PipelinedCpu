`include "signex.v"

module TestSign();
	initial 
	begin
		$shm_open("sign.shm");
		$shm_probe("AC");
		$shm_close(0);
	end

	parameter ClockDelay = 50000;
	reg [15:0] in;
	wire [31:0] out;

	signex UUT0(out, in);


	initial
	begin	
		in = 16'd0;
		#(ClockDelay); 
		in = 16'd2;
		#(ClockDelay); 
		in = 16'b1010101011010101;
		#(ClockDelay);
		in = 16'd8;
		#(ClockDelay);
	end



endmodule 
