/*
This code is for 4*4 instruction_memory. convert it to 16*32 instruction_memory.
*/

module instruction_memory ( data_out , address) ;
output [31:0] data_out ;
reg [31:0] data_out ;

input [3:0] address ;
wire [3:0] address ;

//}} End of automatically maintained section
always@( address )
case(address)                
0:  data_out=32'h20010004;   
1:  data_out=32'h20020008;
2:  data_out=32'h00411820;
3:  data_out=32'h00622022;
4:  data_out=32'h0083282a;
5:  data_out=32'hac020004;
6:  data_out=32'h8c020004;
7:  data_out=32'h00000000;
8:  data_out=32'h00000000;
9:  data_out=32'h00000000;
10:  data_out=32'h00000000;
11:  data_out=32'h00000000;
12:  data_out=32'h00000000;
13:  data_out=32'h00000000;
14:  data_out=32'h00000000;
15:  data_out=32'h00000000;
endcase 
endmodule
