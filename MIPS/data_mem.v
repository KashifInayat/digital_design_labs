/*
This code is for 4*4 data_memory. convert it to 16*32 data_memory.
*/
module data_memory ( data_out , address,data_in ,wr,clk ) ;
output [31:0] data_out;
input [31:0] data_in;
input [3:0] address;
input wr,clk;

reg [31:0] data_mem [15:0];

assign data_out=data_mem[address];

always @ (posedge clk )
if (wr==1)
data_mem[address]=data_in;

endmodule
