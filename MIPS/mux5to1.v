module mux_5to1(out, a,b,sel);
output [4:0] out;
input [4:0] a,b;
input sel;
reg [4:0] out;
always @ (sel or a or b)
  if(sel==0)
  out = a;
  else
  out = b;
endmodule
