//module Master C


module Equal(
	input [3:0] x,
	input [3:0] y,
	output [3:0] out
	);
	
	reg equal;
	always @(x | y)
	begin
		if (x==y)
		begin
			equal =1;
		end
		else 
		begin
			equal =0;
		end
	end
	assign out[0]=equal;
endmodule 



module Greater(
	input [3:0] x,
	input [3:0] y,
	output [3:0] out
	);
	
	reg equal;
	always @(x | y)
	begin
		if (x>y)
		begin
			equal =1;
		end
		else 
		begin
			equal =0;
		end
	end
	assign out[0]=equal;
endmodule 

module LessThan(
	input [3:0] x,
	input [3:0] y,
	output [3:0] out
	);
	
	reg equal;
	always @(x | y)
	begin
		if (x<y)
		begin
			equal =1;
		end
		else 
		begin
			equal =0;
		end
	end
	assign out[0]=equal;
endmodule 



module Max(
	input [3:0] x,
	input [3:0] y,
	output [3:0] out
	);
	reg truth;
	wire [3:0] equal;
		case(x)
		4'b0000 : assign truth= y[3] | y[2] | y[1] | y[0];
		4'b0001 : assign truth= y[3] | y[2] | y[1];
		4'b0010 : assign truth= y[3] | y[2] | (y[1]&y[0]);
		4'b0011 : assign truth= y[3] | y[2];
		4'b0100 : assign truth= y[3] | (y[2]&y[1]) | (y[2]&y[0]);
		4'b0101 : assign truth= y[3] | (y[2]&y[1]);
		4'b0110 : assign truth= y[3] | (y[2]&y[1]&y[0]);
		4'b0111 : assign truth= y[3];
		4'b1000 : assign truth= (y[3]&y[2]) | (y[3]&y[1]) | (y[3]&y[0]);
		4'b1001 : assign truth= (y[3]&y[2]) | (y[3]&y[1]);
		4'b1010 : assign truth= (y[3]&y[2]) | (y[3]&y[1]&y[0]);
		4'b1011 : assign truth= (y[3]&y[2]);
		4'b1100 : assign truth= (y[3]&y[2]&y[0]) | (y[3]&y[2]&y[1]);
		4'b1101 : assign truth= (y[3]&y[2]&y[1]);
		4'b1110 : assign truth= (y[3]&y[2]&y[1]&y[0]);
		4'b1111 : assign truth= 0;
		endcase
	Equal (x,y, equal);
	if equal[0]==1
		begin
		assign out[0]=0;
		
		end	
	if truth==1
		begin
		assign out=y;
		end	
	else
		begin
		assign out=x;
		end		
endmodule 
