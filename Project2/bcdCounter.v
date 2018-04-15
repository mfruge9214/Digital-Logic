//module bcdCounter( 
//	input clk,
//	input enable,
//	output [3:0] ones,
//	output [3:0] tenths,
//	output [3:0] hundreths,
//	output [3:0] thousandths
//	);
//	
//	parameter reset = 4'b1001;
//	reg [3:0] rones;
//	reg [3:0] rtenths;
//	reg [3:0] rhundreths;
//	reg [3:0] rthousandths;
//	
//	initial
//	begin
//		rones=0;
//		rtenths=0;
//		rhundreths=0;
//		rthousandths=0;
//	end
//	
//	always@(posedge clk)
//	begin
//		if(enable) // IF enable allows this module to go, then it will count, otherwise it will do nothing
//		begin
//			rthousandths = rthousandths +1;
//			if (rthousandths == reset)
//			begin
//				rthousandths <= 4'b0000;
//				rhundreths <= rhundreths +1;
//			end
//		end
//	end
//		
//	always@(posedge rhundreths)
//	begin
//		if(rhundreths == reset)
//		begin
//			rhundreths <= 4'b0000;
//			rtenths <= rtenths + 1;
//		end
//	end
//		
//	always@(posedge rtenths)
//	begin
//		if (rtenths == reset)
//		begin
//			rtenths <= 4'b0000;
//			rones <= rones+1;
//		end
//	end
//
//	assign ones=rones;
//	assign tenths=rtenths;
//	assign hundreths=rhundreths;
//	assign thousandths=rthousandths;
//	
//endmodule 






module bcdCounter( 
	input clk,
	input enable,
	output reg [3:0] ones,
	output reg [3:0] tenths,
	output reg [3:0] hundreths,
	output reg [3:0] thousandths
	);
	
	parameter reset = 4'b1001;
	
	
//	initial
//	begin
//		ones=0;
//		tenths=0;
//		hundreths=0;
//		thousandths=0;
//	end
	
	always@(posedge clk)
	begin
		if(~enable) // IF enable allows this module to go, then it will count, otherwise it will do nothing
		begin
			if(thousandths==reset)
			begin
				thousandths<=0;
				if(hundreths==reset)
				begin
					hundreths<=0;
					if(tenths==reset)
					begin
						tenths<=0;
						//ones<= ones+1;
						if(ones==reset)
						begin
							ones<=0;
						end
						else
						begin
							ones<=ones+1;
						end
					end
					else
					begin
						tenths<=tenths+1;
					end
				end
				else
				begin
					hundreths<=hundreths+1;
				end
			end
			else
			begin
				thousandths<=thousandths+1;
			end
		end
	end
endmodule
				
				
				
				
				
				
