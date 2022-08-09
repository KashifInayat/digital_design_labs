This code is for 4*4 register file. convert it to 32*32 register file.
*/
module register_file (data_out1,data_out2,data_in,wr,wr_enable,rd1,rd2,clk,rst);
output [31:0] data_out1,data_out2;
input [31:0] data_in;
input [4:0] wr,rd1,rd2;
input wr_enable,clk,rst;
reg [31:0] registers [31:0];

wire [31:0] R0 = registers[0],
            R1 = registers[1],
            R2 = registers[2],
            R3 = registers[3],
            R4 = registers[4],
            R5 = registers[5],
            R6 = registers[6];

assign data_out1=registers[rd1];
assign data_out2=registers[rd2];
integer i;
always@(posedge clk  or posedge rst)
if(rst==1) begin for(i=0;i<=31;i=i+1) registers[i]<=0;end
else if (wr_enable==1)
registers[wr]<=data_in;

initial begin
registers[0] = 0;
registers[1] = 4;
registers[2] = 8;
registers[3] = 2;
end

endmodule
