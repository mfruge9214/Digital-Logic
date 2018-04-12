module clockdivider(
	input CLK,
	output [10:0] t
	);
	parameter ms=50000;
	//parameter limit=start;
	reg [15:0] counter;
	reg [10:0] to;
	//assign counter=0;
	//to=11'b00000000000;
	
	always @(posedge CLK)
	begin
		if (counter < ms)
		begin
			counter = counter + 1;
		end
		else
		begin
			to= to +1;
			counter = 0;
		end
	end
	
	assign t=to;
	
endmodule
		
