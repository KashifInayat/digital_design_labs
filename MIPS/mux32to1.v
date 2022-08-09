/*
This code is for 4 bit instruction lines. convert them to 32 bit instruction lines.
*/
module mux_32to1(out, a,b,sel);
output [31:0] out;
input [31:0] a,b;
input sel;
reg [31:0] out;
always @ (sel or a or b)
  if(sel==0)
  out = a;
  else
  out = b;
endmodule
