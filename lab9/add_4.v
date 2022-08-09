/*
This code is for 4 bit I/O. convert it to 32 I/O.
*/

module add_4  (out , in);
output  [31:0] out;
input   [31:0] in;

assign out= in + 4;
endmodule
