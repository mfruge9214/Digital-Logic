module MasterC(
	input [3:0] X,
	input [3:0] Y,
	input [1:0] select,
	output [7:0] out
	);
	
	wire [7:0] sigbit1, sigbit2, sigbit3, sigbit4;
	
	Equalmod(X, Y, sigbit1);
	Greatermod(X, Y, sigbit2);
	LessThanmod(X, Y, sigbit3);
	Maxmod(X, Y, sigbit4);
	
	mux comparedisplay(sigbit1, sigbit2, sigbit3, sigbit4, select, out);
endmodule

module Equalmod(
	input [3:0] x,
	input [3:0] y,
	output [7:0] out
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
	//assign out[0]=equal;
	assign out[0] = equal;
endmodule 



module Greatermod(
	input [3:0] x,
	input [3:0] y,
	output [7:0] out
	);
	
	reg equal;
	always @(x or y)
	begin
		if (x>y)
		begin
			equal = 1;
		end
		else 
		begin
			equal = 0;
		end
	end
	assign out[0]=equal;
endmodule 

module LessThanmod(
	input [3:0] x,
	input [3:0] y,
	output [7:0] out
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



module Maxmod(
	input [3:0] x,
	input [3:0] y,
	output reg [7:0] out
	);
	reg truth;
	reg equal;
	
	always @(*)
	begin
		case(x)

			4'b0000 : truth <= y[3] | y[2] | y[1] | y[0];
			4'b0001 : truth <= y[3] | y[2] | y[1];
			4'b0010 : truth <= y[3] | y[2] | (y[1]&y[0]);
			4'b0011 : truth <= y[3] | y[2];
			4'b0100 : truth <= y[3] | (y[2]&y[1]) | (y[2]&y[0]);
			4'b0101 : truth <= y[3] | (y[2]&y[1]);
			4'b0110 : truth <= y[3] | (y[2]&y[1]&y[0]);
			4'b0111 : truth <= y[3];
			4'b1000 : truth <= (y[3] & y[2]) | (y[3]&y[1]) | (y[3]&y[0]);
			4'b1001 : truth <= (y[3] & y[2]) | (y[3]&y[1]);
			4'b1010 : truth <= (y[3] & y[2]) | (y[3]&y[1]&y[0]);
			4'b1011 : truth <= (y[3] & y[2]);
			4'b1100 : truth <= (y[3] & y[2] & y[0]) | (y[3]&y[2]&y[1]);
			4'b1101 : truth <= (y[3] & y[2] & y[1]);
			4'b1110 : truth <= (y[3] & y[2] & y[1] & y[0]);
			4'b1111 : truth <= 0;
		endcase
	
	
	if(truth == 1)
		begin 
			out = y;
		end
	else if(truth == 0)
		begin
			out = x;
		end
	else
		begin 
			out = 0;
		end 
	end
	
endmodule 
