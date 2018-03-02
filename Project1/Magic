module MasterM(
	input CLK,
	output reg [9:0]leds
	);
	
	reg [11:0] driver;
	reg [9:0] lights;
	reg direction; // 0 = <<, 1=>>
	
	initial
		begin
			driver = 12'b0000000011;
			lights = 10'b00000001;
		end
		
	reg move =0;
		
	reg[17:0] counter=0;
	always @(posedge CLK)
	begin
		counter=counter+1;
		if (counter== 18'b11111111111111111111)
		begin
			move= ~move;
			counter=0;
			
		end
	end
		
		always @(posedge move)
		begin
			if (driver[0]==1)
				begin
				driver= driver<<1;
					direction = 0;
				end
			else if(driver[0]==0 & driver[11]==0)
				begin
					if (direction==0)
					begin
						driver = driver<<1;
					end
					else
					begin
						driver = driver>>1;
					end
				end
			else if(driver[11]==1)
			begin
				driver=driver>>1;
				direction =1;
			end
			lights[9:0] = driver[10:1];
		end

always @(lights)
begin
	leds = lights;
end
		
endmodule 
