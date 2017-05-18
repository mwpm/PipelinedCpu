module FU(rsDSelect, rtDSelect, rs, rt, ExAw, MemAw, ExRegWr, MemRegWr);
	output [1:0] rsDSelect, rtDSelect;
	reg [1:0] rsDSelect, rtDSelect;
	input [4:0] rs, rt, ExAw, MemAw;
	input ExRegWr, MemRegWr;

	always @(rs or rt or ExAw or MemAw or ExRegWr or MemRegWr)
	if ((rs != 5'b0) && (MemRegWr == 1'b1) && (rs == MemAw) && (MemAw != ExAw)) begin
		rsDSelect = 2'd2;
	end else if ((ExRegWr == 1'b1) && (rs == ExAw) && (rs != 5'b0)) begin
		rsDSelect = 2'd1;
	end else begin
		rsDSelect = 2'd0; 
	end
	
	always @(rs or rt or ExAw or MemAw or ExRegWr or MemRegWr)
	if ((rt != 5'b0) && (MemRegWr == 1'b1) && (rt == MemAw) && (MemAw != ExAw)) begin
		rtDSelect = 2'd2;
	end else if ((ExRegWr == 1'b1) && (rt == ExAw) && (rt != 5'b0)) begin
		rtDSelect = 2'd1;
	end else begin
		rtDSelect = 2'd0; 
	end

endmodule 
