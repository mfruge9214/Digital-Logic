module Clockdivider(
	input CLK,
	input [1:0] enable,
	output t
	);
	parameter ms=25000;
	//parameter limit=start;
	reg [15:0] counter;
	//reg [10:0] to;
	reg to;
	//assign counter=0;
	//to=11'b00000000000;
	
	always @(posedge CLK)
	begin
		if(enable[0])
		begin
			if (counter < ms)
			begin
				counter = counter + 1;
			end
			else
			begin
				to = ~to;
				counter = 0;
			end
		end
	end

	assign t=to;
	
endmodule
