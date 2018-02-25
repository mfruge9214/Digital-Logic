module FullAdder(x, y, s, ci, co);
	input x, y, ci;
	output s, co;
	assign s=x^y^ci;
	assign co=x&y|x&ci|y&ci
	
	
endmodule 

		module Adder(x[3:0], y[3:0], s[3:0], c);
output s[3:0];
wire carry[3:0];
assign carry[0] = 0;
genvar i;
generate
for(i=0; i<4; i++)
	FullAdder add(x[i],y[i],s[i], c[i], c[i+1])
endgenerate 
c = carry[3];
endmodule 

	module subtractor([3:0] A, [3:0] B, [3:0] out);
input A, B;
output out;
genvar i=0;
	for(i=0; i<4; i=i+1)
    if B[i]==0
        B[i]=1;
    else
        B[i]=0;
	end
B=B+1;
FullAdder(A, B, out)
endmodule
	
module mult_2([7:0] in, [7:0] out, carry):
	input in;
	output out, carry;
	assign carry=0;
	if in[7]==1
		assign carry=1;
	end
	assign out= in<<1;
endmodule
	
	module div_2([7:0] in, [7:0] out, remain):
		input in;
		output out, remain;
		assign remain=0;
		if in[0]==1;
			assign remain=1;
		end
		assign out= in>>1;
	endmodule
