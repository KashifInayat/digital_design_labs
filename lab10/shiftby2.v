This code is for 16 bit I/O. convert it to 32 bit I/O.
*/

module shift_left2( out , in) ;
output [31:0] out;
input [31:0] in;

assign out=in << 2;
endmodule
