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



module stim;
    
    reg clk,rst,push_button;
    wire [15:0] pc;
    
    counter_pushbutton counter_pushbutton_inst
    (
    .clk(clk),
    .rst(rst),
    .push_button(push_button),
    .pc(pc)
    );
    
    
    always
       #5 clk = ~clk;
       
       
    initial
      begin
         push_button = 1'b0;
         rst = 1'b0;
         clk = 1'b0;
         #1 rst = 1'b1;
         #1 rst = 1'b0;
         
         #10 push_button = 1'b1;
         #10 push_button = 1'b0;
         
         #20 push_button = 1'b1;
         #50 push_button = 1'b0;
         
         #20 push_button = 1'b1;
         #50 push_button = 1'b0;
         
         #20 push_button = 1'b1;
         #50 push_button = 1'b0;
         
         #10 rst = 1'b1;
         #1 rst = 1'b0;
         
         #20 push_button = 1'b1;
         #50 push_button = 1'b0;
         
         
         #20 push_button = 1'b1;
         #50 push_button = 1'b0;
         
                  
         #100 $stop;
         
         
      end
      
  endmodule 