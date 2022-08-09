module ALU_Control(Operation, F, ALUop);
    output [2:0] Operation;
    input  [5:0] F;
    input  [1:0] ALUop;

    assign Operation[2] = (F[1] & ALUop[1]) | (ALUop[0]);

    assign Operation[1] =  (~ALUop[1]) | (~F[2]);

    assign Operation[0] = (F[3] | F[0]) & (ALUop[1]);


 
// use   always  block  or  assign  statements   
// only  3  statements   are  required   
 


endmodule
