module Clockdivider(
	input in, 
	output reg out
	);

	integer countTo;
	initial out<=0;
	
	always @ (posedge in) 
	begin
	countTo <= countTo + 1;
		if(countTo == 49999)
		begin
			countTo  <= 0;
			out <= 1;
		end
		else
		begin
			out<=0;
		end
	end
	
endmodule
