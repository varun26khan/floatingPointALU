module tb_adder;
	parameter N=32; 
   reg [N-1:0] A,B;
	wire [N-1:0] OUT;
	reg [1:0] OP;
	integer i;
    
   flopALU fp(.in1(A),.in2(B),.op(OP),.out(OUT));
	
	initial begin
		A = 32'b0;
      B = 32'b0;
      OP = 2'b00;
		forever
			#10 clk = ~clk;
	end
	
   always@(posedge clk) begin
		if(i==10) begin
			$finish;
		end
		else begin
			#5 input_generate(A,B,OP);
			i=i+1;
		end
	end
	
	task input_generate;
   output [N-1:0] A_t,B_t;
   output [1:0] OP_t;
   begin
      A_t = $random % 32;
      B_t = $random % 32;
      OP_t =$random % 2;
   end
   endtask
	
endmodule
