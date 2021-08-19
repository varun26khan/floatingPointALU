module flopALU(in1,in2,op,out);
	input [31:0] in1,in2;
	input [1:0] op; // op = 2'b00 for multiplication; 2'b10 for addition; 2'b11 for subtraction
	output [31:0] out;
	wire [31:0] mul_out,add_out;
	flopMUL fp1 (mul_out,in1,in2);
	flopADD fp2 (op[0],in1,in2,add_out);
	assign out = op[1]?add_out:mul_out;
endmodule	
	
		
		