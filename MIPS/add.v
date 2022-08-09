/*
This code is for 4 bit I/O. convert it to 32 I/O.
*/
module add (out,a,b);
output [31:0] out;
input [31:0] a,b;

assign out=a+b;
endmodule
