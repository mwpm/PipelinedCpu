`include "datapath.v"

module cpu(reset, clock);
	input reset, clock;
	wire [31:0] instr, pc8, temp, instrOut, pc8Out;
	wire [29:0] pcOut, pc;
	wire [1:0] jump, ALUSrc, ALUCntrl;	
	wire branch, jalr, neg, RegDst, MemToReg, RegWr, MemWr;
	wire [11:0] addi, bgez, j, jalrCON, lw, norCON, slt, subu, sw;	
	wire [25:0] target;
	reg [11:0] control;	
	reg [5:0] opcode;

					//  RAAMRMBJJAAJ	
	assign addi = 	12'b001010000100;
	assign bgez = 	12'b010000110100;
	assign j =	12'b000000001000;
	assign jalrCON=	12'b100010000001;
	assign lw = 	12'b001110000100;
	assign norCON = 12'b100010000000;
	assign slt =	12'b100010000010;
	assign subu = 	12'b100010000110;
	assign sw = 	12'b001001000100;
/*
			//  RAAMRMBJJAAJ	
	assign addi = 	12'b001010000100;
	assign bgez = 	12'bx10x00110100;
	assign j =	12'bxxxx00x01xx0;
	assign jalrCON=	12'b1xxx100xxxx1;
	assign lw = 	12'b001110000100;
	assign norCON = 12'b100010000000;
	assign slt =	12'b100010000010;
	assign subu = 	12'b100010000110;
	assign sw = 	12'bx01x01000100;
	*/

	always @(instrOut or instr)
	case(instrOut[31:26])
		6'd8: control = addi;
		6'd1: control = bgez;
		6'd2: control = j;
		6'd35: control = lw;
		6'd43: control = sw;
		default: control = 12'd0;
	endcase
	
	always @(control or instr)
	case(control)
		12'd0 : opcode =instrOut[5:0];
		default: opcode = 6'd0;

	endcase	

	always@(opcode)
	case(opcode)
		6'd9: control = jalrCON;
		6'd39: control = norCON;	
		6'd42: control = slt;
		6'd35 : control = subu;
		6'd0 : $display("I type, last 6 bits are imm16");
		default: $display("OP code doesnt exist");

	endcase

	assign RegDst = control[11];
	assign ALUSrc = control[10:9];
	assign MemToReg = control[8];
	assign RegWr = control[7];
	assign MemWr = control[6];
	assign branch = control[5];
	assign jump = control[4:3];
	assign ALUCntrl = control[2:1];
	assign jalr = control[0];

	ifu if0(instr, pc8, pc, branch, jump, jalr, neg, temp, instrOut[25:0], pcOut, reset, clock);
	pipeline1 pip0(instrOut, pc8Out, pcOut, instr, pc8, pc, reset, clock, 1'b1);
	datapath data0(temp, neg, instrOut, pc8Out, RegDst, ALUSrc, MemToReg, RegWr, MemWr, ALUCntrl, jalr, clock, reset);
	

endmodule

module pipeline1(instrOut, pc8Out, pcOut, instrIn, pc8In, pc, reset, clk, sel);
	output [31:0] instrOut, pc8Out;
	output [29:0] pcOut;
	input [31:0] instrIn, pc8In;
	input [29:0] pc;
	input reset, clk, sel;
	//input order {instr, pc8}
	
	register32bit reg0(instrOut, instrIn, reset, clk, sel);
	register32bit reg1(pc8Out, pc8In, reset, clk, sel);
	register16bit reg2(pcOut[15:0], pc[15:0], reset, clk, sel);
	register8bit reg3(pcOut[23:16], pc[23:16], reset, clk, sel);
	register2bit reg4(pcOut[25:24], pc[25:24], reset, clk, sel);
	register2bit reg5(pcOut[27:26], pc[27:26], reset, clk, sel);
	register2bit reg6(pcOut[29:28], pc[29:28], reset, clk, sel);

endmodule 



