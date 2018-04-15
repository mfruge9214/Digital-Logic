module lfsr(
input clk,
input enable,
output reg [10:0] num
);
	
	initial num= 11'b11010010110;
	wire feedback = (num[10] ^ num[9]);// & ~(num[3]);
	always@(posedge clk)
	begin
		if(~enable)
		begin
			num<= num<<1;
			num[0]<= feedback;
//			num[1]<= 1;
//			num[2]<= 1;
//			num[3]<= 1;
//			num[4]<= 1;
//			num[5]<= 1;
//			num[6]<= 1;
//			num[7]<= 1;
//			num[8]<= 1;
//			num[9]<= 1;
//			num[10]<= 1;
//			num[0]<= feedback;
//			num[1]<= num[0];
//			num[2]<= num[1];
//			num[3]<= num[2];
//			num[4]<= num[3];
//			num[5]<= num[4];
//			num[6]<= num[5];
//			num[7]<= num[6];
//			num[8]<= num[7];
//			num[9]<= num[8];
//			num[10]<= num[9];
		end
	end

endmodule 
