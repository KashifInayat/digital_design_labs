    module ALU ( OUT , ALU_zero ,  A , B , ALU_Control );

    output [31:0] OUT ;
    output        ALU_zero ;
    input  [31:0] A , B;
    input  [2:0]  ALU_Control ;
    
    reg    [31:0] OUT;  

    assign ALU_zero  = ~ ( | OUT ) ;  // ALU_zero = 1  when  OUT =0 ;

    wire   [31:0] DIFF = A - B ; 
   
    always @ ( A or B or ALU_Control or DIFF)

    case(ALU_Control)

    3'b000 :     OUT = A & B  ;
    3'b001 :     OUT = A | B  ;
    3'b010 :     OUT = A + B  ;
    3'b110 :     OUT = DIFF  ;
    3'b111 :     OUT = { {31{1'b0}} , DIFF[31] } ; // OUT  =00...001 when A < B 
    ///3'b111 for slt instruction                  // DIFF[31] =1    when A < B
    default :    OUT = 32'hxxxxxxxx ;              
    endcase 
    
    endmodule                    
