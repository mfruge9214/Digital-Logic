module Project_2_top(
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
	
	
	
	parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b100;
	reg CS=3'b000;
	wire [10:0] randomnum;
	wire [10:0] randtime;
	wire [10:0] meastime;
	reg [10:0] savetime;
	reg [10:0] hiscore;
	
	always@(posedge SW[0])
	begin
		CS=A;
	end
	
	always@(posedge SW[9])
	begin
		CS=F;
	end
	
	
	// State 0
	// KEY[0]= Start
	if(CS==A) // Initialize 7-seg to 0's
	begin
		// Do Nothing, wait for KEY[0] to be 1 or SW[0] to be 1
		always@(negedge KEY[0])
		begin
			CS<=B;
		end
	end
	
	if(CS==B)
	begin
		if(LEDR[9:0] ==0 & KEY[1]==1) // 'Delaying the Measurement'
		begin
			CS=B;
		end
		if(LEDR[9:0] ==0 & KEY[1]==0)
		begin
			CS=C;
		end
	end
	
	if(CS==C)
	begin
		lfsr shift(MAX10_CLK1_50, randomnum[10:0]);
		clockdivider first(MAX10_CLK1_50, randomnum[10:0],0, LEDR[9:0], randtime[10:0]);
		CS=D;
	end
	
	
	if(CS==D)
	begin
		if(KEY[1]==0)
		begin
			clockdivider second(MAX10_CLK1_50, 0,1, LEDR[9:0], meastime[10:0])
			// meastime goes to counter, which outputs to the decoder
		end
		always@(posedge KEY[1])
		begin
			savetime = meastime[10:0];
			CS=E;
		end
	end
	
	if(CS==E)
	begin
		LEDR[9:0]=10'b0000000000;
		// show savetime on seven seg
		if(savetime<hiscore)
		begin
			hiscore=savetime;
			assign LEDR[9:0]=10'b1010101010;
		end
		always@(posedge KEY[1])
		begin
			CS=F;
		end
	end
	
	
	if(CS==F)
	begin
		//Display Highscore
		always@(posedge KEY[1])
		begin
			CS=A;
		end
	end
endmodule
		
	
	
	
	
	
	
	
	
