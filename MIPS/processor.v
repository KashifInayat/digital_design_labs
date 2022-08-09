module single_cycle_microprocessor (processor_out , clk , rst );

output [31:0] processor_out;
input clk , rst;

wire [31:0] pc_out,add4_out,instruction;
wire [3:0] frm_pc;
wire [5:0] opcode;
wire [4:0] Rs , Rt , Rd , mux1_out;
wire [15:0] Imm;
wire [5:0] FC;
wire [1:0] ALUOP;
wire [31:0] regA_out,regB_out,mux2_out;
wire [2:0] Operation;
wire [31:0] sign_out,sh_left_out,add_out,mux3_out ;
wire [31:0] ALU_OUT,data_out,mux4_out;
wire [3:0] ALU_Out_Adress;
wire PCSrc;
wire Branch , ALU_zero;


assign frm_pc = pc_out[5:2];
assign Rs = instruction[25:21];
assign Rt = instruction[20:16];
assign Rd = instruction[15:11];
assign opcode = instruction[31:26];
assign Imm = instruction[15:0];
assign  FC = Imm[5:0];
assign ALU_Out_Adress = ALU_OUT[5:2];
assign PCSrc = Branch & ALU_zero;
assign processor_out=mux4_out;          

pc  PC(.out(pc_out) , .in(mux3_out) ,.clk(clk), .rst(rst));

add_4   ADD_4(.out(add4_out) , .in(pc_out));

instruction_memory  INST_MEM ( .data_out(instruction) , .address(frm_pc)) ;

mux_5to1  MUX_1(.out(mux1_out),.a(Rt),.b(Rd),.sel(RegDST));

Control  CONTROL(.RegDST(RegDST) , .Branch(Branch) , .MemRead(MemRead) , .MemtoReg(MemtoReg) ,.ALUOP(ALUOP) ,.MemWrite(MemWrite) ,.ALUSrc(ALUSrc) ,.RegWrite(RegWrite) ,.op(opcode) );

register_file REGISTER(.data_out1(regA_out),.data_out2(regB_out),.data_in(mux4_out),.wr(mux1_out),.wr_enable(RegWrite),.rd1(Rs),.rd2(Rt),.clk(clk),.rst(rst));

Sign_Ext  SIGN_EXT(.out (sign_out)  , .in(Imm) );

mux_32to1  MUX_2(.out(mux2_out),.a(regB_out),.b(sign_out),.sel(ALUSrc));

ALU_Control  ALU_CONTROL(.Operation(Operation), .F(FC), .ALUop(ALUOP));

ALU  ALU_32bit( .OUT(ALU_OUT) ,.ALU_zero( ALU_zero) , .A(regA_out),.B(mux2_out) , .ALU_Control(Operation) );

shift_left2  Shift_Left_2(.out(sh_left_out) , .in(sign_out)) ;

add  ADD_32bit(.out(add_out),.a(add4_out),.b(sh_left_out));

mux_32to1  MUX_3(.out(mux3_out), .a(add4_out),.b(add_out),.sel(PCSrc));

data_memory   DATA_MEM(.data_out( data_out) ,.address( ALU_Out_Adress) ,.data_in(regB_out) ,.wr(MemWrite),.clk(clk) ) ;

mux_32to1  MUX_4(.out(mux4_out),.a(ALU_OUT),.b(data_out),.sel(MemtoReg));


endmodule
