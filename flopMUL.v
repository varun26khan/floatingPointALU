module flopMUL (out,in1,in2);
	input [31:0] in1,in2;
	output reg [31:0] out;
	reg [7:0] prod_exp; 
	reg [22:0] prod_man;
	reg prod_sign;
	reg [47:0] temp;
	always @ (*)
	begin
		prod_exp = in1[30:23]+in2[30:23]-127;
		prod_sign = in1[31] ^ in2[31];
		temp = {1'b1,in1[22:0]} * {1'b1,in2[22:0]};
		if (temp[47]) begin
			prod_man = temp[46:24] + temp[23];
			prod_exp = prod_exp + 8'b1;
		end
		else
			prod_man = temp[45:23] + temp[22];
		out = {prod_sign,prod_exp,prod_man};
	end
endmodule