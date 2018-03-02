module MasterL(
	input [3:0] X,
	input [3:0] Y,
	input [1:0] select,
	output [7:0] out
	);
	
	wire [7:0] Andout, Orout, Xorout, Notout;
	
	andmod one(X,Y, Andout);
	ormod two(X,Y, Orout);
	xormod three(X,Y, Xorout);
	notmod four({Y,X}, Notout);
	
	mux display(Andout, Orout, Xorout, Notout, select, out);
	
	
	
	
endmodule 

 module andmod(
	input [3:0] X,
	input [3:0] Y,
	output [3:0] out
	);
	
	assign out = X & Y;
endmodule 

 module ormod(
	input [3:0] X,
	input [3:0] Y,
	output [3:0] out
	);
	
	assign out = X | Y;
endmodule 

 module xormod(
	input [3:0] X,
	input [3:0] Y,
	output [3:0] out
	);
	
	assign out = X ^ Y;
endmodule 

 module notmod(
	input [7:0] Z,
	output [7:0] out
	);
	
	assign out = ~Z;
endmodule
