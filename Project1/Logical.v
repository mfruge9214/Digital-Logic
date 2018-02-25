module and([3:0]x, [3:0] y, [3:0] out);
      input x, y;
      output out;
      assign out=x & y;
endmodule

module or([3:0]x, [3:0] y, [3:0] out);
      input x, y;
      output out;
      assign out=x | y;
endmodule

module exor([3:0]x, [3:0] y, [3:0] out);
      input x, y;
      output out;
      assign out=x ^ y;
endmodule

module not([7:0]z, [7:0] out);
      input z;
      output out;
      assign out= ~z;
endmodule
