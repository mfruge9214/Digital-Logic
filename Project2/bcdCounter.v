module bcdCounter( 
	input clk,
	output reg [2:0] ones,
	output reg [3:0] tenths,
	output reg [3:0] hundreths,
	output reg [3:0] thousandths
	);

	parameter reset = 4'b1001;
	reg [10:0] num;
	
	clockdivider(clk, num[10:0]);
	
	always@(posedge num)
	begin
		thousandths = thousandths +1;
		if (thousandths == reset)
		begin
			thousandths <= 4'b0000;
			hundreths <= hundreths +1;
		end
	end
	
	always@(posedge hundreths)
	begin
		if(hundreths == reset)
		begin
			hundreths <= 4'b0000;
			tenths <= tenths + 1;
		end
	end
	
	always@(posedge tenths)
	begin
		if (tenths == reset)
		begin
			tenths <= 4'b0000;
			ones <= ones+1;
		end
	end

endmodule

//
////2bit counter
//module BCDCount(
//	input clk,
//	input clear,
//	input E,
//	output reg [3:0]BCD1,
//	output reg [3:0]BCD0
//	);
//	
//	always @(posedge clk)
//	begin
//		if(clear)
//		begin
//			BCD1 <= 0;
//			BCD0 <= 0;
//		end
//		else if(E)
//			if(BCD0 == 4'b1001)
//			begin
//				BCD0 <= 0;
//				if(BCD1 == 4'b1001)
//					BCD1 <= 0;
//				else
//					BCD1 <= BCD1 + 1;
//			end
//			else 
//			BCD0 <= BCD0 + 1;
//		end
//endmodule
