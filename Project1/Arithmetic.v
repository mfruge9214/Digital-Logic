module FullAdder(x, y, s, ci, co) 
	input x, y, ci;
	output s, co;
	assign s=x^y^ci;
	assign co=x&y|x&ci|y&ci
	
	
endmodule 

module Adder(x[3:0], y[3:0], s[3:0], c)
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
