module Project1_top(
	input [1:0]KEY,
	input [9:0]SW,
	input MAX10_CLK1_50,
	//input ADC_CLK_10,
	output [7:0]HEX0,
	output [7:0]HEX1,
	output [7:0]HEX2,
	output [7:0]HEX3,
	output [7:0]HEX4,
	output [7:0]HEX5,
	output [9:0]LEDR
	);
		
	wire [3:0] X, Y; // adder and subtractor inputs
	wire [7:0] Vone, Vtwo, Vthree;
	wire [9:0] Vfour;
	wire [1:0] select;
	
	
	assign X[3:0] = SW[3:0];
	assign Y[3:0] = SW[7:4];
	assign select[1:0] = SW[9:8];
		
	reg [1:0] buttons =0;
	
	always @(posedge KEY[0])
		begin
			buttons = buttons + 1;
		end
		
	wire c;
	wire [7:0] choice;
	reg [9:0]LEDT;
	
	MasterA Arith(X, Y, select, Vone, LED);
	MasterL Logical(X, Y, select, Vtwo);
	MasterC Comp(X,Y,select, Vthree);
	MasterM magical(MAX10_CLK1_50, Vfour);
		
	mux choose(Vone, Vtwo, Vthree, 0, buttons, choice);
	
	SevenSegment(choice[3:0], HEX0);
	SevenSegment(choice[7:4], HEX1);
	SevenSegment(X, HEX2);
	SevenSegment(Y, HEX3);
	SevenSegment(select, HEX4);
	SevenSegment(buttons, HEX5);
	always @(KEY)
	begin
	case(buttons)
		0: LEDT[9] <= LED;
		1: LEDT[9:0] <=0;
		2: LEDT[9:0] <=0;
		3: LEDT[9:0] <= Vfour;
	endcase
	end
	
	assign LEDR= LEDT;

endmodule 
