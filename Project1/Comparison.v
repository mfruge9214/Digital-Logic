module equal([3:0]x, [3:0]y, clk, out)
	input x, y, clk;
	output reg out;
	genvar i;
	always @(posedge clk)
	begin
		assign out=1;
		for(i=0; i<4; i=i+1)
		begin
			if x[i] != y[i]
			begin
				assign out=0;
			end
		end
	end
endmodule
