`include "mux.v"
module TestMux();
	
initial 
	begin
		$shm_open("mux.shm");
		$shm_probe("AC");
		$shm_close(0);
	end

	parameter ClockDelay = 50000;
	reg a,b,c,d;
	reg [2:0] sel;
	wire y;

	mux UUT(a,b,c,d,sel,y); 

	
	initial
	begin
		sel = 3'd4;
		a = 0;
		b = 1;
		c = 0;	
		d = 1;
		#(ClockDelay/4);
		
		
		#(ClockDelay); 
		sel = 3'd1;
		#(ClockDelay);
		sel = 3'd0;
		#(ClockDelay);
		sel = 3'd2;
		#(ClockDelay);
		sel = 3'd3;
		#(ClockDelay);
		#(ClockDelay);
	end

endmodule
