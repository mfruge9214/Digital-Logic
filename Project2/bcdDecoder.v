module SevenSegment(value, disp);
input [3:0] value;
output reg [7:0] disp;

	always @(*)
	begin
		case(value)
			0 : disp [7:0] <= 8'b11000000;// 0 <= 7'h7E;
			1 : disp [7:0] <= 8'b11111001;// 1 <= 7'h60;
			2 : disp [7:0] <= 8'b10100100;// 2 <= 7'h6D;
			3 : disp [7:0] <= 8'b10110000;// 3 <= 7'h79;
			4 : disp [7:0] <= 8'b10011001;// 4 <= 7'h33;
			5 : disp [7:0] <= 8'b10010010;// 5 <= 7'h5B;
			6 : disp [7:0] <= 8'b10000010;// 6 <= 7'h5F;
			7 : disp [7:0] <= 8'b11111000;// 7 <= 7'h70;
			8 : disp [7:0] <= 8'b10000000;// 8 <= 7'h7F;
			9 : disp [7:0] <= 8'b10011000;// 9 <= 7'h7B;
		endcase
	end

endmodule

module SevenSegmentOnes(value, disp);
input [3:0] value;
output reg [7:0] disp;

	always @(*)
	begin
		case(value)
			0 : disp [7:0] <= 8'b01000000;// 0 <= 7'h7E;
			1 : disp [7:0] <= 8'b01111001;// 1 <= 7'h60;
			2 : disp [7:0] <= 8'b00100100;// 2 <= 7'h6D;
			3 : disp [7:0] <= 8'b00110000;// 3 <= 7'h79;
			4 : disp [7:0] <= 8'b00011001;// 4 <= 7'h33;
			5 : disp [7:0] <= 8'b00010010;// 5 <= 7'h5B;
			6 : disp [7:0] <= 8'b00000010;// 6 <= 7'h5F;
			7 : disp [7:0] <= 8'b01111000;// 7 <= 7'h70;
			8 : disp [7:0] <= 8'b00000000;// 8 <= 7'h7F;
			9 : disp [7:0] <= 8'b00011000;// 9 <= 7'h7B;
		endcase
	end

endmodule

module bcdDecoder( 
	//input [2:0] state,
	input [3:0] ones,
	input [3:0] tenths,
	input [3:0] hundreths,
	input [3:0] thousandths,
//	output reg [7:0] disp0,
//	output reg [7:0] disp1,
//	output reg [7:0] disp2,
//	output reg [7:0] disp3	
	output [7:0] disp0,
	output [7:0] disp1,
	output [7:0] disp2,
	output [7:0] disp3	
	);

//	reg [7:0] segZero, segOne, segTwo, segThree;
//	always @(state)
//		begin
//		if(state != 3) // state is before D
//		begin
//			segZero = 0;
//			segOne = 0;
//			segTwo = 0;
//			segThree = 0;
//			
//		end
		
//		else if(state[2]) // if state E or F
		//begin
//			assign segThree = ones;
//			assign segTwo = tenths;
//			segOne = hundreths;
//			segZero = thousandths;
		//end	
	//end

	assign disp0 = ones;
	assign disp1 = tenths;
	assign disp2 = hundreths;
	assign disp3 = thousandths;
	
	
	SevenSegmentOnes(ones, disp3); // displays decimal to indicate seconds
	SevenSegment(tenths, disp2);
	SevenSegment(hundreths, disp1);
	SevenSegment(thousandths, disp0);
	
endmodule 
