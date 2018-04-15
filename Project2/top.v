module Project_2(
	input [1:0] KEY,
	input [9:0] SW,
	input MAX10_CLK1_50,
	output [7:0]HEX0,
	output [7:0]HEX1,
	output [7:0]HEX2,
	output [7:0]HEX3,
	output [7:0]HEX4,
	output [7:0]HEX5,
	output [9:0]LEDR
	);
	
	parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b100; // define states
	
	reg [2:0] CS; // holds current state
	reg enablelfsr;
	reg enablecounter;
	reg trigger;// Enables change of state
	wire [10:0] randtime;
	wire millisecond;
	wire [3:0] ones;
	wire [3:0] tens;
	wire [3:0] hundreds;
	wire [3:0] thousands;
	
	initial
	begin
		enablelfsr=0;
		enablecounter=0;
		CS=A;
		trigger=0;
	end
	//assign wenablecounter=1;
	
//	always@(KEY[0])
//	begin
//		if(KEY[0])
//		begin
//			enablecounter<=1;
//		end
//		else
//		begin
//			enablecounter<=0;
//		end
//	end
	
	bcdCounter(millisecond, enablecounter, ones, tens, hundreds, thousands);
	Clockdivider aa(MAX10_CLK1_50, millisecond);
	lfsr a(MAX10_CLK1_50, enablelfsr, randtime);
	bcdDecoder q(randtime[3], randtime[2], randtime[1], randtime[0], HEX0, HEX1, HEX2, HEX3);
	SevenSegment bb(CS, HEX5);
	SevenSegment cc(KEY[0], HEX4);
	
	always@(*)
	begin
		if(KEY[0]==0)
		begin
			trigger=1;
			if((KEY[0]==0) && trigger)
			begin
				CS<=B;
			end
		end
	end
		
//		else if(CS==B)
//		begin
//			enablelfsr<=1; //Activate lsfr
//			if(KEY[0]==1)
//			begin
//			enablelfsr<=0;//Deactivate LFSR after an instant
//			CS<=C;
//			end
//		end
//	end
		
//		else if(CS==C and KEY[1]==1)
//		begin
//			ledreg[9:0]=10'b0000000000;
//			enablereg= 2'b00;
//			CS<=D;
//		end
//		else if(CS==F)
//		begin
//			CS<=A;
//		end
//		
//		
//	end 
//	
//	
//	always@(posedge millisecond)
//	begin
//		if(CS==B)
//		begin
//			countms<= countms+1;
//			if(countms==randtime)
//			begin
//				ledreg[9:0]=10'b1111111111;
//				enablelfsr=1; // Allows time to begin changing (look at bcdCounter function)
//				CS<=C;
//			end
//		end
//	end		
	
	
endmodule
	
