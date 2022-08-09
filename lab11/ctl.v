 module  Control (      RegDST ,
                        Branch    ,
                        MemRead   ,
                        MemtoReg  ,
                        ALUOP ,
                        MemWrite  ,
                        ALUSrc    ,
                        RegWrite  ,

                        op );

 output          RegDST,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
output[1:0]     ALUOP;
input [5:0]     op ;

wire r_format,lw,sw,beq,addi;

assign r_format  =(~op[5] ) & (~op[4] ) & (~op[3] ) & (~op[2] ) & (~op[1]) &(~op[0] ) ; 
assign lw        =(op[5] )  & (~op[4] ) & (~op[3] ) & (~op[2] ) & (op[1] ) &(op[0] ) ; 
assign sw        =(op[5] ) & (~op[4] ) & (op[3] ) & (~op[2] ) & (op[1]) &(op[0] ) ; 
assign beq       =(~op[5] ) & (~op[4] ) & (~op[3] ) & (op[2] ) & (~op[1]) &(~op[0] ) ; 
assign addi      =(~op[5] ) & (~op[4] ) & (op[3] ) & (~op[2] )  & (~op[1]) &(~op[0] ) ;
assign          RegDST=r_format,
                ALUSrc=	(lw)|(sw)|(addi),
                MemtoReg=lw,
                RegWrite=r_format|lw|addi,
                MemRead= lw      ,
                MemWrite=sw      , 
                Branch=beq;

assign  ALUOP[1]=r_format;
assign  ALUOP[0]=beq ;

   
  
   endmodule   
