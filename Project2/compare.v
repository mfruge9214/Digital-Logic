module Compare(
input [10:0] in,
input clk,
output [10:0] val
);

reg cutoff= 11'b01000000000;

always@(posedge clk)
if (in < cutoff)
	begin
		lfsr(clk);
	end
else
	begin
		val <= in;
	end
endmodule 
