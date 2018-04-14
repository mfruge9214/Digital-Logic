module Project2_top(
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
	reg [9:0] ledreg;
	reg [10:0] countms;
	wire millisecond;
	wire [10:0] randtime;
	wire [14:0] yourtimew;
	reg [14:0] yourtime;
	reg [10:0] hiscore;
	wire [3:0] thousanths;
	wire [3:0] hundreths;
	wire [3:0] tenths;
	wire [3:0] ones;
	wire [7:0] disp0, disp1, disp2, disp3;
	wire enable; // Every module will activate when a different position of enable is active
	reg enablereg=2'b00;
		
	initial CS = A;
	initial ledreg=10'b0000000000;
	
	lsfr a(MAX10_CLK1_50, enable, randtime[10:0]);
	Clockdivider b(MAX10_CLK1_50, enable, millisecond);
	bcdCounter c(MAX10_CLK1_50, enable, ones[3:0], tenths[3:0], hundreths[3:0], thousanths[3:0]);
	bcdDecoder d(ones[3:0], tenths[3:0], hundreths[3:0], thousanths[3:0], disp3[7:0], disp2[7:0], disp1[7:0], disp0[7:0]);
	SevenSegment(disp0, HEX0);
	SevenSegment(disp1, HEX1);
	SevenSegment(disp2, HEX2);
	SevenSegmentOnes(disp3, HEX3);
	
	assign LEDR[9:0]=ledreg[9:0];
	assign enable=enablereg;
	
//	always@(posedge SW[0])
//	begin
//			CS<=A;
//			//enable=1;
//	end
	
//	always@(posedge SW[9])
//	begin
//			CS<=F;
//			//enable=
//	end

	// State A= waiting for signal from KEY[0]
	// State B= lsfr, activate lights using clock divider, make sure KEY[1] isnt pressed
	// State C= Wait for stop signal from KEY[1], save the time from the BCD counter, display the time for a little bit
	// State D= Compare Highscore with saved time
	// State E= Update highscore
	// State F= Show highscore

	always@(negedge KEY[0])
	begin
		if(CS==A)
		begin
			CS<=B;
			enablereg<= 2'b01; //activate lsfr
		end
	end
	
	always@(posedge millisecond)
	begin
		if(CS==B)
		begin
			countms<= countms+1;
			if(countms==randtime)
			begin
				ledreg[9:0]=10'b1111111111;
				enablereg=2'b10; // Allows time to begin changing (look at bcdCounter function)
				CS<=C;
			end
		end
	end		
	
	always@(posedge KEY[1])
	begin
		if(CS==C)
		begin
			ledreg[9:0]=10'b0000000000;
			CS<=D;
		end
	end

endmodule
