/*
This code is for 4 bit I/O. convert it to 32 I/O.
*/

module pc (out , in ,clk, rst);
output [31:0] out;
input [31:0] in;
input clk,rst;
reg [31:0]out;
always @ (posedge clk or posedge rst)
  if(rst==1)
  out = 0;
  else
  out = in;
endmodule
