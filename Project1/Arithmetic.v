module MasterA(
	input [3:0] X,
	input [3:0] Y,
	input [1:0] select,
	output [7:0] out,
	output LED
		);

		wire [3:0] Addresult, Subtresult;
		wire [7:0] Multresult, Divresult;
		wire LEDA, LEDS, LEDM, LEDD;
		reg LEDT;
		wire [7:0] Z = {Y,X};
		
		Adder add(X, Y, Addresult, LEDA);
		Subtractor subt(X, Y, Subtresult, LEDS);
		Mult_2 mult(Z, Multresult, LEDM);
		Div_2 div(Z, Divresult, LEDD);
		
		
		always @(select)
		begin
			case (select)
				0: LEDT = LEDA;
				1: LEDT = LEDS;
				2: LEDT = LEDM;
				3: LEDT = LEDD;
			endcase
			
		end
		
		assign LED = LEDT;
		mux display(Addresult, Subtresult, Multresult, Divresult, select, out);	
		
		
endmodule 
		

		module FullAdder(x, y, s, ci, co);
			input x, y, ci;
			output s, co;
			assign s=x^y^ci;
			assign co=x&y|x&ci|y&ci;	
		endmodule 

		module Adder(
			input [3:0] x,
			input [3:0] y,
			output [3:0] s,
			output c
			);
			
			wire carry[4:0];
			assign carry[0] = 0;
			genvar i;
			generate
				for(i=0; i<4; i = i + 1)
				begin:addbit
					FullAdder fOne(x[i],y[i],s[i], carry[i], carry[i+1]);
				end
			endgenerate 
			assign c = carry[4];
		endmodule 

		module Subtractor(
			input [3:0] A,
			input [3:0] B,
			output [3:0] out,
			output reg led
			);
			always @(A | B)
			begin
				if (B>A)
				begin
					led=1;
				end
				else
				begin
					led=0;
				end
			end
			
			wire [3:0] b;
			assign b = ~B + 1;
			
			assign out= A+ b;
endmodule
			
		module Mult_2(in, out, carry);
			input [7:0] in;
			output [7:0] out;
			output carry;
			
			wire [8:0] c;
			reg o;
			
			assign c = in << 1;
			
			always @(in)
			begin
				if (in[7] == 1)
					begin
						o = 1;
					end
				else
					begin
						o = 0;
					end
			end
			assign out = c;
			assign carry = o;
			
		endmodule
			
		module Div_2(in, out, remain);
			input [7:0] in;
			output [7:0] out;
			output remain;
			
			wire [8:0] c;
			reg o;
			
			assign c = in >> 1;
			
			always @(in)
			begin
				if (in[0] == 1)
					begin
						o = 1;
					end
				else 
					begin 
						o = 0;
					end
			end
			assign out = c;
			assign remain = o;
		endmodule 
