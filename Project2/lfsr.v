module lfsr(
input clk,
input  [1:0] enable,
output [10:0] num
);

	wire feedback = num[9] ^ num[8];
	reg [10:0] temp = num;
	always@(posedge clk)
	begin
		if(enable[0])
		begin
			temp[0]<= feedback;
			temp[1]<= temp[0];
			temp[2]<= temp[1];
			temp[3]<= temp[2];
			temp[4]<= temp[3];
			temp[5]<= temp[4];
			temp[6]<= temp[5];
			temp[7]<= temp[6];
			temp[8]<= temp[7];
			temp[9]<= temp[8];
			temp[10]<= temp[9];
		end
	end

	assign num=temp;
	//Compare(temp, clk, num);
endmodule 
