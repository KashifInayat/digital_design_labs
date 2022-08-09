`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:            Iqra University 
// Engineer:           Kashif Inayat
// 
// Create Date:          18-Jan-2011 
// Design Name: 
// Module Name:          counter_pushbutton 
// Project Name: 
// Tool versions: 
// Description:          This module implements a counter which increments
//                       whenever a "push_button" is pressed. This ciruit employs
//                        asynchronous reset. Whenever reset is pressed the counter
//                        value becomes zero.
//
//                        INPUTS
//                        -clk
//                        -rst   for reset. Resets circuit on positive edge of rst
//                        -push_button   This signal is made high (i.e pressed) to
//                                       increment the counter
//
//                        OUTPUTS
//                        -pc   The output counter value (16 bits)
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////



module counter_pushbutton(
	input 	clk,
	input rst,
	input 	push_button,
     input updown, 
	output [15:0] pc
    );
    

reg [15:0] pc_r;
reg	 push_button_r, pc_en;			
 

always@(posedge clk or posedge rst)
begin
    if (rst)
       push_button_r <= 1'b0;
    else
       push_button_r <= push_button;
end

// pc_r and push_button_r are hardware registers

always@* 
   pc_en <= push_button & ~ push_button_r;
   
   
always@(posedge pc_en or posedge rst)
begin
    if (rst)
       pc_r <= 1'b0;
    else if (updown==1)
       pc_r <= pc+1;
   
   else if (updown==0)
       pc_r <= pc-1;

   else  
   pc_r <=pc_r; 
end


assign pc = pc_r;


endmodule
